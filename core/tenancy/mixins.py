from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponseRedirect
from django.urls import reverse_lazy


class SuperadminRequiredMixin(LoginRequiredMixin):
    """Allow access only to platform superadmins."""
    login_url = '/login/'

    def dispatch(self, request, *args, **kwargs):
        if not request.user.is_authenticated:
            return HttpResponseRedirect(self.login_url)
        if not getattr(request.user, 'is_superadmin', False):
            messages.error(request, 'Acceso restringido al superadministrador de la plataforma.')
            return HttpResponseRedirect(reverse_lazy('dashboard'))
        return super().dispatch(request, *args, **kwargs)
