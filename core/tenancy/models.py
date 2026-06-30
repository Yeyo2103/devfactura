from datetime import date, timedelta

from django.db import models
from django.forms.models import model_to_dict


class Plan(models.Model):
    name = models.CharField(max_length=50, unique=True, verbose_name='Nombre del plan')
    description = models.CharField(max_length=300, null=True, blank=True, verbose_name='Descripción')
    price = models.DecimalField(max_digits=9, decimal_places=2, default=0.00, verbose_name='Precio mensual')
    # 0 = ilimitado
    max_invoices_per_month = models.PositiveIntegerField(default=0, verbose_name='Máx. facturas por mes (0 = ilimitado)')
    max_users = models.PositiveIntegerField(default=0, verbose_name='Máx. usuarios (0 = ilimitado)')
    duration_days = models.PositiveIntegerField(default=30, verbose_name='Duración (días)')
    is_active = models.BooleanField(default=True, verbose_name='Activo')

    def __str__(self):
        return f'{self.name} (${self.price})'

    @property
    def unlimited_invoices(self):
        return self.max_invoices_per_month == 0

    @property
    def unlimited_users(self):
        return self.max_users == 0

    def as_dict(self):
        item = model_to_dict(self)
        item['price'] = float(self.price)
        return item

    class Meta:
        verbose_name = 'Plan'
        verbose_name_plural = 'Planes'
        ordering = ['price']
        default_permissions = ()
        permissions = (
            ('view_plan', 'Can view Plan'),
            ('add_plan', 'Can add Plan'),
            ('change_plan', 'Can change Plan'),
            ('delete_plan', 'Can delete Plan'),
        )


SUBSCRIPTION_STATUS = (
    ('trial', 'Prueba'),
    ('active', 'Activa'),
    ('suspended', 'Suspendida'),
    ('expired', 'Vencida'),
    ('cancelled', 'Cancelada'),
)


class Subscription(models.Model):
    company = models.OneToOneField('pos.Company', on_delete=models.CASCADE, related_name='subscription', verbose_name='Empresa')
    plan = models.ForeignKey(Plan, on_delete=models.PROTECT, verbose_name='Plan')
    status = models.CharField(max_length=20, choices=SUBSCRIPTION_STATUS, default='trial', verbose_name='Estado')
    start_date = models.DateField(default=date.today, verbose_name='Fecha de inicio')
    end_date = models.DateField(null=True, blank=True, verbose_name='Fecha de vencimiento')

    def __str__(self):
        return f'{self.company.commercial_name} - {self.plan.name} ({self.get_status_display()})'

    def is_active(self):
        if self.status not in ('active', 'trial'):
            return False
        if self.end_date is not None and self.end_date < date.today():
            return False
        return True

    def is_expired(self):
        return self.end_date is not None and self.end_date < date.today()

    def renew(self, from_date=None):
        base = from_date or date.today()
        self.start_date = base
        self.end_date = base + timedelta(days=self.plan.duration_days)
        self.status = 'active'
        self.save()

    def invoices_this_month(self):
        from core.pos.models import Invoice
        today = date.today()
        return Invoice.objects.filter(
            company=self.company,
            date_joined__year=today.year,
            date_joined__month=today.month,
        ).count()

    def users_count(self):
        return self.company.users.count()

    def can_emit_invoice(self):
        """(bool, mensaje) — si la empresa puede emitir una factura más este mes."""
        if not self.is_active():
            return False, 'La suscripción no está activa o está vencida.'
        if not self.plan.unlimited_invoices and self.invoices_this_month() >= self.plan.max_invoices_per_month:
            return False, f'Se alcanzó el límite de {self.plan.max_invoices_per_month} facturas mensuales del plan.'
        return True, ''

    def can_add_user(self):
        if not self.plan.unlimited_users and self.users_count() >= self.plan.max_users:
            return False, f'Se alcanzó el límite de {self.plan.max_users} usuarios del plan.'
        return True, ''

    def as_dict(self):
        item = model_to_dict(self, exclude=['company'])
        item['company'] = {'id': self.company_id, 'name': self.company.commercial_name}
        item['plan'] = self.plan.as_dict()
        item['status'] = {'id': self.status, 'name': self.get_status_display()}
        item['start_date'] = self.start_date.strftime('%Y-%m-%d')
        item['end_date'] = self.end_date.strftime('%Y-%m-%d') if self.end_date else None
        item['is_active'] = self.is_active()
        item['invoices_this_month'] = self.invoices_this_month()
        item['users_count'] = self.users_count()
        return item

    class Meta:
        verbose_name = 'Suscripción'
        verbose_name_plural = 'Suscripciones'
        default_permissions = ()
        permissions = (
            ('view_subscription', 'Can view Suscripción'),
            ('add_subscription', 'Can add Suscripción'),
            ('change_subscription', 'Can change Suscripción'),
            ('delete_subscription', 'Can delete Suscripción'),
        )
