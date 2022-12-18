from django.shortcuts import render
from products.models import Category, Course
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

# *********************Class based view***************************
from django.views.generic import View


# Create your views here.

class IndexClass(View):
    def get(seft, request):
        category = Category.objects.all()  
        course = Course.objects.all().order_by('-id')
        
        page = request.GET.get('page', 1)
        paginator = Paginator(course, 6)
        try:
            course = paginator.page(page)
        except PageNotAnInteger:
            course = paginator.page(1)
        except EmptyPage:
            course = paginator.page(paginator.num_pages)  # Trang cuối

        return render(request, 'core/home.html', {'category': category,
                                                      'course': course,})

class About(View):
    def get(seft, request):        
        category = Category.objects.all()
        return render(request, 'core/about.html', {'category': category,})

class Contact(View):
    def get(seft, request):        
        category = Category.objects.all()
        return render(request, 'core/contact.html', {'category': category,})
    
