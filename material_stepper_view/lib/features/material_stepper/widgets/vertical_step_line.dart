import 'package:flutter/material.dart';
import '../models/step_line_style.dart';

class VerticalStepLine extends StatelessWidget {
  final bool isActive;

  /// ✅ NEW
  final StepLineStyle? style;

  const VerticalStepLine({
    super.key,
    required this.isActive,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final s = style;

    return Container(
      width: s?.thickness ?? 2,
      height: s?.length ?? 40,
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isActive
            ? (s?.activeColor ?? Colors.blue)
            : (s?.inactiveColor ?? Colors.grey),
        borderRadius: s?.borderRadius,
        boxShadow: s?.shadow,
      ),
    );
  }
}
