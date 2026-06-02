"""
认证中间件
用于检查用户登录状态，未登录用户跳转到登录页面
"""
from django.utils.deprecation import MiddlewareMixin
from django.shortcuts import redirect


class AuthMiddleware(MiddlewareMixin):
    """认证中间件"""

    def process_request(self, request):
        # 白名单：不需要登录就能访问的页面
        white_list = [
            "/login/",
            "/register/",
            "/image/code/",
            "/travel/list/",
            "/travel/detail/",
        ]

        # 检查当前路径是否在白名单中
        for path in white_list:
            if request.path_info.startswith(path) or request.path_info == "/":
                return None

        # 特殊处理：景点详情页允许未登录用户访问
        if request.path_info.startswith("/travel/detail/"):
            return None

        # 检查session中是否有用户信息
        info = request.session.get("info")
        if info:
            return None

        # 未登录，重定向到登录页
        return redirect("/login/")
