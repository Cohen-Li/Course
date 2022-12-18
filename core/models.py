from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

class User(AbstractUser):
    avatar = models.ImageField(upload_to='avatar/%Y')
    sex_choice = ((0, 'Male'), (1, 'Female'), (2, 'Orther'))
    sex = models.IntegerField(choices=sex_choice, default=0)
    mobile = models.CharField(default='', max_length=15)
    address = models.CharField(default='', max_length=255)
    zalo = models.CharField(default='', max_length=15)
    social = models.CharField(default='', max_length=255)