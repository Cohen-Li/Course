from django.db import models
from customers.models import CustomerUser
from status.models import StatusOrder
from core.models import User
from products.models import Course


# Create your models here.

class Order(models.Model):
    
    created_date = models.DateTimeField(auto_now_add=True)
    idcustomer = models.ForeignKey(CustomerUser, on_delete=models.CASCADE)
    idstatus = models.ForeignKey(StatusOrder, on_delete=models.CASCADE)
    iduser = models.ForeignKey(User, on_delete=models.CASCADE, default=1, blank=True, null=True)
    shippingmobile = models.CharField(default='', max_length=15)
    shippingname = models.CharField(blank=True, max_length=255)
    payment_method_choice = ((0, 'COD'), (1, 'Bank'))
    payment_method = models.IntegerField(choices=payment_method_choice, default=0)
    address = models.CharField(default='', max_length=255) 
    shippingfee = models.IntegerField(default=0)
    deivered_date = models.DateTimeField(auto_now_add=True)

class OrderItem(models.Model):
    
    idproduct = models.ForeignKey(Course, on_delete=models.CASCADE)
    idorder = models.ForeignKey(Order, on_delete=models.CASCADE)
    quanlity = models.IntegerField(default=0)
    unit_price = models.IntegerField(default=0)
    total_price = models.IntegerField(default=0)
    
    
    
    

