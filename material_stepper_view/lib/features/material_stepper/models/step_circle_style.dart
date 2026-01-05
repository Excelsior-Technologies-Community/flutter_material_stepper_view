import 'package:flutter/material.dart';

class StepCircleStyle {
  final double size;
  final Color activeColor;
  final Color inactiveColor;
  final Color borderColor;
  final double borderWidth;
  final List<BoxShadow>? shadow;
  final TextStyle? textStyle;
  final Color? iconColor;

  const StepCircleStyle({
    this.size = 36,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.shadow,
    this.textStyle,
    this.iconColor,
  });
}
