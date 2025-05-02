import '../models/formula.dart';

class FormulaDatabase {
  // 单例模式
  static final FormulaDatabase _instance = FormulaDatabase._internal();

  factory FormulaDatabase() {
    return _instance;
  }

  FormulaDatabase._internal();

  // 获取所有公式
  List<Formula> getAllFormulas() {
    return [
      // 极限公式
      Formula(
        id: 'limit_1',
        title: '极限基本定义',
        latex: '\\lim_{x \\to a} f(x) = L',
        description: '当x无限接近a时，函数f(x)无限接近L',
        category: FormulaCategories.limits,
        tags: ['定义'],
        applicationScenario:
            '极限基本定义是微积分的基础，用于描述函数在某一点附近的行为。在研究函数连续性、导数和积分时都需要用到极限概念。例如，在分析函数图像的渐近线、间断点等特性时，极限是核心工具。',
      ),
      Formula(
        id: 'limit_2',
        title: '重要极限',
        latex: '\\lim_{x \\to 0} \\frac{\\sin x}{x} = 1',
        description: 'x趋近于0时，sinx/x的极限等于1',
        category: FormulaCategories.limits,
        tags: ['三角函数'],
        applicationScenario:
            '这个重要极限在三角函数的导数计算中起着关键作用，特别是在计算sin(x)和cos(x)的导数时。在物理学中，它用于小角度近似（如简谐振动分析），以及光学中的衍射理论。在工程领域，这个极限用于信号处理中的傅里叶变换和滤波器设计。',
      ),
      Formula(
        id: 'limit_3',
        title: '自然对数的极限定义',
        latex: '\\lim_{n \\to \\infty} (1 + \\frac{1}{n})^n = e',
        description: 'e的定义式',
        category: FormulaCategories.limits,
        tags: ['自然对数', 'e'],
        applicationScenario:
            '自然对数e的极限定义在金融数学中用于计算连续复利，在概率论中用于泊松分布的推导，在人口增长和放射性衰变等自然现象的建模中也有广泛应用。这个极限是指数函数和对数函数的基础，在微分方程求解中经常出现。',
      ),

      // 导数公式
      Formula(
        id: 'derivative_1',
        title: '导数定义',
        latex: 'f\'(x) = \\lim_{h \\to 0} \\frac{f(x+h) - f(x)}{h}',
        description: '函数在一点的导数等于该点的切线斜率',
        category: FormulaCategories.derivatives,
        tags: ['定义'],
        applicationScenario:
            '导数定义是微积分中最基本的概念之一，用于描述函数变化率。在物理学中，它用于计算速度、加速度等物理量；在经济学中，用于边际分析；在工程中，用于优化设计和控制系统。导数是理解函数行为、寻找极值点和解决实际问题的关键工具。',
      ),
      Formula(
        id: 'derivative_2',
        title: '幂函数求导公式',
        latex: '\\frac{d}{dx}(x^n) = nx^{n-1}',
        description: '幂函数的导数',
        category: FormulaCategories.derivatives,
        tags: ['幂函数'],
        applicationScenario:
            '幂函数求导公式是微积分中最常用的公式之一，广泛应用于物理学中的运动方程、经济学中的成本函数分析、工程学中的应力分析等。在多项式函数的求导中，这是最基本的工具，也是理解链式法则和复合函数求导的基础。',
      ),
      Formula(
        id: 'derivative_3',
        title: '指数函数求导公式',
        latex: '\\frac{d}{dx}(e^x) = e^x',
        description: '自然指数函数的导数等于其本身',
        category: FormulaCategories.derivatives,
        tags: ['指数函数'],
        applicationScenario:
            '指数函数求导公式在描述指数增长现象中非常重要，如人口增长、细菌繁殖、放射性衰变等。在微分方程中，这个性质使e^x成为解微分方程的关键函数。在电气工程中，它用于分析RC电路的充放电过程；在金融数学中，用于连续复利计算和期权定价模型。',
      ),
      Formula(
        id: 'derivative_4',
        title: '对数函数求导公式',
        latex: '\\frac{d}{dx}(\\ln x) = \\frac{1}{x}',
        description: '自然对数的导数',
        category: FormulaCategories.derivatives,
        tags: ['对数函数'],
        applicationScenario:
            '对数函数求导公式在处理乘积变为和的转换中非常有用。在信息论中，它用于计算信息熵；在统计学中，用于最大似然估计；在化学中，用于分析反应速率。这个公式也常用于积分换元和解决含有分数幂的微分方程。',
      ),

      // 积分公式
      Formula(
        id: 'integral_1',
        title: '不定积分定义',
        latex: '\\int f(x) dx = F(x) + C',
        description: '原函数与常数的和',
        category: FormulaCategories.integrals,
        tags: ['不定积分'],
        applicationScenario:
            '不定积分是微积分中求解原函数的基本工具。在物理学中，它用于计算位移、功和电荷等物理量；在工程中，用于计算质心、惯性矩和流体力学问题；在概率论中，用于计算累积分布函数。不定积分是解决微分方程的基础，也是定积分计算的前提。',
      ),
      Formula(
        id: 'integral_2',
        title: '定积分定义',
        latex:
            '\\int_{a}^{b} f(x) dx = \\lim_{n \\to \\infty} \\sum_{i=1}^{n} f(x_i^*) \\Delta x_i',
        description: '黎曼和的极限',
        category: FormulaCategories.integrals,
        tags: ['定积分'],
        applicationScenario:
            '定积分定义是计算有限区间内累积量的基础。在物理学中，它用于计算功、流量、电荷等；在概率论中，用于计算概率密度函数下的概率；在经济学中，用于计算消费者剩余和生产者剩余。定积分也是数值分析中许多算法的理论基础，如梯形法则和辛普森法则。',
      ),
      Formula(
        id: 'integral_3',
        title: '幂函数积分公式',
        latex: '\\int x^n dx = \\frac{x^{n+1}}{n+1} + C, n \\neq -1',
        description: '幂函数的不定积分',
        category: FormulaCategories.integrals,
        tags: ['幂函数'],
        applicationScenario:
            '幂函数积分公式是积分计算中最基本的公式之一。在物理学中，它用于计算运动物体的位移、动能和势能；在工程中，用于计算梁的弯曲、流体流动和热传导；在统计学中，用于计算矩和方差。这个公式是多项式积分和泰勒级数积分的基础。',
      ),
      Formula(
        id: 'integral_4',
        title: '指数函数积分公式',
        latex: '\\int e^x dx = e^x + C',
        description: '指数函数的不定积分',
        category: FormulaCategories.integrals,
        tags: ['指数函数'],
        applicationScenario:
            '指数函数积分公式在描述指数增长或衰减过程中非常重要。在物理学中，它用于分析放射性衰变、温度变化和电容充放电；在生物学中，用于种群增长模型；在金融学中，用于连续复利计算。这个公式也是解决一阶线性微分方程的关键工具。',
      ),

      // 级数公式
      Formula(
        id: 'series_1',
        title: '等比级数求和公式',
        latex: '\\sum_{i=0}^{n-1} ar^i = a\\frac{1-r^n}{1-r}, r \\neq 1',
        description: '有限项等比级数的和',
        category: FormulaCategories.series,
        tags: ['等比级数'],
        applicationScenario:
            '等比级数求和公式在计算有限项等比数列之和时非常有用。在金融学中，它用于计算有限期复利和年金现值；在概率论中，用于计算几何分布的期望；在计算机科学中，用于分析某些算法的时间复杂度。这个公式也用于计算分形的面积和周长。',
      ),
      Formula(
        id: 'series_2',
        title: '无穷等比级数求和公式',
        latex: '\\sum_{i=0}^{\\infty} ar^i = \\frac{a}{1-r}, |r| < 1',
        description: '当|r|<1时，无穷等比级数的和',
        category: FormulaCategories.series,
        tags: ['无穷级数'],
        applicationScenario:
            '无穷等比级数求和公式在分析收敛级数时非常重要。在经济学中，它用于计算无限期年金的现值；在物理学中，用于分析谐振系统和波动；在信号处理中，用于分析递归滤波器的响应。这个公式也是理解分数展开和生成函数的基础。',
      ),

      // 向量公式
      Formula(
        id: 'vector_1',
        title: '向量点积',
        latex: '\\vec{a} \\cdot \\vec{b} = |\\vec{a}||\\vec{b}|\\cos\\theta',
        description: '两个向量的点积等于它们的模乘以夹角的余弦',
        category: FormulaCategories.vectors,
        tags: ['点积'],
        applicationScenario:
            '向量点积在物理学和工程学中有广泛应用。在力学中，它用于计算力在某方向上的分量和功；在电磁学中，用于计算电场和磁场的通量；在计算机图形学中，用于光照模型和阴影计算。点积也是判断两向量正交性和计算向量投影的基本工具。',
      ),
      Formula(
        id: 'vector_2',
        title: '向量叉积',
        latex: '|\\vec{a} \\times \\vec{b}| = |\\vec{a}||\\vec{b}|\\sin\\theta',
        description: '两个向量的叉积的模等于它们的模乘以夹角的正弦',
        category: FormulaCategories.vectors,
        tags: ['叉积'],
        applicationScenario:
            '向量叉积在三维空间分析中非常重要。在物理学中，它用于计算力矩、角动量和洛伦兹力；在工程学中，用于计算面积和体积；在计算机图形学中，用于确定法向量和构建坐标系。叉积也用于判断两向量的相对方向和计算平行四边形的面积。',
      ),

      // 微分方程公式
      Formula(
        id: 'diff_eq_1',
        title: '一阶线性微分方程',
        latex: '\\frac{dy}{dx} + P(x)y = Q(x)',
        description: '一阶线性非齐次微分方程的标准形式',
        category: FormulaCategories.differentialEquations,
        tags: ['一阶'],
        applicationScenario:
            '一阶线性微分方程在描述动态系统中广泛应用。在物理学中，它用于分析RC电路、简谐振动和热传导；在生物学中，用于种群增长和药物代谢模型；在经济学中，用于市场均衡和通货膨胀模型。这类方程通常可以通过积分因子法求解。',
      ),
      Formula(
        id: 'diff_eq_2',
        title: '二阶常系数齐次线性微分方程',
        latex: 'a\\frac{d^2y}{dx^2} + b\\frac{dy}{dx} + cy = 0',
        description: '二阶常系数齐次线性微分方程的标准形式',
        category: FormulaCategories.differentialEquations,
        tags: ['二阶', '齐次'],
        applicationScenario:
            '二阶常系数齐次线性微分方程在描述振动系统中尤为重要。在物理学中，它用于分析弹簧-质量系统、RLC电路和波动方程；在结构工程中，用于分析梁的弯曲和结构振动；在控制理论中，用于分析系统响应和稳定性。这类方程通常通过特征方程法求解。',
      ),
    ];
  }

  // 按分类获取公式
  List<Formula> getFormulasByCategory(String category) {
    return getAllFormulas()
        .where((formula) => formula.category == category)
        .toList();
  }

  // 搜索公式
  List<Formula> searchFormulas(String query) {
    if (query.isEmpty) {
      return getAllFormulas();
    }
    return getAllFormulas()
        .where((formula) => formula.matchesQuery(query))
        .toList();
  }
}
