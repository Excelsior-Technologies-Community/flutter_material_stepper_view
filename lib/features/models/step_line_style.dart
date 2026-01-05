import 'package:flutter/material.dart';

class StepLineStyle {
  final double thickness;
  final double length;
  final Color activeColor;
  final Color inactiveColor;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? shadow;

  const StepLineStyle({
    this.thickness = 2,
    this.length = 40,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.borderRadius,
    this.shadow,
  });
}
