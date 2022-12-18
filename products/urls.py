from django.urls import path
from .views import detail, detaillesson, typevideo, typecourse

app_name = 'products'
urlpatterns = [
    
    path('detail/<int:courses_id>', detail, name='detail'),
    path('detaillesson/<int:lesson_id>/<int:lessoncourse_id>', detaillesson, name='detaillesson'),
    path('products/typevideo/<int:category_id>', typevideo, name='typevideo'),
    path('products/typecourse/<int:type_id>', typecourse, name='typecourse'),
]