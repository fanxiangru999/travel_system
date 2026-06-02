"""
自定义表单类
"""
from django import forms
from django.core.exceptions import ValidationError
from myapp.models import Admin, User, Attraction, Comment
from myapp.utils.bootstrap import BootStrapModelForm, BootStrapForm
from myapp.utils.encrypt import md5


# =============== 管理员相关表单 ===============

class AdminModelForm(BootStrapModelForm):
    """管理员新增表单"""
    confirm_password = forms.CharField(
        label="确认密码",
        widget=forms.PasswordInput(render_value=True)
    )

    class Meta:
        model = Admin
        fields = ["username", "password", "confirm_password"]
        widgets = {
            "password": forms.PasswordInput(render_value=True)
        }

    def clean_password(self):
        pwd = self.cleaned_data.get("password")
        return md5(pwd)

    def clean_confirm_password(self):
        pwd = self.cleaned_data.get("password")
        confirm = md5(self.cleaned_data.get("confirm_password"))
        if pwd != confirm:
            raise ValidationError("两次密码不一致")
        return confirm


class AdminEditModelForm(BootStrapModelForm):
    """管理员编辑表单"""
    class Meta:
        model = Admin
        fields = ["username"]


class AdminResetModelForm(BootStrapModelForm):
    """管理员密码重置表单"""
    confirm_password = forms.CharField(
        label="确认密码",
        widget=forms.PasswordInput(render_value=True)
    )

    class Meta:
        model = Admin
        fields = ["password", "confirm_password"]
        widgets = {
            "password": forms.PasswordInput(render_value=True)
        }

    def clean_password(self):
        pwd = self.cleaned_data.get("password")
        return md5(pwd)

    def clean_confirm_password(self):
        pwd = self.cleaned_data.get("password")
        confirm = md5(self.cleaned_data.get("confirm_password"))
        if pwd != confirm:
            raise ValidationError("两次密码不一致")
        return confirm


# =============== 用户相关表单 ===============

class LoginForm(BootStrapForm):
    """登录表单"""
    username = forms.CharField(label="用户名", widget=forms.TextInput)
    password = forms.CharField(label="密码", widget=forms.PasswordInput(render_value=True))
    code = forms.CharField(label="验证码", widget=forms.TextInput)


class RegisterForm(BootStrapModelForm):
    """用户注册表单"""
    confirm_password = forms.CharField(
        label="确认密码",
        widget=forms.PasswordInput(render_value=True)
    )

    class Meta:
        model = User
        fields = ["username", "password", "confirm_password", "nickname", "email"]
        widgets = {
            "password": forms.PasswordInput(render_value=True)
        }

    def clean_username(self):
        username = self.cleaned_data.get("username")
        exists = User.objects.filter(username=username).exists()
        if exists:
            raise ValidationError("用户名已存在")
        return username

    def clean_password(self):
        pwd = self.cleaned_data.get("password")
        if len(pwd) < 6:
            raise ValidationError("密码长度不能少于6位")
        return md5(pwd)

    def clean_confirm_password(self):
        pwd = self.cleaned_data.get("password")
        confirm = md5(self.cleaned_data.get("confirm_password"))
        if pwd != confirm:
            raise ValidationError("两次密码不一致")
        return confirm


# =============== 景点相关表单 ===============

class AttractionModelForm(BootStrapModelForm):
    """景点新增/编辑表单"""
    bootstrap_exclude_fields = ["image"]

    class Meta:
        model = Attraction
        fields = ["name", "city", "price", "description", "image"]
        widgets = {
            "description": forms.Textarea(attrs={"rows": 5})
        }


# =============== 评论相关表单 ===============

class CommentForm(BootStrapForm):
    """评论表单"""
    content = forms.CharField(
        label="评论内容",
        widget=forms.Textarea(attrs={"rows": 3, "placeholder": "请输入您的评论..."})
    )

    def clean_content(self):
        content = self.cleaned_data.get("content")
        if len(content) < 5:
            raise ValidationError("评论内容不能少于5个字符")
        if len(content) > 500:
            raise ValidationError("评论内容不能超过500个字符")
        return content
