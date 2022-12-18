from django.contrib import admin
from django.utils.html import mark_safe
from django import forms
from .models import Category, Course, Lesson, Tag, ImageCourseLess, VideoCourseLess
from ckeditor_uploader.widgets import CKEditorUploadingWidget

# Register your models here.

# Add ckeditor in Lesson
class LessonForm(forms.ModelForm):
    content = forms.CharField(widget=CKEditorUploadingWidget())
    
    class Meta:
        model = Lesson
        fields = '__all__'
        
# Add inline and many to many       
class LessonTagInline(admin.StackedInline):         # TabularInline; StackedInline
    model = Lesson.tags.through
            
class LessonAdmin(admin.ModelAdmin):
    
    form = LessonForm       # show ckeditor
    list_display = ["id", "subject", "active", "course", "slug"]
    list_filter = ["subject", "course__subject"]
    search_fields = ["subject", "created_date", "course__subject"]
    prepopulated_fields = {'slug': ('subject',)}   # Chuyển tiêu đề sang slug
    readonly_fields = ["avatar_lesson"]        # show image
    inlines = (LessonTagInline, )       # Add inline many to many
    
    # format image
    def avatar_lesson(self, lesson):
        return mark_safe("<img src='/media/{img_url}' alt='{alt}' width='120px' />".format(img_url=lesson.image.name, alt=lesson.subject))

# Add Inlines many to one LessonInline

class LessonInline(admin.StackedInline):
    model = Lesson
    pk_name = 'course'          # Get ForeignKey
    

# Add ckeditor in Course
class CourseForm(forms.ModelForm):
    description = forms.CharField(widget=CKEditorUploadingWidget())
    
    class Meta:
        model = Course
        fields = '__all__'
    
class CourseAdmin(admin.ModelAdmin):
    
    form = CourseForm       # show ckeditor
    list_display = ["id", "subject", "active", "category", "slug"]
    list_filter = ["subject"]
    search_fields = ["subject", "created_date", "category__subject"]
    prepopulated_fields = {'slug': ('subject',)}   # Chuyển tiêu đề sang slug
    readonly_fields = ["avatar_course"]        # show image
    inlines = (LessonInline,)
    
    # format image
    def avatar_course(self, course):
        return mark_safe("<img src='/media/{img_url}' alt='{alt}' width='120px' />".format(img_url=course.image.name, alt=course.subject))

# Add Inlines many to one Category

class CourseInline(admin.StackedInline):
    model = Course
    pk_name = 'category'          # Get ForeignKey

class CategoryAdmin(admin.ModelAdmin):
    list_display = ["id", "title", "slug"]
    list_filter = ["title"]
    search_fields = ["title"]
    prepopulated_fields = {'slug': ('title',)}   # Chuyển tiêu đề sang slug
    inlines = (CourseInline,)
            

class ImageCourseLessAdmin(admin.ModelAdmin):
    readonly_fields = ["avatar_ImageCourseLess"]        # show image
    list_display = ["id", "course", "lesson"]
    
    # format image
    def avatar_ImageCourseLess(self, imagecourseLess):
        return mark_safe("<img src='/media/{img_url}' alt='{alt}' width='120px' />".format(img_url=imagecourseLess.image.name, alt=''))    


class VideoCourseLessAdmin(admin.ModelAdmin):
    list_display = ["id", "course", "lesson"]
    
    
class TagAdmin(admin.ModelAdmin):
    list_display = ["id", "name", "slug"]
    search_fields = ["name"]
    # prepopulated_fields = {'slug': ('name',)}   # Chuyển tiêu đề sang slug
        
admin.site.register(Category, CategoryAdmin)
admin.site.register(Course, CourseAdmin)
admin.site.register(Lesson, LessonAdmin)
admin.site.register(Tag, TagAdmin)
admin.site.register(VideoCourseLess, VideoCourseLessAdmin) 
admin.site.register(ImageCourseLess, ImageCourseLessAdmin)
   
