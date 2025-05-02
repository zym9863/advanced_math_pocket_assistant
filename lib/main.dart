import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/formula_provider.dart';
import 'screens/formula_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => FormulaProvider(),
      child: MaterialApp(
        title: '高数随身助手',
        theme: AppTheme.lightTheme(),
        darkTheme: AppTheme.darkTheme(),
        themeMode: ThemeMode.system, // Follows system theme
        home: const FormulaScreen(),
      ),
    );
  }
}
