import 'package:flutter/material.dart';
import 'package:material_stepper_view/features/material_stepper/controller/material_stepper_controller.dart';
import 'package:material_stepper_view/features/material_stepper/models/step_circle_style.dart';
import 'package:material_stepper_view/features/material_stepper/models/step_line_style.dart';
import '../models/stepper_step.dart';
import '../models/stepper_orientation.dart';
import '../widgets/step_circle.dart';
import '../widgets/step_line.dart';
import '../widgets/vertical_step_line.dart';

class MaterialStepperView extends StatelessWidget {
  final List<StepperStep> steps;
  final MaterialStepperController controller;
  final StepperOrientation orientation;

  final StepCircleStyle? stepCircleStyle;
  final StepLineStyle? stepLineStyle;

  const MaterialStepperView({
    super.key,
    required this.steps,
    required this.controller,
    this.orientation = StepperOrientation.horizontal,
    this.stepCircleStyle,
    this.stepLineStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return orientation == StepperOrientation.horizontal
            ? _buildHorizontal()
            : _buildVertical(context);
      },
    );
  }

  // ───────────────── HORIZONTAL ─────────────────
  Widget _buildHorizontal() {
    return Column(
      children: [
        Row(
          children: List.generate(steps.length * 2 - 1, (index) {
            if (index.isEven) {
              final stepIndex = index ~/ 2;
              return StepCircle(
                index: stepIndex,
                isActive: controller.currentStep >= stepIndex,
                indicatorType: steps[stepIndex].indicatorType,
                icon: steps[stepIndex].icon,
                image: steps[stepIndex].image,
                style: stepCircleStyle,
              );
            } else {
              return StepLine(
                isActive: controller.currentStep >= (index ~/ 2) + 1,
                style: stepLineStyle,
              );
            }
          }),
        ),
        const SizedBox(height: 12),
        Text(
          steps[controller.currentStep].title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  // ───────────────── VERTICAL ─────────────────
  Widget _buildVertical(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(steps.length, (index) {
        final isActive = controller.currentStep >= index;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                StepCircle(
                  index: index,
                  isActive: isActive,
                  indicatorType: steps[index].indicatorType,
                  icon: steps[index].icon,
                  image: steps[index].image,
                  style: stepCircleStyle,
                ),
                if (index != steps.length - 1)
                  VerticalStepLine(isActive: controller.currentStep > index,style: stepLineStyle,),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      steps[index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    if (steps[index].subtitle != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          steps[index].subtitle!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
