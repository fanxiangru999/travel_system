"""
数据统计与可视化视图
使用ECharts展示统计图表
"""
from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.db.models import Count
from myapp.models import Attraction, User, Comment, Favorite


def chart_list(request):
    """统计页面"""
    # 检查权限
    info = request.session.get("info")
    if not info or info.get("role") != "admin":
        return redirect("/login/")

    # 基础统计数据
    attraction_count = Attraction.objects.count()
    user_count = User.objects.count()
    comment_count = Comment.objects.count()
    favorite_count = Favorite.objects.count()

    context = {
        "attraction_count": attraction_count,
        "user_count": user_count,
        "comment_count": comment_count,
        "favorite_count": favorite_count,
    }
    return render(request, "chart_list.html", context)


def chart_city(request):
    """各城市景点数量统计（柱状图）"""
    # 按城市分组统计景点数量
    data = Attraction.objects.values("city").annotate(count=Count("id")).order_by("-count")

    # 转换为ECharts需要的格式
    cities = [item["city"] for item in data]
    counts = [item["count"] for item in data]

    return JsonResponse({
        "status": True,
        "data": {
            "x_axis": cities,
            "series": counts,
        }
    })


def chart_hot(request):
    """景点热度统计（饼图 - 按收藏数）"""
    # 统计每个景点的收藏数量
    attractions = Attraction.objects.annotate(
        fav_count=Count("favorite")
    ).filter(fav_count__gt=0).order_by("-fav_count")[:10]  # 取前10个热门景点

    # 转换为ECharts饼图格式
    data = [
        {"value": attr.fav_count, "name": attr.name}
        for attr in attractions
    ]

    # 如果没有数据，返回示例数据
    if not data:
        data = [
            {"value": 0, "name": "暂无数据"}
        ]

    return JsonResponse({
        "status": True,
        "data": data
    })
