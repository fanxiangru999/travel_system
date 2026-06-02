# 旅游信息管理与推荐 Web 系统

基于 Django 4.2 开发的旅游景点信息管理系统，支持景点浏览、评论、收藏，以及面向管理员的景点 / 用户管理和数据可视化统计。

## 功能特性

系统区分**游客**、**普通用户**、**管理员**三种角色：

| 模块 | 功能 | 可用角色 |
| --- | --- | --- |
| 账户认证 | 注册、登录、注销、图形验证码 | 全部 |
| 景点浏览 | 景点列表（按名称搜索、按城市筛选、分页）、景点详情 | 游客及以上 |
| 评论 | 发表评论、删除评论（作者或管理员） | 登录用户 |
| 收藏 | 收藏 / 取消收藏（AJAX）、我的收藏列表 | 普通用户 |
| 景点管理 | 景点的新增 / 编辑 / 删除（含图片上传） | 管理员 |
| 用户管理 | 用户列表、删除用户 | 管理员 |
| 管理员管理 | 管理员的增删改、重置密码 | 管理员 |
| 数据统计 | 概览统计、各城市景点数量（柱状图）、热门景点 Top10（饼图） | 管理员 |

## 技术栈

- **后端**：Python 3.12+ / Django 4.2.8
- **数据库**：MySQL 5.7+ / 8.0
- **前端**：Bootstrap 3.4.1、jQuery 3.6.0、bootstrap-datepicker
- **数据可视化**：Apache ECharts
- **图像处理**：Pillow（图形验证码、景点图片）

## 项目结构

```
travel_system/
├── manage.py                 # Django 管理入口
├── download_images.py        # 下载景点示例图片脚本
├── media/attractions/        # 上传的景点图片（MEDIA_ROOT）
├── travel_system/            # 项目配置
│   ├── settings.py           # 全局配置（数据库、媒体、中间件等）
│   ├── urls.py               # 路由总表
│   └── wsgi.py
└── myapp/                    # 主应用
    ├── models.py             # 数据模型：Admin / User / Attraction / Comment / Favorite
    ├── admin.py
    ├── middleware/auth.py    # 自定义登录认证中间件
    ├── views/                # 视图（按功能拆分）
    │   ├── account.py        # 登录 / 注册 / 注销 / 验证码
    │   ├── travel.py         # 景点 CRUD
    │   ├── comment.py        # 评论与收藏
    │   ├── user.py           # 用户与管理员管理
    │   └── chart.py          # 数据统计图表
    ├── utils/                # 工具：表单、MD5 加密、验证码、分页
    ├── templates/            # HTML 模板
    ├── static/               # 静态资源（Bootstrap / jQuery / ECharts）
    └── migrations/           # 数据库迁移文件
```

## 数据模型

- **Admin**：管理员（用户名、密码）
- **User**：普通用户（用户名、密码、昵称、邮箱、注册时间）
- **Attraction**：景点（名称、城市、门票价格、简介、图片、发布 / 更新时间）
- **Comment**：评论（关联用户与景点、内容、时间）
- **Favorite**：收藏（关联用户与景点，同一用户对同一景点不可重复收藏）

## 快速开始

### 1. 环境要求

- Python 3.12 及以上
- MySQL 数据库服务

### 2. 安装依赖

```bash
pip install django==4.2.8 mysqlclient Pillow
```

> 若 `mysqlclient` 安装失败，可改用 `pip install pymysql`，并在 `travel_system/__init__.py` 中加入：
> ```python
> import pymysql
> pymysql.install_as_MySQLdb()
> ```

### 3. 配置数据库

先在 MySQL 中创建数据库：

```sql
CREATE DATABASE travel_db CHARACTER SET utf8;
```

数据库连接信息在 `travel_system/settings.py` 中配置，默认如下，请按实际环境修改：

```python
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",
        "NAME": "travel_db",
        "USER": "root",
        "PASSWORD": "123456",
        "HOST": "127.0.0.1",
        "PORT": 3306,
    }
}
```

### 4. 执行数据库迁移

```bash
python manage.py migrate
```

### 5. 创建初始管理员账号

本系统使用自定义的 `Admin` 表（非 Django 内置后台），密码以 MD5 + 盐值加密存储，需通过 shell 创建首个管理员：

```bash
python manage.py shell
```

```python
from myapp.models import Admin
from myapp.utils.encrypt import md5
Admin.objects.create(username="admin", password=md5("admin123"))
```

### 6. （可选）下载景点示例图片

```bash
python download_images.py
```

### 7. 启动服务

```bash
python manage.py runserver
```

浏览器访问 http://127.0.0.1:8000/ ，将自动跳转到景点列表页。

- 普通用户：通过注册页面自行注册后登录
- 管理员：使用上一步创建的账号登录，登录后进入数据统计页

## 主要路由

| 路径 | 说明 |
| --- | --- |
| `/` | 首页（跳转景点列表） |
| `/login/`、`/register/`、`/logout/` | 登录 / 注册 / 注销 |
| `/travel/list/`、`/travel/detail/<pk>/` | 景点列表 / 详情 |
| `/travel/add/`、`/travel/<pk>/update/`、`/travel/<pk>/del/` | 景点增 / 改 / 删（管理员） |
| `/comment/add/<id>/`、`/comment/<pk>/del/` | 评论增 / 删 |
| `/favorite/toggle/<id>/`、`/favorite/list/` | 收藏切换 / 收藏列表 |
| `/user/list/`、`/admin/list/` | 用户管理 / 管理员管理 |
| `/chart/list/`、`/chart/city/`、`/chart/hot/` | 统计页 / 城市统计 / 热度统计 |

访问控制由 `myapp/middleware/auth.py` 中的 `AuthMiddleware` 统一处理：登录、注册、验证码、景点列表与详情页对游客开放，其余页面需登录，管理类操作还会在视图内校验 `admin` 角色。

## 注意事项

当前配置面向开发 / 教学环境，部署到生产环境前请务必：

- 在 `settings.py` 中将 `DEBUG` 设为 `False`，并正确配置 `ALLOWED_HOSTS`
- 更换 `SECRET_KEY`，且不要硬编码数据库密码（建议使用环境变量）
- 密码加密当前使用 MD5，安全性较弱，生产环境建议改用更强的哈希算法（如 PBKDF2 / bcrypt）
- 通过 Nginx 等配置静态文件与媒体文件服务
