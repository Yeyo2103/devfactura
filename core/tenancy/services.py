"""Provisioning helpers for the superadmin module.

Creating a tenant (Company) must also set up everything it needs to operate:
its SRI receipts (sequences), a subscription, and an initial company admin user.
"""
from datetime import date, timedelta

from django.contrib.auth.models import Group
from django.db import transaction

from core.pos.choices import VOUCHER_TYPE
from core.pos.models import Company, Receipt
from core.tenancy.models import Subscription
from core.user.models import User

ADMIN_GROUP_NAME = 'Administrador'


def create_company_receipts(company):
    """Create the three SRI receipt sequences for a company (idempotent)."""
    receipts = []
    for voucher_type, _ in VOUCHER_TYPE:
        receipt, _created = Receipt.all_objects.get_or_create(
            company=company,
            voucher_type=voucher_type,
            establishment_code=company.establishment_code,
            issuing_point_code=company.issuing_point_code,
            defaults={'sequence': 0},
        )
        receipts.append(receipt)
    return receipts


def create_subscription(company, plan, status='active', start=None):
    start = start or date.today()
    end = start + timedelta(days=plan.duration_days) if plan.duration_days else None
    subscription, created = Subscription.objects.get_or_create(
        company=company,
        defaults={'plan': plan, 'status': status, 'start_date': start, 'end_date': end},
    )
    if not created:
        subscription.plan = plan
        subscription.status = status
        subscription.start_date = start
        subscription.end_date = end
        subscription.save()
    return subscription


def create_company_user(company, username, password, names=None, email=None, group=None, is_active=True):
    """Create a user that belongs to a company (tenant)."""
    user = User(
        username=username,
        names=names or username,
        email=email or '',
        company=company,
        is_superadmin=False,
        is_active=is_active,
    )
    user.set_password(password)
    user.save()
    if group is not None:
        user.groups.add(group)
    return user


def create_company_admin(company, username, password, names=None, email=None):
    group, _ = Group.objects.get_or_create(name=ADMIN_GROUP_NAME)
    return create_company_user(company, username, password, names=names, email=email, group=group)


@transaction.atomic
def provision_company(*, company_data, plan, admin_username, admin_password,
                      admin_names=None, admin_email=None, subscription_status='active'):
    """Create a fully-working tenant. Returns (company, subscription, admin_user)."""
    company = Company(**company_data)
    # Required-but-not-collected fields get safe defaults.
    if not company.special_taxpayer:
        company.special_taxpayer = '000'
    company.save()
    create_company_receipts(company)
    subscription = create_subscription(company, plan, status=subscription_status)
    admin_user = create_company_admin(
        company, admin_username, admin_password, names=admin_names, email=admin_email,
    )
    return company, subscription, admin_user
