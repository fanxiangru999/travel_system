from django.db import models


class Admin(models.Model):
    """管理员表"""
    username = models.CharField(verbose_name="用户名", max_length=32)
    password = models.CharField(verbose_name="密码", max_length=64)

    class Meta:
        verbose_name = "管理员"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username


class User(models.Model):
    """普通用户表"""
    username = models.CharField(verbose_name="用户名", max_length=32, unique=True)
    password = models.CharField(verbose_name="密码", max_length=64)
    nickname = models.CharField(verbose_name="昵称", max_length=32, blank=True, default="")
    email = models.EmailField(verbose_name="邮箱", blank=True, default="")
    create_time = models.DateTimeField(verbose_name="注册时间", auto_now_add=True)

    class Meta:
        verbose_name = "用户"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username


class Attraction(models.Model):
    """旅游景点表"""
    name = models.CharField(verbose_name="景点名称", max_length=100)
    city = models.CharField(verbose_name="所属城市", max_length=50)
    price = models.DecimalField(verbose_name="门票价格", max_digits=10, decimal_places=2, default=0)
    description = models.TextField(verbose_name="景点简介", blank=True, default="")
    image = models.ImageField(verbose_name="景点图片", upload_to="attractions/", blank=True, null=True)
    create_time = models.DateTimeField(verbose_name="发布时间", auto_now_add=True)
    update_time = models.DateTimeField(verbose_name="更新时间", auto_now=True)

    class Meta:
        verbose_name = "景点"
        verbose_name_plural = verbose_name
        ordering = ["-create_time"]

    def __str__(self):
        return self.name

    @property
    def favorite_count(self):
        """获取收藏数量"""
        return self.favorite_set.count()

    @property
    def comment_count(self):
        """获取评论数量"""
        return self.comment_set.count()


class Comment(models.Model):
    """评论表"""
    user = models.ForeignKey(User, verbose_name="用户", on_delete=models.CASCADE)
    attraction = models.ForeignKey(Attraction, verbose_name="景点", on_delete=models.CASCADE)
    content = models.TextField(verbose_name="评论内容")
    create_time = models.DateTimeField(verbose_name="评论时间", auto_now_add=True)

    class Meta:
        verbose_name = "评论"
        verbose_name_plural = verbose_name
        ordering = ["-create_time"]

    def __str__(self):
        return f"{self.user.username} 评论了 {self.attraction.name}"


class Favorite(models.Model):
    """收藏表"""
    user = models.ForeignKey(User, verbose_name="用户", on_delete=models.CASCADE)
    attraction = models.ForeignKey(Attraction, verbose_name="景点", on_delete=models.CASCADE)
    create_time = models.DateTimeField(verbose_name="收藏时间", auto_now_add=True)

    class Meta:
        verbose_name = "收藏"
        verbose_name_plural = verbose_name
        unique_together = ("user", "attraction")  # 同一用户不能重复收藏同一景点
        ordering = ["-create_time"]

    def __str__(self):
        return f"{self.user.username} 收藏了 {self.attraction.name}"
