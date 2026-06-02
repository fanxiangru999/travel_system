"""
下载景点示例图片脚本
使用 Unsplash 免费图片 API
"""
import os
import urllib.request

# 图片保存目录
SAVE_DIR = os.path.join(os.path.dirname(__file__), 'media', 'attractions')
os.makedirs(SAVE_DIR, exist_ok=True)

# 使用 picsum.photos 提供的随机风景图片
# 每个景点使用不同的ID确保图片不同
IMAGES = {
    'gugong.jpg': 'https://picsum.photos/seed/gugong/800/600',
    'changcheng.jpg': 'https://picsum.photos/seed/changcheng/800/600',
    'tiantan.jpg': 'https://picsum.photos/seed/tiantan/800/600',
    'yiheyuan.jpg': 'https://picsum.photos/seed/yiheyuan/800/600',
    'dongfangmingzhu.jpg': 'https://picsum.photos/seed/dongfang/800/600',
    'waitan.jpg': 'https://picsum.photos/seed/waitan/800/600',
    'disneyland.jpg': 'https://picsum.photos/seed/disney/800/600',
    'xihu.jpg': 'https://picsum.photos/seed/xihu/800/600',
    'lingyinsi.jpg': 'https://picsum.photos/seed/lingyin/800/600',
    'qiandaohu.jpg': 'https://picsum.photos/seed/qiandao/800/600',
    'bingmayong.jpg': 'https://picsum.photos/seed/bingma/800/600',
    'huaqinggong.jpg': 'https://picsum.photos/seed/huaqing/800/600',
    'dayanta.jpg': 'https://picsum.photos/seed/dayanta/800/600',
    'panda.jpg': 'https://picsum.photos/seed/panda/800/600',
    'kuanzhai.jpg': 'https://picsum.photos/seed/kuanzhai/800/600',
    'dujiangyan.jpg': 'https://picsum.photos/seed/dujiang/800/600',
    'guangzhoutower.jpg': 'https://picsum.photos/seed/gztower/800/600',
    'chimelong.jpg': 'https://picsum.photos/seed/chimelong/800/600',
    'tianyahaijiao.jpg': 'https://picsum.photos/seed/tianya/800/600',
    'yalongwan.jpg': 'https://picsum.photos/seed/yalong/800/600',
    'wuzhizhou.jpg': 'https://picsum.photos/seed/wuzhizhou/800/600',
}

def download_images():
    print("开始下载示例图片...")
    for filename, url in IMAGES.items():
        filepath = os.path.join(SAVE_DIR, filename)
        if os.path.exists(filepath):
            print(f"  跳过 {filename} (已存在)")
            continue
        try:
            print(f"  下载 {filename}...")
            urllib.request.urlretrieve(url, filepath)
            print(f"  完成 {filename}")
        except Exception as e:
            print(f"  失败 {filename}: {e}")
    print("下载完成！")

if __name__ == '__main__':
    download_images()
