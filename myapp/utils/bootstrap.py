"""
Bootstrap表单增强工具
为Django表单添加Bootstrap样式
"""
from django import forms


class BootStrap:
    """Bootstrap样式增强基类"""
    bootstrap_exclude_fields = []

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for name, field in self.fields.items():
            if name in self.bootstrap_exclude_fields:
                continue
            # 添加Bootstrap的form-control类
            if field.widget.attrs.get("class"):
                field.widget.attrs["class"] += " form-control"
            else:
                field.widget.attrs["class"] = "form-control"
            # 添加placeholder
            if not field.widget.attrs.get("placeholder"):
                field.widget.attrs["placeholder"] = field.label


class BootStrapModelForm(BootStrap, forms.ModelForm):
    """ModelForm的Bootstrap增强版本"""
    pass


class BootStrapForm(BootStrap, forms.Form):
    """Form的Bootstrap增强版本"""
    pass
