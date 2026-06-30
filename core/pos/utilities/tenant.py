"""Multi-tenant helpers: current-company resolution and an auto-scoping manager.

The current company is derived from the logged-in user (``user.company``) using
``crum`` so it works transparently inside request handling, model methods and
the SRI emission flow.
"""
from crum import get_current_request, get_current_user
from django.db import models


def get_current_company():
    """Return the Company of the current logged-in user, or None.

    Superadmins (platform owners) and anonymous/system contexts return None.
    """
    user = get_current_user()
    if user is not None and getattr(user, 'is_authenticated', False):
        return getattr(user, 'company', None)
    return None


def get_current_company_id():
    user = get_current_user()
    if user is not None and getattr(user, 'is_authenticated', False):
        return getattr(user, 'company_id', None)
    return None


class TenantManager(models.Manager):
    """Default manager that scopes rows to the current user's company.

    - Regular users / customers: only rows of their company.
    - Superadmins and system/anonymous contexts: no filtering (see all).

    A separate unfiltered manager (``all_objects``) must be declared on each
    model and set as ``base_manager_name`` so Django internals (relations,
    cascade deletes) are never silently filtered.
    """

    def get_queryset(self):
        queryset = super().get_queryset()
        user = get_current_user()
        if user is not None and getattr(user, 'is_authenticated', False):
            if not getattr(user, 'is_superadmin', False):
                company_id = getattr(user, 'company_id', None)
                if company_id is not None:
                    return queryset.filter(company_id=company_id)
        return queryset
