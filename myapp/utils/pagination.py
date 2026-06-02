"""
自定义分页组件
"""
from django.utils.safestring import mark_safe


class Pagination:
    """
    自定义分页类

    使用方法：
        1. 在视图中实例化：
            page_obj = Pagination(request, queryset, page_size=10)
        2. 获取分页后的数据：
            page_obj.page_queryset
        3. 在模板中显示分页按钮：
            {{ page_obj.html|safe }}
    """

    def __init__(self, request, queryset, page_size=10, page_param="page", plus=5):
        """
        初始化分页对象

        :param request: Django请求对象
        :param queryset: 要分页的数据集
        :param page_size: 每页显示数量，默认10
        :param page_param: URL中的页码参数名，默认"page"
        :param plus: 当前页前后显示的页码数量，默认5
        """
        import copy
        query_dict = copy.deepcopy(request.GET)
        query_dict._mutable = True
        self.query_dict = query_dict
        self.page_param = page_param

        # 获取当前页码
        page = request.GET.get(page_param, "1")
        if page.isdecimal():
            page = int(page)
        else:
            page = 1
        self.page = page
        self.page_size = page_size

        # 计算起止位置
        self.start = (page - 1) * page_size
        self.end = page * page_size

        # 获取分页数据
        self.page_queryset = queryset[self.start:self.end]

        # 计算总页数
        total_count = queryset.count()
        total_page_count, div = divmod(total_count, page_size)
        if div:
            total_page_count += 1
        self.total_page_count = total_page_count
        self.plus = plus

    def html(self):
        """
        生成分页HTML
        """
        # 计算显示的页码范围
        if self.total_page_count <= 2 * self.plus + 1:
            start_page = 1
            end_page = self.total_page_count
        else:
            if self.page <= self.plus:
                start_page = 1
                end_page = 2 * self.plus + 1
            elif self.page > self.total_page_count - self.plus:
                start_page = self.total_page_count - 2 * self.plus
                end_page = self.total_page_count
            else:
                start_page = self.page - self.plus
                end_page = self.page + self.plus

        # 生成HTML
        page_str_list = []

        # 首页
        self.query_dict[self.page_param] = 1
        page_str_list.append(
            f'<li><a href="?{self.query_dict.urlencode()}">首页</a></li>'
        )

        # 上一页
        if self.page > 1:
            self.query_dict[self.page_param] = self.page - 1
            page_str_list.append(
                f'<li><a href="?{self.query_dict.urlencode()}">上一页</a></li>'
            )
        else:
            page_str_list.append(
                f'<li class="disabled"><a href="#">上一页</a></li>'
            )

        # 页码
        for i in range(start_page, end_page + 1):
            self.query_dict[self.page_param] = i
            if i == self.page:
                page_str_list.append(
                    f'<li class="active"><a href="?{self.query_dict.urlencode()}">{i}</a></li>'
                )
            else:
                page_str_list.append(
                    f'<li><a href="?{self.query_dict.urlencode()}">{i}</a></li>'
                )

        # 下一页
        if self.page < self.total_page_count:
            self.query_dict[self.page_param] = self.page + 1
            page_str_list.append(
                f'<li><a href="?{self.query_dict.urlencode()}">下一页</a></li>'
            )
        else:
            page_str_list.append(
                f'<li class="disabled"><a href="#">下一页</a></li>'
            )

        # 尾页
        self.query_dict[self.page_param] = self.total_page_count
        page_str_list.append(
            f'<li><a href="?{self.query_dict.urlencode()}">尾页</a></li>'
        )

        page_string = "".join(page_str_list)
        return mark_safe(page_string)
