from django.urls import path, include
from .views import login_view, logout_view,\
    register_view,  password_reset_request


app_name = 'accounts'
urlpatterns = [

    path('accounts/login', login_view, name='login'),
    path('accounts/logout', logout_view, name='logout'),
    path('accounts/register', register_view, name='register'),
    path('accounts/password_reset_request', password_reset_request, name='password_reset'),
]