from django.db import models
from core.models import User

# Create your models here.

class CustomerUser(models.Model):
    
    mail = models.EmailField(blank=True)
    name = models.CharField(blank=True, max_length=255)
    iduser = models.ForeignKey(User, on_delete=models.SET_NULL, default=1, blank=True, null=True)
    password = models.CharField(blank=True, max_length=120)
    avatar = models.ImageField(upload_to='avatar/%Y')
    loginby = models.CharField(default='', max_length=100, blank=True, null=True)
    mobile = models.CharField(default='', max_length=15)
    shippingmobile = models.CharField(default='', max_length=15)
    shippingname = models.CharField(blank=True, max_length=255)
    address = models.CharField(default='', max_length=255)
    zalo = models.CharField(default='', max_length=15)
    social = models.CharField(default='', max_length=255)
    active = models.BooleanField(default=False)
