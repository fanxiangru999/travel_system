"""
账户相关视图
处理登录、注册、注销、验证码等功能
"""
from django.shortcuts import render, redirect
from django.http import HttpResponse
from myapp.utils.form import LoginForm, RegisterForm
from myapp.utils.encrypt import md5
from myapp.utils.code import check_code
from myapp.models import User, Admin
from io import BytesIO


def index(request):
    """首页 - 重定向到景点列表"""
    return redirect("/travel/list/")


def login(request):
    """用户登录"""
    if request.method == "GET":
        form = LoginForm()
        return render(request, "login.html", {"form": form})

    form = LoginForm(data=request.POST)
    if not form.is_valid():
        return render(request, "login.html", {"form": form})

    # 验证验证码
    user_input_code = form.cleaned_data.pop("code")
    session_code = request.session.get("image_code", "")
    if user_input_code.upper() != session_code.upper():
        form.add_error("code", "验证码错误")
        return render(request, "login.html", {"form": form})

    # 验证用户名和密码
    username = form.cleaned_data.get("username")
    password = md5(form.cleaned_data.get("password"))

    # 先检查是否是管理员
    admin_obj = Admin.objects.filter(username=username, password=password).first()
    if admin_obj:
        request.session["info"] = {
            "id": admin_obj.id,
            "username": admin_obj.username,
            "role": "admin"
        }
        request.session.set_expiry(60 * 60 * 24 * 7)  # 7天有效期
        return redirect("/chart/list/")

    # 检查是否是普通用户
    user_obj = User.objects.filter(username=username, password=password).first()
    if user_obj:
        request.session["info"] = {
            "id": user_obj.id,
            "username": user_obj.username,
            "role": "user"
        }
        request.session.set_expiry(60 * 60 * 24 * 7)  # 7天有效期
        return redirect("/travel/list/")

    form.add_error("password", "用户名或密码错误")
    return render(request, "login.html", {"form": form})


def register(request):
    """用户注册"""
    if request.method == "GET":
        form = RegisterForm()
        return render(request, "register.html", {"form": form})

    form = RegisterForm(data=request.POST)
    if form.is_valid():
        # 移除确认密码字段
        form.cleaned_data.pop("confirm_password")
        User.objects.create(**form.cleaned_data)
        return redirect("/login/")

    return render(request, "register.html", {"form": form})


def logout(request):
    """用户注销"""
    request.session.clear()
    return redirect("/login/")


def image_code(request):
    """生成验证码图片"""
    img, code = check_code()

    # 保存验证码到session
    request.session["image_code"] = code
    request.session.set_expiry(60)  # 60秒有效期

    # 将图片写入内存
    stream = BytesIO()
    img.save(stream, "png")

    return HttpResponse(stream.getvalue())
