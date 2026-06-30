from django.urls import path

from core.tenancy.views import (
    SuperadminDashboardView,
    PlanListView, PlanCreateView, PlanUpdateView, PlanDeleteView,
    CompanyListView, CompanyCreateView, CompanyManageView,
    SubscriptionUpdateView,
)

urlpatterns = [
    path('', SuperadminDashboardView.as_view(), name='superadmin_dashboard'),
    # Plans
    path('planes/', PlanListView.as_view(), name='superadmin_plan_list'),
    path('planes/nuevo/', PlanCreateView.as_view(), name='superadmin_plan_create'),
    path('planes/<int:pk>/editar/', PlanUpdateView.as_view(), name='superadmin_plan_update'),
    path('planes/<int:pk>/eliminar/', PlanDeleteView.as_view(), name='superadmin_plan_delete'),
    # Companies
    path('empresas/', CompanyListView.as_view(), name='superadmin_company_list'),
    path('empresas/nueva/', CompanyCreateView.as_view(), name='superadmin_company_create'),
    path('empresas/<int:pk>/', CompanyManageView.as_view(), name='superadmin_company_manage'),
    # Subscriptions
    path('suscripciones/<int:pk>/editar/', SubscriptionUpdateView.as_view(), name='superadmin_subscription_update'),
]
