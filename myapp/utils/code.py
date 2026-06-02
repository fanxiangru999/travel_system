"""
验证码生成工具
"""
import random
from PIL import Image, ImageDraw, ImageFont, ImageFilter


def check_code(width=120, height=30, char_length=5, font_file=None, font_size=28):
    """
    生成验证码图片

    :param width: 图片宽度
    :param height: 图片高度
    :param char_length: 验证码字符数量
    :param font_file: 字体文件路径
    :param font_size: 字体大小
    :return: (Image对象, 验证码字符串)
    """
    # 创建图片
    img = Image.new(mode="RGB", size=(width, height), color=(255, 255, 255))
    draw = ImageDraw.Draw(img, mode="RGB")

    # 生成验证码字符
    code = ""
    for i in range(char_length):
        char = str(random.randint(0, 9))
        code += char
        # 随机颜色
        color = (random.randint(0, 180), random.randint(0, 180), random.randint(0, 180))
        # 绘制字符
        draw.text(
            (i * width / char_length + 5, 0),
            char,
            fill=color,
            font=ImageFont.load_default() if not font_file else ImageFont.truetype(font_file, font_size)
        )

    # 添加干扰线
    for i in range(3):
        x1 = random.randint(0, width)
        y1 = random.randint(0, height)
        x2 = random.randint(0, width)
        y2 = random.randint(0, height)
        draw.line((x1, y1, x2, y2), fill=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)))

    # 添加干扰点
    for i in range(50):
        draw.point(
            (random.randint(0, width), random.randint(0, height)),
            fill=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))
        )

    # 添加滤镜
    img = img.filter(ImageFilter.EDGE_ENHANCE_MORE)

    return img, code
