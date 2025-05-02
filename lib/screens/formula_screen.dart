import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/formula_provider.dart';
import '../widgets/formula_card.dart';

class FormulaScreen extends StatefulWidget {
  const FormulaScreen({super.key});

  @override
  State<FormulaScreen> createState() => _FormulaScreenState();
}

class _FormulaScreenState extends State<FormulaScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('高数公式查询'), elevation: 0),
      body: Column(
        children: [
          // 搜索栏
          Container(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '搜索公式...',
                hintStyle: TextStyle(
                  color: theme.colorScheme.onSurface.withAlpha(150),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: theme.colorScheme.primary,
                ),
                suffixIcon:
                    _searchController.text.isNotEmpty
                        ? IconButton(
                          icon: const Icon(Icons.clear),
                          color: theme.colorScheme.primary,
                          onPressed: () {
                            _searchController.clear();
                            Provider.of<FormulaProvider>(
                              context,
                              listen: false,
                            ).clearSearch();
                            setState(() {}); // Update to hide clear button
                          },
                        )
                        : null,
                filled: true,
                fillColor: theme.colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary.withAlpha(75),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary.withAlpha(75),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {}); // Update to show/hide clear button
                Provider.of<FormulaProvider>(
                  context,
                  listen: false,
                ).search(value);
              },
            ),
          ),

          // 分类选择器
          Container(
            height: 56,
            margin: const EdgeInsets.only(bottom: 8.0),
            child: Consumer<FormulaProvider>(
              builder: (context, provider, child) {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FilterChip(
                        label: const Text('全部'),
                        selected: provider.selectedCategory.isEmpty,
                        showCheckmark: false,
                        avatar:
                            provider.selectedCategory.isEmpty
                                ? const Icon(Icons.check_circle, size: 18)
                                : null,
                        onSelected: (selected) {
                          if (selected) {
                            provider.clearCategory();
                          }
                        },
                      ),
                    ),
                    ...provider.categories.map((category) {
                      final isSelected = provider.selectedCategory == category;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Text(category),
                          selected: isSelected,
                          showCheckmark: false,
                          avatar:
                              isSelected
                                  ? const Icon(Icons.check_circle, size: 18)
                                  : null,
                          onSelected: (selected) {
                            if (selected) {
                              provider.setCategory(category);
                            } else {
                              provider.clearCategory();
                            }
                          },
                        ),
                      );
                    }),
                  ],
                );
              },
            ),
          ),

          // 公式列表
          Expanded(
            child: Consumer<FormulaProvider>(
              builder: (context, provider, child) {
                final formulas = provider.formulas;

                if (formulas.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: theme.colorScheme.primary.withAlpha(150),
                        ),
                        const SizedBox(height: 16),
                        Text('没有找到匹配的公式', style: theme.textTheme.titleLarge),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: formulas.length,
                  itemBuilder: (context, index) {
                    final formula = formulas[index];
                    return FormulaCard(formula: formula);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
