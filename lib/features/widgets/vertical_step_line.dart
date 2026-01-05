import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
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
            ? (s?.activeColor ?? AppColors.primary)
            : (s?.inactiveColor ?? AppColors.inactive),
        borderRadius: s?.borderRadius,
        boxShadow: s?.shadow,
      ),
    );
  }
}
