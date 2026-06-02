"""
MD5加密工具
"""
import hashlib
from django.conf import settings


def md5(data_string):
    """
    使用MD5加密字符串，添加SECRET_KEY作为盐值
    """
    obj = hashlib.md5(settings.SECRET_KEY.encode("utf-8"))
    obj.update(data_string.encode("utf-8"))
    return obj.hexdigest()
