"""Auto-stamp the company FK on tenant-scoped models when created.

Combined with TenantManager (which filters reads by the current company),
this keeps multi-tenant isolation transparent for the existing views which
create objects without explicitly setting ``company``.
"""
from crum import get_current_user
from django.db.models.signals import pre_save
from django.dispatch import receiver

# Models with a direct ``company`` FK that should be stamped on create.
TENANT_MODEL_LABELS = {
    'pos.product', 'pos.category', 'pos.customer', 'pos.provider',
    'pos.expense', 'pos.expensetype', 'pos.purchase', 'pos.promotion',
    'pos.receipt', 'pos.invoice', 'pos.creditnote', 'pos.quotation',
}


@receiver(pre_save)
def stamp_company(sender, instance, **kwargs):
    try:
        label = sender._meta.label_lower
    except Exception:
        return
    if label not in TENANT_MODEL_LABELS:
        return
    if getattr(instance, 'company_id', None) is not None:
        return
    user = get_current_user()
    if user is not None and getattr(user, 'is_authenticated', False):
        company_id = getattr(user, 'company_id', None)
        if company_id is not None:
            instance.company_id = company_id
