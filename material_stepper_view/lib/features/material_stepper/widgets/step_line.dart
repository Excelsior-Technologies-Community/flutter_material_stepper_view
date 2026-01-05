import 'package:flutter/material.dart';
import '../models/step_line_style.dart';

class StepLine extends StatelessWidget {
  final bool isActive;

  final StepLineStyle? style;

  const StepLine({
    super.key,
    required this.isActive,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final s = style;

    return Expanded(
      child: Container(
        height: s?.thickness ?? 2,
        decoration: BoxDecoration(
          color: isActive
              ? (s?.activeColor ?? Colors.blue)
              : (s?.inactiveColor ?? Colors.grey),
          borderRadius: s?.borderRadius,
          boxShadow: s?.shadow,
        ),
      ),
    );
  }
}
