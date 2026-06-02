"""
用户与管理员管理视图
处理管理员CRUD和用户管理功能
"""
from django.shortcuts import render, redirect, get_object_or_404
from myapp.models import Admin, User
from myapp.utils.form import AdminModelForm, AdminEditModelForm, AdminResetModelForm
from myapp.utils.pagination import Pagination


# =============== 管理员管理 ===============

def admin_list(request):
    """管理员列表"""
    # 检查权限
    info = request.session.get("info")
    if not info or info.get("role") != "admin":
        return redirect("/login/")

    # 搜索
    search_data = request.GET.get("q", "")
    queryset = Admin.objects.all()
    if search_data:
        queryset = queryset.filter(username__contains=search_data)

    # 分页
    page_obj = Pagination(request, queryset, page_size=10)

    context = {
        "queryset": page_obj.page_queryset,
        "page_string": page_obj.html(),
        "search_data": search_data,
    }
    return render(request, "admin_list.html", context)


def admin_add(request):
    """新增管理员"""
    # 检查权限
    info = request.session.get("info")
    if not info or info.get("role") != "admin":
        return redirect("/login/")

    if request.method == "GET":
        form = AdminModelForm()
        return render(request, "change.html", {"form": form, "title": "新增管理员"})

    form = AdminModelForm(data=request.POST)
    if form.is_valid():
        form.save()
        return redirect("/admin/list/")

    return render(request, "change.html", {"form": form, "title": "新增管理员"})


def admin_update(request, pk):
    """编辑管理员"""
    # 检查权限
    info = request.session.get("info")
    if not info or info.get("role") != "admin":
        return redirect("/login/")

    admin_obj = get_object_or_404(Admin, pk=pk)

    if request.method == "GET":
        form = AdminEditModelForm(instance=admin_obj)
        return render(request, "change.html", {"form": form, "title": "编辑管理员"})

    form = AdminEditModelForm(data=request.POST, instance=admin_obj)
    if form.is_valid():
        form.save()
        return redirect("/admin/list/")

    return render(request, "change.html", {"form": form, "title": "编辑管理员"})


def admin_del(request, pk):
    """删除管理员"""
    # 检查权限
    info = request.session.get("info")
    if not info or info.get("role") != "admin":
        return redirect("/login/")

    Admin.objects.filter(pk=pk).delete()
    return redirect("/admin/list/")


def admin_reset(request, pk):
    """重置管理员密码"""
    # 检查权限
    info = request.session.get("info")
    if not info or info.get("role") != "admin":
        return redirect("/login/")

    admin_obj = get_object_or_404(Admin, pk=pk)

    if request.method == "GET":
        form = AdminResetModelForm()
        return render(request, "change.html", {"form": form, "title": f"重置密码 - {admin_obj.username}"})

    form = AdminResetModelForm(data=request.POST, instance=admin_obj)
    if form.is_valid():
        form.save()
        return redirect("/admin/list/")

    return render(request, "change.html", {"form": form, "title": f"重置密码 - {admin_obj.username}"})


# =============== 用户管理 ===============

def user_list(request):
    """用户列表"""
    # 检查权限
    info = request.session.get("info")
    if not info or info.get("role") != "admin":
        return redirect("/login/")

    # 搜索
    search_data = request.GET.get("q", "")
    queryset = User.objects.all()
    if search_data:
        queryset = queryset.filter(username__contains=search_data)

    # 分页
    page_obj = Pagination(request, queryset, page_size=10)

    context = {
        "queryset": page_obj.page_queryset,
        "page_string": page_obj.html(),
        "search_data": search_data,
    }
    return render(request, "user_list.html", context)


def user_del(request, pk):
    """删除用户"""
    # 检查权限
    info = request.session.get("info")
    if not info or info.get("role") != "admin":
        return redirect("/login/")

    User.objects.filter(pk=pk).delete()
    return redirect("/user/list/")
