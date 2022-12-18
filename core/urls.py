from django.urls import path
from .views import IndexClass, About, Contact

app_name = 'core'
urlpatterns = [
    
    path('', IndexClass.as_view(), name='homepage'),
    path('core/about', About.as_view(), name='about'),
    path('core/contact', Contact.as_view(), name='contact'),
]