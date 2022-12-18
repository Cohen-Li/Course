from django import forms
from django.contrib.auth import authenticate
from django.contrib.auth.models import User


class UserLoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)

    def clean(self, *args, **kwargs):
        username = self.cleaned_data.get('username')                        # cleaned_data.get làm hợp lệ dữ liệu
        password = self.cleaned_data.get('password')

        if username and password:                                           # nếu có nhập dữ liệu user và pass
            user = authenticate(username=username, password=password)       # chứng thực dữ liệu
            if not user:                                                    # Nếu ko có user
                raise forms.ValidationError('User not database')            # Báo user ko có trong db
            if not user.check_password(password):                           # kiêm tra pass
                raise forms.ValidationError('Password not true')
            if not user.is_active:                                          # kiểm tra user active chưa
                raise forms.ValidationError('User not active')
        return super(UserLoginForm, self).clean(*args, **kwargs)            # goi super trả về UserLoginForm và báo dữ liệu đã hợp lệ


class UserRegisterForm(forms.ModelForm):

    email = forms.EmailField(label='InsertEmail')
    password = forms.CharField(widget=forms.PasswordInput, label='Insert Pass')
    re_password = forms.CharField(widget=forms.PasswordInput, label='Re Insert Pass')

    class Meta:
        model = User
        fields = ['username', 'email', 'password', 're_password']

    def clean(self, *args, **kwargs):
        email = self.cleaned_data.get('email')  # cleaned_data.get làm hợp lệ dữ liệu
        password = self.cleaned_data.get('password')
        re_password = self.cleaned_data.get('re_password')

        if password != re_password:
            raise forms.ValidationError('Password not true')
        emailQ = User.objects.filter(email=email)
        if emailQ.exists():                                 # Kiểm tra email có trong db ko
            raise forms.ValidationError('Email used')

        return super(UserRegisterForm, self).clean(*args, **kwargs)


