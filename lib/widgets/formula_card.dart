import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

import '../models/formula.dart';
import '../screens/formula_detail_screen.dart';
import '../utils/page_transitions.dart';

class FormulaCard extends StatefulWidget {
  final Formula formula;
  
  const FormulaCard({super.key, required this.formula});

  @override
  State<FormulaCard> createState() => _FormulaCardState();
}

class _FormulaCardState extends State<FormulaCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    
    _elevationAnimation = Tween<double>(begin: 2.0, end: 6.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            clipBehavior: Clip.antiAlias,
            elevation: _elevationAnimation.value,
            child: InkWell(
              onTapDown: (_) => _controller.forward(),
              onTapUp: (_) => _controller.reverse(),
              onTapCancel: () => _controller.reverse(),
              onTap: () {
                // 使用自定义动画导航到公式详情页面
                context.pushWithSlide(
                  FormulaDetailScreen(formula: widget.formula),
                  curve: Curves.easeOutQuart,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 公式标题栏
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withAlpha(20),
                      border: Border(
                        bottom: BorderSide(
                          color: theme.colorScheme.primary.withAlpha(50),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.formula.title,
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: theme.colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                  
                  // 公式内容
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // LaTeX公式显示
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Math.tex(
                            widget.formula.latex,
                            textStyle: const TextStyle(fontSize: 22),
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // 公式描述
                        Text(
                          widget.formula.description, 
                          style: theme.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 16),
                        
                        // 标签和分类
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            Chip(
                              label: Text(widget.formula.category),
                              backgroundColor: theme.colorScheme.primary.withAlpha(40),
                              side: BorderSide(
                                color: theme.colorScheme.primary.withAlpha(60),
                                width: 1,
                              ),
                              padding: const EdgeInsets.all(0),
                            ),
                            ...widget.formula.tags.map(
                              (tag) => Chip(
                                label: Text(tag),
                                backgroundColor: theme.colorScheme.secondary.withAlpha(30),
                                side: BorderSide(
                                  color: theme.colorScheme.secondary.withAlpha(60),
                                  width: 1,
                                ),
                                padding: const EdgeInsets.all(0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
