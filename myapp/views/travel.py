"""
旅游景点管理视图
处理景点的CRUD操作
"""
from django.shortcuts import render, redirect, get_object_or_404
from myapp.models import Attraction, Favorite
from myapp.utils.form import AttractionModelForm, CommentForm
from myapp.utils.pagination import Pagination


def travel_list(request):
    """景点列表"""
    # 获取搜索参数
    search_data = request.GET.get("q", "")
    city = request.GET.get("city", "")

    # 构建查询条件
    queryset = Attraction.objects.all()
    if search_data:
        queryset = queryset.filter(name__contains=search_data)
    if city:
        queryset = queryset.filter(city=city)

    # 获取所有城市（用于筛选）
    cities = Attraction.objects.values_list("city", flat=True).distinct()

    # 分页
    page_obj = Pagination(request, queryset, page_size=9)

    # 检查用户是否登录，以及收藏状态
    user_favorites = []
    info = request.session.get("info")
    if info and info.get("role") == "user":
        user_favorites = list(
            Favorite.objects.filter(user_id=info["id"]).values_list("attraction_id", flat=True)
        )

    context = {
        "queryset": page_obj.page_queryset,
        "page_string": page_obj.html(),
        "search_data": search_data,
        "city": city,
        "cities": cities,
        "user_favorites": user_favorites,
    }
    return render(request, "travel_list.html", context)


def travel_detail(request, pk):
    """景点详情"""
    attraction = get_object_or_404(Attraction, pk=pk)

    # 获取评论列表
    comments = attraction.comment_set.all().select_related("user")

    # 评论表单
    form = CommentForm()

    # 检查是否已收藏
    is_favorite = False
    info = request.session.get("info")
    if info and info.get("role") == "user":
        is_favorite = Favorite.objects.filter(
            user_id=info["id"], attraction_id=pk
        ).exists()

    context = {
        "attraction": attraction,
        "comments": comments,
        "form": form,
        "is_favorite": is_favorite,
    }
    return render(request, "travel_detail.html", context)


def travel_add(request):
    """新增景点（管理员）"""
    # 检查权限
    info = request.session.get("info")
    if not info or info.get("role") != "admin":
        return redirect("/login/")

    if request.method == "GET":
        form = AttractionModelForm()
        return render(request, "travel_form.html", {"form": form, "title": "新增景点"})

    form = AttractionModelForm(data=request.POST, files=request.FILES)
    if form.is_valid():
        form.save()
        return redirect("/travel/list/")

    return render(request, "travel_form.html", {"form": form, "title": "新增景点"})


def travel_update(request, pk):
    """编辑景点（管理员）"""
    # 检查权限
    info = request.session.get("info")
    if not info or info.get("role") != "admin":
        return redirect("/login/")

    attraction = get_object_or_404(Attraction, pk=pk)

    if request.method == "GET":
        form = AttractionModelForm(instance=attraction)
        return render(request, "travel_form.html", {"form": form, "title": "编辑景点"})

    form = AttractionModelForm(data=request.POST, files=request.FILES, instance=attraction)
    if form.is_valid():
        form.save()
        return redirect("/travel/list/")

    return render(request, "travel_form.html", {"form": form, "title": "编辑景点"})


def travel_del(request, pk):
    """删除景点（管理员）"""
    # 检查权限
    info = request.session.get("info")
    if not info or info.get("role") != "admin":
        return redirect("/login/")

    Attraction.objects.filter(pk=pk).delete()
    return redirect("/travel/list/")
