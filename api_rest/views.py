from django.shortcuts import render
from django.http import HttpResponse
from products.models import Category, Course, Lesson, Tag


# ****************** import rest_framework librarys
from rest_framework import viewsets, permissions, status
from rest_framework.decorators import action
from rest_framework.response import Response
from .serializers import CourseSerializer, LessonSerializer

# *********************Class based view***************************
from django.views.generic import ListView, DetailView, View


# Create your views here.

def home(request):
    return HttpResponse('This is a home page hummmmm')


# Create your rest_framework APIs here.

    # list (GET) ---> view list Course
    # list (POST) ---> create Course
    # detail (GET) ---> view detail Course
    # detail (PUT) ---> update Course
    # detail (DELETE) ---> del Course
    
class CourseViewSet(viewsets.ModelViewSet):
    queryset = Course.objects.filter(active = True)
    serializer_class = CourseSerializer
    # permission_classes = [permissions.IsAuthenticated]      # phải đăng nhập thì mới được xem dữ liệu 
    
    # muốn xem danh sách thì ai cũng xem được, các thao tác còn lại thì phải đăng nhập (ghi đè)
    
    def get_permissions(selt):
        if selt.action == 'list':               # Nếu là list
            return [permissions.AllowAny()]     # Trả về cấp quyền ai cũng có thể xem được 
        
        return [permissions.IsAuthenticated()]  # Ngược lại thì các quyền khác phải đăng nhập
    
class LessonViewSet(viewsets.ModelViewSet):
    queryset = Lesson.objects.filter(active = True)
    serializer_class = LessonSerializer
    
    @action(methods=['post'], detail=True, url_path="hide-lesson", url_name="hide-lesson")
    
    def hidelesson(selt, request, pk):
        try:
            l = Lesson.objects.get(pk=pk)
            l.active = False
            l.save()
        except Lesson.DoesNotExist:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        
        return Response(data=LessonSerializer(l, context={'request': request}).data,
                        status=status.HTTP_200_OK)
    
