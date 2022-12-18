from django.db import models
from products.models import Course

# Create your models here.

idproduct = models.ForeignKey(Course, on_delete=models.SET_NULL)
mail = models.EmailField(blank=True)
name = models.CharField(blank=True, max_length=255)
star = models.FloatField(default=0)
created_date = models.DateTimeField(auto_now_add=True)
decription = models.TextField()
