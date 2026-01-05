import 'package:flutter/widgets.dart';
import 'step_indicator_type.dart';

class StepperStep {
  final String title;
  final String? subtitle;

  /// NEW
  final StepIndicatorType indicatorType;
  final IconData? icon;
  final ImageProvider? image;

  StepperStep({
    required this.title,
    this.subtitle,
    this.indicatorType = StepIndicatorType.number,
    this.icon,
    this.image,
  });
}
