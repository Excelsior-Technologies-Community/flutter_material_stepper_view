import 'package:flutter/material.dart';
import '../models/step_indicator_type.dart';
import '../models/step_circle_style.dart';

class StepCircle extends StatelessWidget {
  final bool isActive;
  final int index;

  final StepIndicatorType indicatorType;
  final IconData? icon;
  final ImageProvider? image;

  /// ✅ NEW (OPTIONAL)
  final StepCircleStyle? style;

  const StepCircle({
    super.key,
    required this.isActive,
    required this.index,
    this.indicatorType = StepIndicatorType.number,
    this.icon,
    this.image,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final s = style;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      width: s?.size ?? 36,
      height: s?.size ?? 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? (s?.activeColor ?? Colors.blue)
            : (s?.inactiveColor ?? Colors.grey),
        border: Border.all(
          color: s?.borderColor ?? Colors.transparent,
          width: s?.borderWidth ?? 0,
        ),
        boxShadow: s?.shadow,
      ),
      alignment: Alignment.center,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: _buildIndicator(
          key: ValueKey('$indicatorType-$isActive-$index'),
          style: s,
        ),
      ),
    );
  }

  Widget _buildIndicator({
    required Key key,
    StepCircleStyle? style,
  }) {
    switch (indicatorType) {
      case StepIndicatorType.icon:
        return Icon(
          icon,
          key: key,
          size: 18,
          color: style?.iconColor ?? Colors.white,
        );

      case StepIndicatorType.image:
        return ClipOval(
          key: key,
          child: Image(
            image: image!,
            width: 18,
            height: 18,
            fit: BoxFit.cover,
          ),
        );

      case StepIndicatorType.number:
      default:
        return Text(
          '${index + 1}',
          key: key,
          style: style?.textStyle ??
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        );
    }
  }
}
