from django.contrib import messages
from django.http import HttpResponseRedirect
from django.urls import reverse_lazy
from django.views.generic import TemplateView, ListView, CreateView, UpdateView, DeleteView

from core.pos.models import Company
from core.tenancy.forms import PlanForm, CompanyCreateForm, CompanyEditForm, SubscriptionForm
from core.tenancy.mixins import SuperadminRequiredMixin
from core.tenancy.models import Plan, Subscription
from core.tenancy.services import provision_company

COMPANY_FIELDS = [
    'ruc', 'company_name', 'commercial_name', 'main_address', 'establishment_address',
    'establishment_code', 'issuing_point_code', 'environment_type', 'regimen_rimpe',
    'email', 'tax', 'tax_percentage',
]


class SuperadminDashboardView(SuperadminRequiredMixin, TemplateView):
    template_name = 'superadmin/dashboard.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Panel de Superadministración'
        context['companies'] = Company.objects.all().order_by('id')
        context['total_companies'] = Company.objects.count()
        context['total_plans'] = Plan.objects.count()
        context['active_subscriptions'] = Subscription.objects.filter(status__in=['active', 'trial']).count()
        context['subscriptions'] = Subscription.objects.select_related('company', 'plan').all()
        return context


# ---------------- Plans ----------------
class PlanListView(SuperadminRequiredMixin, ListView):
    model = Plan
    template_name = 'superadmin/plan_list.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Planes'
        context['create_url'] = reverse_lazy('superadmin_plan_create')
        return context


class PlanCreateView(SuperadminRequiredMixin, CreateView):
    model = Plan
    form_class = PlanForm
    template_name = 'superadmin/plan_form.html'
    success_url = reverse_lazy('superadmin_plan_list')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Nuevo Plan'
        context['list_url'] = self.success_url
        return context

    def form_valid(self, form):
        messages.success(self.request, 'Plan creado correctamente.')
        return super().form_valid(form)


class PlanUpdateView(SuperadminRequiredMixin, UpdateView):
    model = Plan
    form_class = PlanForm
    template_name = 'superadmin/plan_form.html'
    success_url = reverse_lazy('superadmin_plan_list')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Editar Plan'
        context['list_url'] = self.success_url
        return context

    def form_valid(self, form):
        messages.success(self.request, 'Plan actualizado correctamente.')
        return super().form_valid(form)


class PlanDeleteView(SuperadminRequiredMixin, DeleteView):
    model = Plan
    template_name = 'superadmin/confirm_delete.html'
    success_url = reverse_lazy('superadmin_plan_list')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Eliminar Plan'
        context['list_url'] = self.success_url
        return context


# ---------------- Companies ----------------
class CompanyListView(SuperadminRequiredMixin, ListView):
    model = Company
    template_name = 'superadmin/company_list.html'

    def get_queryset(self):
        return Company.objects.all().order_by('id')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Empresas'
        context['create_url'] = reverse_lazy('superadmin_company_create')
        return context


class CompanyCreateView(SuperadminRequiredMixin, CreateView):
    model = Company
    form_class = CompanyCreateForm
    template_name = 'superadmin/company_form.html'
    success_url = reverse_lazy('superadmin_company_list')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Nueva Empresa'
        context['list_url'] = self.success_url
        return context

    def form_valid(self, form):
        cleaned = form.cleaned_data
        company_data = {k: cleaned[k] for k in COMPANY_FIELDS}
        try:
            company, subscription, admin_user = provision_company(
                company_data=company_data,
                plan=cleaned['plan'],
                admin_username=cleaned['admin_username'],
                admin_password=cleaned['admin_password'],
                admin_names=cleaned['admin_names'],
                admin_email=cleaned.get('admin_email'),
            )
        except Exception as e:
            messages.error(self.request, f'Error al crear la empresa: {e}')
            return self.form_invalid(form)
        messages.success(
            self.request,
            f'Empresa "{company.commercial_name}" creada con usuario administrador "{admin_user.username}".',
        )
        return HttpResponseRedirect(self.success_url)


class CompanyManageView(SuperadminRequiredMixin, UpdateView):
    model = Company
    form_class = CompanyEditForm
    template_name = 'superadmin/company_manage.html'
    success_url = reverse_lazy('superadmin_company_list')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = f'Gestionar: {self.object.commercial_name}'
        context['list_url'] = self.success_url
        subscription = getattr(self.object, 'subscription', None)
        context['subscription_form'] = SubscriptionForm(instance=subscription)
        context['subscription'] = subscription
        context['company_users'] = self.object.users.all().order_by('id')
        return context

    def form_valid(self, form):
        messages.success(self.request, 'Datos de la empresa actualizados.')
        return super().form_valid(form)


class SubscriptionUpdateView(SuperadminRequiredMixin, UpdateView):
    model = Subscription
    form_class = SubscriptionForm
    template_name = 'superadmin/subscription_form.html'

    def get_success_url(self):
        return reverse_lazy('superadmin_company_manage', kwargs={'pk': self.object.company_id})

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = f'Suscripción: {self.object.company.commercial_name}'
        context['list_url'] = self.get_success_url()
        return context

    def form_valid(self, form):
        messages.success(self.request, 'Suscripción actualizada.')
        return super().form_valid(form)
