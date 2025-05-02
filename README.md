# 高数随身助手 (Advanced Math Pocket Assistant)

[中文](README.md) | [English](README_EN.md)

一款帮助学生和专业人士快速查询和理解高等数学公式的Flutter应用。

## 应用特点

- 📚 包含多种高等数学公式分类（极限、导数、积分、级数、向量、微分方程）
- 🔍 强大的搜索功能，支持按标题、描述和标签搜索
- 🏷️ 分类筛选系统，轻松找到所需公式
- 📱 响应式设计，支持浅色和深色主题
- 📝 详细的公式说明和应用场景

## 应用结构

```
lib/
├── data/
│   └── formula_data.dart      # 公式数据
├── models/
│   └── formula.dart           # 公式模型类
├── providers/
│   └── formula_provider.dart  # 状态管理
├── screens/
│   ├── formula_screen.dart    # 主公式列表界面
│   └── formula_detail_screen.dart # 公式详情界面
├── theme/
│   └── app_theme.dart         # 应用主题设置
├── utils/
│   └── page_transitions.dart  # 页面过渡动画
├── widgets/
│   └── formula_card.dart      # 公式卡片组件
└── main.dart                  # 应用入口
```

## 安装与使用

1. 确保已安装Flutter开发环境
2. 克隆此仓库
3. 运行 `flutter pub get` 安装依赖
4. 使用 `flutter run` 启动应用

## 开发与贡献

欢迎提交问题和改进建议！

## Flutter资源

- [Flutter官方文档](https://docs.flutter.dev/)
- [Lab: 编写你的第一个Flutter应用](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: 实用Flutter示例](https://docs.flutter.dev/cookbook)
