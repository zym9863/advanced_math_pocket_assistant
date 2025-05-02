# Advanced Math Pocket Assistant

[中文](README.md) | [English](README_EN.md)

A Flutter application that helps students and professionals quickly look up and understand advanced mathematics formulas.

## Features

- 📚 Includes various categories of advanced mathematics formulas (limits, derivatives, integrals, series, vectors, differential equations)
- 🔍 Powerful search functionality, supporting search by title, description, and tags
- 🏷️ Category filtering system to easily find the formulas you need
- 📱 Responsive design, supporting light and dark themes
- 📝 Detailed formula explanations and application scenarios

## Application Structure

```
lib/
├── data/
│   └── formula_data.dart      # Formula data
├── models/
│   └── formula.dart           # Formula model class
├── providers/
│   └── formula_provider.dart  # State management
├── screens/
│   ├── formula_screen.dart    # Main formula list interface
│   └── formula_detail_screen.dart # Formula detail interface
├── theme/
│   └── app_theme.dart         # Application theme settings
├── utils/
│   └── page_transitions.dart  # Page transition animations
├── widgets/
│   └── formula_card.dart      # Formula card component
└── main.dart                  # Application entry point
```

## Installation and Usage

1. Ensure Flutter development environment is installed
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. Use `flutter run` to launch the application

## Development and Contribution

Welcome to submit issues and suggestions for improvement!

## Flutter Resources

- [Flutter Official Documentation](https://docs.flutter.dev/)
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
