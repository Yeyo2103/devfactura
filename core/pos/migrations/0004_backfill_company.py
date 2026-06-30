from django.db import migrations


CATALOG_MODELS = [
    'Category', 'Customer', 'Expense', 'ExpenseType', 'Product',
    'Promotion', 'Provider', 'Purchase', 'Receipt',
]


def backfill_company(apps, schema_editor):
    Company = apps.get_model('pos', 'Company')
    company = Company.objects.order_by('id').first()
    if company is None:
        return
    for model_name in CATALOG_MODELS:
        Model = apps.get_model('pos', model_name)
        Model.objects.filter(company__isnull=True).update(company=company)


def noop(apps, schema_editor):
    pass


class Migration(migrations.Migration):

    dependencies = [
        ('pos', '0003_category_company_customer_company_expense_company_and_more'),
    ]

    operations = [
        migrations.RunPython(backfill_company, noop),
    ]
