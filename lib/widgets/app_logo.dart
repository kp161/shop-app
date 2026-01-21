import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget{
  final double width;
  final double height;
  final Color? color;
  final BoxFit fit;

  static const String logoPath = 'assets/images/logo.png';
  static const double _defaultSize = 80.0;

  const AppLogo({
    super.key,
    this.width = _defaultSize,
    this.height = _defaultSize,
    this.color,
    this.fit = BoxFit.contain,
  });

  factory AppLogo.tinny() {
    return const AppLogo(width: 30, height: 30);
  }

  factory AppLogo.large() {
    return const AppLogo(width: 180, height: 180);
  }

  factory AppLogo.medium() {
    return const AppLogo(width: 80, height: 80);
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      logoPath,
      width: width,
      height: height,
      fit: fit,
    );
  }
}