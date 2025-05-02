class Formula {
  final String id;
  final String title;
  final String latex;
  final String description;
  final String category;
  final List<String> tags;
  final String applicationScenario;

  Formula({
    required this.id,
    required this.title,
    required this.latex,
    required this.description,
    required this.category,
    required this.tags,
    this.applicationScenario = '此公式常用于解决相关领域的计算问题，是高等数学中的重要公式之一。',
  });

  // 用于搜索匹配的方法
  bool matchesQuery(String query) {
    final lowerQuery = query.toLowerCase();
    return title.toLowerCase().contains(lowerQuery) ||
        description.toLowerCase().contains(lowerQuery) ||
        tags.any((tag) => tag.toLowerCase().contains(lowerQuery));
  }
}

// 公式分类枚举
class FormulaCategories {
  static const String limits = '极限';
  static const String derivatives = '导数';
  static const String integrals = '积分';
  static const String series = '级数';
  static const String vectors = '向量';
  static const String differentialEquations = '微分方程';

  static List<String> all() {
    return [
      limits,
      derivatives,
      integrals,
      series,
      vectors,
      differentialEquations,
    ];
  }
}
