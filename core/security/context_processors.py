from datetime import datetime

from core.security.models import Dashboard


def site_settings(request):
    dashboard = Dashboard.objects.first()
    company = None
    user = getattr(request, 'user', None)
    if user is not None and user.is_authenticated:
        company = getattr(user, 'company', None)
    params = {
        'dashboard': dashboard,
        'date_joined': datetime.now(),
        'company': company,
        'menu': dashboard.get_template_from_layout() if dashboard else 'hzt_body.html'
    }
    return params
