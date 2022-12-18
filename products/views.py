from django.shortcuts import render
from products.models import Category, Course, Lesson, Tag
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, Http404 

# *********************Class based view***************************
from django.views.generic import ListView, DetailView, View


# Create your views here.

def detail(request, courses_id):

    category = Category.objects.all()
    try:
        lesson = Lesson.objects.filter(course=courses_id)
        courses_id = Course.objects.get(id=courses_id)
    except Course.DoesNotExist:
        raise Http404("Question does not exist")
    
    return render(request, 'products/detail.html', {'lesson': lesson,
                                                    'courses_id': courses_id,
                                                    'category': category,})

def detaillesson(request, lesson_id, lessoncourse_id):

    category = Category.objects.all()
    try:
        lessonid = Lesson.objects.get(id=lesson_id)
        lessonfil = Lesson.objects.filter(course_id=lessoncourse_id)
    except Course.DoesNotExist:
        raise Http404("Question does not exist")
    
    return render(request, 'products/detail_lesson.html', {'lessonid': lessonid,
                                                           'lessonfil': lessonfil,
                                                           'category': category,})


def typevideo(request, category_id):
    
    category = Category.objects.all()
    coursesFilId = Course.objects.filter(category_id=category_id)

    page = request.GET.get('page', 1)
    paginator = Paginator(coursesFilId, 6)
    try:
        coursesFilId = paginator.page(page)
    except PageNotAnInteger:
        coursesFilId = paginator.page(1)
    except EmptyPage:
        coursesFilId = paginator.page(paginator.num_pages)  # Trang cuối

    return render(request, 'products/typevideo.html', {'category': category,
                                                       'coursesFilId': coursesFilId,})

def typecourse(request, type_id):
    
    category = Category.objects.all()
    coursesFilId = Course.objects.filter(type=type_id)
    
    page = request.GET.get('page', 1)
    paginator = Paginator(coursesFilId, 6)
    try:
        coursesFilId = paginator.page(page)
    except PageNotAnInteger:
        coursesFilId = paginator.page(1)
    except EmptyPage:
        coursesFilId = paginator.page(paginator.num_pages)  # Trang cuối
    
    return render(request, 'products/typecourse.html', {'category': category,
                                                       'coursesFilId': coursesFilId})
