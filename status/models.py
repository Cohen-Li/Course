from django.db import models

# Create your models here.

class StatusOrder(models.Model):
    
    name = models.CharField(max_length=255, null=False, unique=True)
    decription = models.TextField(null=True, blank=True)