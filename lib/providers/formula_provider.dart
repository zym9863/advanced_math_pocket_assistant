import 'package:flutter/foundation.dart';
import '../models/formula.dart';
import '../data/formula_data.dart';

class FormulaProvider with ChangeNotifier {
  final FormulaDatabase _database = FormulaDatabase();
  List<Formula> _formulas = [];
  String _searchQuery = '';
  String _selectedCategory = '';

  FormulaProvider() {
    _formulas = _database.getAllFormulas();
  }

  // 获取所有公式
  List<Formula> get formulas {
    if (_selectedCategory.isNotEmpty) {
      return _database.getFormulasByCategory(_selectedCategory);
    }
    if (_searchQuery.isNotEmpty) {
      return _database.searchFormulas(_searchQuery);
    }
    return _database.getAllFormulas();
  }

  // 获取所有分类
  List<String> get categories => FormulaCategories.all();

  // 当前选中的分类
  String get selectedCategory => _selectedCategory;

  // 设置分类筛选
  void setCategory(String category) {
    _selectedCategory = category;
    _searchQuery = ''; // 清除搜索条件
    notifyListeners();
  }

  // 清除分类筛选
  void clearCategory() {
    _selectedCategory = '';
    notifyListeners();
  }

  // 当前搜索关键词
  String get searchQuery => _searchQuery;

  // 设置搜索关键词
  void search(String query) {
    _searchQuery = query;
    _selectedCategory = ''; // 清除分类筛选
    notifyListeners();
  }

  // 清除搜索
  void clearSearch() {
    _searchQuery = '';
    notifyListeners();
  }
}