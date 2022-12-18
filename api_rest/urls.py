from django.urls import path, include
from .views import home, CourseViewSet, LessonViewSet
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register('courses', CourseViewSet)
router.register('lessons', LessonViewSet)

# /courses/ - GET
# /courses/ - POST
# /courses/{courses_id}/ - GET
# /courses/{courses_id}/- PUT
# /courses/{courses_id}/ - DELETE

app_name = 'apirest'
urlpatterns = [
    
    path('', home, name='home'),
    path('api', include(router.urls), name='api'),
    
]