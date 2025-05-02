import 'package:flutter/material.dart';

/// 自定义页面过渡动画
class CustomPageTransition extends PageRouteBuilder {
  final Widget page;
  final Duration duration;
  final Curve curve;
  final Alignment alignment;
  final bool fadeIn;

  CustomPageTransition({
    required this.page,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.alignment = Alignment.center,
    this.fadeIn = true,
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) => page,
         transitionDuration: duration,
         reverseTransitionDuration: duration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           final curvedAnimation = CurvedAnimation(
             parent: animation,
             curve: curve,
           );

           return FadeTransition(
             opacity:
                 fadeIn ? curvedAnimation : const AlwaysStoppedAnimation(1.0),
             child: ScaleTransition(
               scale: Tween<double>(
                 begin: 0.94,
                 end: 1.0,
               ).animate(curvedAnimation),
               alignment: alignment,
               child: child,
             ),
           );
         },
       );
}

/// 滑动过渡动画
class SlidePageTransition extends PageRouteBuilder {
  final Widget page;
  final Duration duration;
  final Curve curve;
  final Offset beginOffset;
  final bool fadeIn;

  SlidePageTransition({
    required this.page,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.beginOffset = const Offset(1.0, 0.0), // 默认从右向左滑入
    this.fadeIn = true,
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) => page,
         transitionDuration: duration,
         reverseTransitionDuration: duration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           final curvedAnimation = CurvedAnimation(
             parent: animation,
             curve: curve,
           );

           return SlideTransition(
             position: Tween<Offset>(
               begin: beginOffset,
               end: Offset.zero,
             ).animate(curvedAnimation),
             child: FadeTransition(
               opacity:
                   fadeIn ? curvedAnimation : const AlwaysStoppedAnimation(1.0),
               child: child,
             ),
           );
         },
       );
}

/// 创建自定义页面过渡动画的扩展方法
extension NavigatorExtension on BuildContext {
  /// 使用自定义动画导航到新页面
  Future<T?> pushWithAnimation<T extends Object?>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    Alignment alignment = Alignment.center,
    bool fadeIn = true,
  }) {
    return Navigator.of(this).push<T>(
      CustomPageTransition(
            page: page,
            duration: duration,
            curve: curve,
            alignment: alignment,
            fadeIn: fadeIn,
          )
          as Route<T>,
    );
  }

  /// 使用滑动动画导航到新页面
  Future<T?> pushWithSlide<T extends Object?>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    Offset beginOffset = const Offset(1.0, 0.0),
    bool fadeIn = true,
  }) {
    return Navigator.of(this).push<T>(
      SlidePageTransition(
            page: page,
            duration: duration,
            curve: curve,
            beginOffset: beginOffset,
            fadeIn: fadeIn,
          )
          as Route<T>,
    );
  }
}
