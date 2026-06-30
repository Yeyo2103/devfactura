from django import forms
from django.contrib.auth.models import Group

from core.pos.choices import ENVIRONMENT_TYPE, REGIMEN_RIMPE, TAX_PERCENTAGE
from core.pos.models import Company
from core.tenancy.models import Plan, Subscription
from core.user.models import User


class BootstrapFormMixin:
    """Add Bootstrap styling to all visible fields."""

    def _style_fields(self):
        for name, field in self.fields.items():
            widget = field.widget
            css = 'form-control'
            if isinstance(widget, forms.CheckboxInput):
                css = 'form-check-input'
            elif isinstance(widget, forms.Select):
                css = 'form-control select2'
            existing = widget.attrs.get('class', '')
            widget.attrs['class'] = (existing + ' ' + css).strip()


class PlanForm(BootstrapFormMixin, forms.ModelForm):
    class Meta:
        model = Plan
        fields = ['name', 'description', 'price', 'max_invoices_per_month', 'max_users', 'duration_days', 'is_active']
        widgets = {
            'description': forms.TextInput(),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._style_fields()


class CompanyCreateForm(BootstrapFormMixin, forms.ModelForm):
    # Extra (non-Company) fields for provisioning the tenant.
    plan = forms.ModelChoiceField(queryset=Plan.objects.filter(is_active=True), label='Plan')
    admin_username = forms.CharField(max_length=150, label='Usuario administrador')
    admin_names = forms.CharField(max_length=150, label='Nombre del administrador')
    admin_email = forms.EmailField(required=False, label='Email del administrador')
    admin_password = forms.CharField(max_length=128, label='Contraseña del administrador', widget=forms.PasswordInput(render_value=True))

    class Meta:
        model = Company
        fields = [
            'ruc', 'company_name', 'commercial_name', 'main_address', 'establishment_address',
            'establishment_code', 'issuing_point_code', 'environment_type', 'regimen_rimpe',
            'email', 'tax', 'tax_percentage',
        ]
        widgets = {
            'environment_type': forms.Select(choices=ENVIRONMENT_TYPE),
            'regimen_rimpe': forms.Select(choices=REGIMEN_RIMPE),
            'tax_percentage': forms.Select(choices=TAX_PERCENTAGE),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['tax'].initial = 15
        self._style_fields()

    def clean_admin_username(self):
        from core.user.models import User
        username = self.cleaned_data['admin_username']
        if User.objects.filter(username=username).exists():
            raise forms.ValidationError('Ya existe un usuario con ese nombre de usuario.')
        return username


class CompanyEditForm(BootstrapFormMixin, forms.ModelForm):
    class Meta:
        model = Company
        fields = [
            'ruc', 'company_name', 'commercial_name', 'main_address', 'establishment_address',
            'establishment_code', 'issuing_point_code', 'environment_type', 'regimen_rimpe',
            'email', 'tax', 'tax_percentage',
        ]
        widgets = {
            'environment_type': forms.Select(choices=ENVIRONMENT_TYPE),
            'regimen_rimpe': forms.Select(choices=REGIMEN_RIMPE),
            'tax_percentage': forms.Select(choices=TAX_PERCENTAGE),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._style_fields()


class SubscriptionForm(BootstrapFormMixin, forms.ModelForm):
    class Meta:
        model = Subscription
        fields = ['plan', 'status', 'start_date', 'end_date']
        widgets = {
            'start_date': forms.DateInput(attrs={'type': 'date'}),
            'end_date': forms.DateInput(attrs={'type': 'date'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._style_fields()


class CompanyUserForm(BootstrapFormMixin, forms.Form):
    names = forms.CharField(max_length=150, label='Nombre completo')
    username = forms.CharField(max_length=150, label='Usuario (login)')
    email = forms.EmailField(required=False, label='Email')
    password = forms.CharField(max_length=128, label='Contraseña', widget=forms.PasswordInput(render_value=True))
    group = forms.ModelChoiceField(queryset=Group.objects.all().order_by('name'), label='Rol / Grupo')
    is_active = forms.BooleanField(required=False, initial=True, label='Activo')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._style_fields()

    def clean_username(self):
        username = self.cleaned_data['username']
        if User.objects.filter(username=username).exists():
            raise forms.ValidationError('Ya existe un usuario con ese nombre de usuario.')
        return username

