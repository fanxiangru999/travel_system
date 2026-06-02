"""
评论与收藏视图
处理用户评论和收藏功能
"""
from django.shortcuts import render, redirect, get_object_or_404
from django.http import JsonResponse
from myapp.models import Comment, Favorite, Attraction
from myapp.utils.form import CommentForm
from myapp.utils.pagination import Pagination


def comment_add(request, attraction_id):
    """添加评论"""
    # 检查是否登录
    info = request.session.get("info")
    if not info:
        return redirect("/login/")

    if request.method == "POST":
        form = CommentForm(data=request.POST)
        if form.is_valid():
            Comment.objects.create(
                user_id=info["id"],
                attraction_id=attraction_id,
                content=form.cleaned_data["content"]
            )
        else:
            # 如果评论验证失败，重定向回详情页并显示错误
            attraction = get_object_or_404(Attraction, pk=attraction_id)
            comments = attraction.comment_set.all().select_related("user")
            is_favorite = Favorite.objects.filter(
                user_id=info["id"], attraction_id=attraction_id
            ).exists()
            context = {
                "attraction": attraction,
                "comments": comments,
                "form": form,
                "is_favorite": is_favorite,
            }
            return render(request, "travel_detail.html", context)

    return redirect(f"/travel/detail/{attraction_id}/")


def comment_del(request, pk):
    """删除评论"""
    info = request.session.get("info")
    if not info:
        return redirect("/login/")

    comment = get_object_or_404(Comment, pk=pk)

    # 只有评论作者或管理员可以删除
    if info.get("role") == "admin" or (info.get("role") == "user" and comment.user_id == info["id"]):
        attraction_id = comment.attraction_id
        comment.delete()
        return redirect(f"/travel/detail/{attraction_id}/")

    return redirect("/travel/list/")


def favorite_toggle(request, attraction_id):
    """切换收藏状态"""
    info = request.session.get("info")
    if not info or info.get("role") != "user":
        return JsonResponse({"status": False, "error": "请先登录"})

    user_id = info["id"]

    # 检查是否已收藏
    favorite = Favorite.objects.filter(user_id=user_id, attraction_id=attraction_id).first()

    if favorite:
        # 已收藏，取消收藏
        favorite.delete()
        return JsonResponse({"status": True, "is_favorite": False, "message": "已取消收藏"})
    else:
        # 未收藏，添加收藏
        Favorite.objects.create(user_id=user_id, attraction_id=attraction_id)
        return JsonResponse({"status": True, "is_favorite": True, "message": "收藏成功"})


def favorite_list(request):
    """我的收藏列表"""
    info = request.session.get("info")
    if not info or info.get("role") != "user":
        return redirect("/login/")

    # 获取用户的收藏
    favorites = Favorite.objects.filter(user_id=info["id"]).select_related("attraction")

    # 分页
    page_obj = Pagination(request, favorites, page_size=9)

    context = {
        "queryset": page_obj.page_queryset,
        "page_string": page_obj.html(),
    }
    return render(request, "favorite_list.html", context)
