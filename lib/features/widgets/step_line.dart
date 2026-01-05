import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
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
              ? (s?.activeColor ?? AppColors.primary)
              : (s?.inactiveColor ?? AppColors.inactive),
          borderRadius: s?.borderRadius,
          boxShadow: s?.shadow,
        ),
      ),
    );
  }
}
