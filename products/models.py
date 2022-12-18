from django.db import models
from ckeditor.fields import RichTextField
from embed_video.fields import EmbedVideoField
from autoslug import AutoSlugField
from datetime import date

# Create your models here.

class Category(models.Model):
    title = models.CharField(max_length=255, null=False, unique=True)
    decription = models.TextField(null=True, blank=True)
    slug = models.SlugField(max_length=255, null=False, unique=True)
    active = models.BooleanField(default=True) 
    
    def __str__(self):
        return self.title

class Itembase(models.Model):
    class Meta:
        abstract = True                                # class chung và class Meta ko cho tạo tb nữa
        
    subject = models.CharField(max_length=100, null=False)
    image = models.ImageField(upload_to='itembase/%Y/%m/%d', default=None)
    created_date = models.DateTimeField(auto_now_add=True) 
    update_date = models.DateTimeField(auto_now=True)
    active = models.BooleanField(default=True)
    link_video = models.CharField(max_length=300)
    type = models.IntegerField(default=True)
    slug = models.SlugField(unique=True, max_length=255, blank=True, null=True)
    
    def __str__(selt):
        return selt.subject
     
class Course(Itembase):
    class Meta:
        unique_together = ('subject', 'category')   # danh mục ko được phép trùng tên khóa học
        ordering = ["-id"]                          # order by id desc  
        
    
    description = RichTextField(null=True, blank=True)
    category = models.ForeignKey(Category, on_delete=models.SET_NULL, blank=True, null=True)    #  khi xoá thì trường này sẽ là null ko bị xoá theo
    # category = models.ForeignKey(Category, on_delete=models.SET_DEFAULT)          #  bài học mặc định
    star = models.FloatField(default=0)
    inventory  = models.IntegerField(default=0)
    

class Variation(models.Model):
    
    title = models.CharField(max_length=255, null=False, unique=True)
    product = models.ForeignKey(Course, on_delete=models.SET_NULL, blank=True, null=True)
    price = models.IntegerField(default=500000)
    sale_price = models.IntegerField(default=0, blank=True, null=True)
    discount_price = models.IntegerField(default=0, blank=True, null=True)
    discount_percentage = models.IntegerField(default=0, blank=True, null=True)
    discount_from_date = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    discount_to_date = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    active = models.BooleanField(default=True)
    
    def calculator(seft):
        if((seft.discount_from_date >= date.today()) and (seft.discount_to_date <= date.today())):
            
            if seft.discount_percentage != None:
                return  (seft.price * ((1-seft.discount_percentage/100))/1000, 0) * 1000
            
            # if seft.discount_price != None:
            #     return  (seft.price * ((1-seft.discount_percentage/100))/1000, 0) * 1000
    
class Lesson(Itembase):
    class Meta:
        unique_together = ('subject', 'course')   # khóa học  ko được phép trùng tên bài học
        ordering = ["-id"]                        # order by id desc      
    content = RichTextField(null=True, blank=True)
    course = models.ForeignKey(Course, on_delete=models.CASCADE, blank=True, null=True)    #  Xoá theo
    # course = models.ForeignKey(Course, on_delete=models.PROTECT)  #  Ko được phép xoá
    tags = models.ManyToManyField('Tag', blank=True, null=True)      # class Tag nằm dưới nên phải để trong dấu nhấy, nếu nằm trên thì ko cần

class Tag(models.Model):
    name = models.CharField(max_length=50, unique=True)
    slug = AutoSlugField(populate_from='name', max_length=255, null=False, unique=True)
    
    def __str__(selt):
        return selt.name
    
class ImageCourseLess(models.Model):
    course = models.ForeignKey(Course, on_delete=models.CASCADE, blank=True, null=True)
    lesson = models.ForeignKey(Lesson, on_delete=models.CASCADE, blank=True, null=True)
    image = models.ImageField(upload_to='itembase/%Y/%m/%d', default=None)
    
class VideoCourseLess(models.Model):
    course = models.ForeignKey(Course, on_delete=models.CASCADE, blank=True, null=True)
    lesson = models.ForeignKey(Lesson, on_delete=models.CASCADE, blank=True, null=True)
    video = EmbedVideoField()