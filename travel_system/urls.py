"""
URL configuration for travel_system project.
"""
from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from myapp.views import account, travel, comment, chart, user

urlpatterns = [
    # 账户/认证相关
    path("", account.index),
    path("login/", account.login),
    path("register/", account.register),
    path("logout/", account.logout),
    path("image/code/", account.image_code),

    # 景点管理相关
    path("travel/list/", travel.travel_list),
    path("travel/detail/<int:pk>/", travel.travel_detail),
    path("travel/add/", travel.travel_add),
    path("travel/<int:pk>/update/", travel.travel_update),
    path("travel/<int:pk>/del/", travel.travel_del),

    # 评论相关
    path("comment/add/<int:attraction_id>/", comment.comment_add),
    path("comment/<int:pk>/del/", comment.comment_del),

    # 收藏相关
    path("favorite/toggle/<int:attraction_id>/", comment.favorite_toggle),
    path("favorite/list/", comment.favorite_list),

    # 后台管理相关
    path("admin/list/", user.admin_list),
    path("admin/add/", user.admin_add),
    path("admin/<int:pk>/update/", user.admin_update),
    path("admin/<int:pk>/del/", user.admin_del),
    path("admin/<int:pk>/reset/", user.admin_reset),

    # 用户管理相关
    path("user/list/", user.user_list),
    path("user/<int:pk>/del/", user.user_del),

    # 数据统计相关
    path("chart/list/", chart.chart_list),
    path("chart/city/", chart.chart_city),
    path("chart/hot/", chart.chart_hot),

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
