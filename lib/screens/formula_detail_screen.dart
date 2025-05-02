import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import '../models/formula.dart';

class FormulaDetailScreen extends StatelessWidget {
  final Formula formula;

  const FormulaDetailScreen({super.key, required this.formula});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(formula.title), elevation: 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 公式显示（大尺寸）
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 32.0,
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withAlpha(15),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  // 分类标签
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      Chip(
                        label: Text(
                          formula.category,
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: theme.colorScheme.primary.withAlpha(
                          30,
                        ),
                        side: BorderSide(
                          color: theme.colorScheme.primary.withAlpha(60),
                          width: 1,
                        ),
                        padding: const EdgeInsets.all(0),
                      ),
                      ...formula.tags.map(
                        (tag) => Chip(
                          label: Text(
                            tag,
                            style: TextStyle(
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                          backgroundColor: theme.colorScheme.secondary
                              .withAlpha(20),
                          side: BorderSide(
                            color: theme.colorScheme.secondary.withAlpha(50),
                            width: 1,
                          ),
                          padding: const EdgeInsets.all(0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // 公式显示
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24.0),
                      alignment: Alignment.center,
                      child: Math.tex(
                        formula.latex,
                        textStyle: const TextStyle(fontSize: 26),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 详细内容部分
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 详细描述
                  _buildSectionHeader(theme, '公式说明'),
                  const SizedBox(height: 12),
                  _buildSectionContent(theme, formula.description),
                  const SizedBox(height: 32),

                  // 应用场景
                  _buildSectionHeader(theme, '应用场景'),
                  const SizedBox(height: 12),
                  _buildSectionContent(theme, formula.applicationScenario),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 构建章节标题
  Widget _buildSectionHeader(ThemeData theme, String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 24,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // 构建章节内容
  Widget _buildSectionContent(ThemeData theme, String content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outline.withAlpha(50)),
      ),
      child: Text(content, style: theme.textTheme.bodyLarge),
    );
  }
}
