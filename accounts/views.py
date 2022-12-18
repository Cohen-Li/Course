from django.shortcuts import render, redirect
from django.http import HttpResponse
from products.models import Category
from .forms import UserLoginForm, UserRegisterForm
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponse, Http404 

# *********************Register***************************

from django.contrib.auth.forms import PasswordResetForm             # import form làm register
from django.contrib.auth.models import User                         # lấy tb user làm register
from django.utils.http import urlsafe_base64_encode                 # mã hóa làm register
from django.utils.encoding import force_bytes                       # mã hóa làm register
from django.contrib.auth.tokens import default_token_generator      # mã hóa làm register
from django.template.loader import render_to_string                 # render nội dung làm register
from django.db.models.query_utils import Q                          # lọc email làm register
from django.core.mail import send_mail, BadHeaderError              # làm register

# Create your views here.

def login_view(request):
    
    category = Category.objects.all()
    form = UserLoginForm(request.POST or None)

    if form.is_valid():                                     # nếu form hợp lệ
        username = form.cleaned_data.get('username')        # lấy username từ from
        password = form.cleaned_data.get('password')        # lấy password  từ form
        user = authenticate(username=username, password=password)           # chứng thực dữ liệu

        login(request, user)                                # gọi thư viện login
       
        return redirect('/')

    return render(request, 'accounts/login.html', {'category': category, 'formKeys': form,})


def logout_view(request):
    logout(request)
    return redirect('/')

def register_view(request):

    category = Category.objects.all()
    if request.method == 'POST':                    # Nếu yêu cầu là Post
        form = UserRegisterForm(request.POST or None)
        if form.is_valid():                                     # nếu form hợp lệ
            user = form.save(commit=False)
            password = form.cleaned_data.get('password')        # lấy password  từ form
            user.set_password(password)
            user.save()

            new_user = authenticate(username=user.username, password=password)
            login(request, new_user)                            # gọi thư viện login

            return redirect('/')
    form = UserRegisterForm() 
    return render(request, 'accounts/register.html', {'category': category, 'formKey': form,})


def password_reset_request(request):
    
    category = Category.objects.all()
    if request.method == 'POST':                    # Nếu yêu cầu là Post
        form = PasswordResetForm(request.POST)      # tạo đối tượng cho form
        if form.is_valid():
            data = form.cleaned_data['email']       # lấy địa chỉ mail
            associate_user = User.objects.filter(Q(email=data))    # lấy email của form
            for user in associate_user:
                subject = 'Password reset request'
                emailTemplateName = 'accounts/email/password_reset_request.txt'
                
                # Soạn nội dung đầu mail
                compose = {
                    "email":user.email,
					'domain':'127.0.0.1:8000',
					'site_name': 'Website',
					"uid": urlsafe_base64_encode(force_bytes(user.pk)),
                    "user": user,
					'token': default_token_generator.make_token(user),
                    'protocol': 'http',
                }
                email = render_to_string(emailTemplateName, compose)
                
                try:
                    send_mail(subject, email, 'lkienminh@gmail.com' , [user.email], fail_silently=False)
                except BadHeaderError:
                    return HttpResponse('Invalid')
                return redirect('/')
            
    form = PasswordResetForm()                      # Ngược lại tạo form request bình thường
    return render(request, 'accounts/password_reset_request.html', {'category': category, 'formKeys': form})
    
def password_reset_done(request):
    return render(request, 'accounts/password_reset_done.html', {})


def password_reset_confirm(request):
    return render(request, 'accounts/password_reset_confirm.html', {})


def password_reset_complete(request):
    return render(request, 'accounts/password_reset_complete.html', {})
