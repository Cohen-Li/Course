from django.contrib import admin
from .models import User
from django.utils.html import mark_safe

# Register your models here.

class MyUserAdmin(admin.ModelAdmin):
    search_fields = ["username"]
    readonly_fields = ["avatar_admin"]        # show image
    
    # format image
    def avatar_admin(self, myuseradmin):
        return mark_safe("<img src='/media/{img_url}' alt='{alt}' width='120px' />".format(img_url=myuseradmin.avatar.name, alt=myuseradmin.username))

admin.site.register(User, MyUserAdmin)