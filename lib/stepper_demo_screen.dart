import 'package:flutter/material.dart';
import 'package:flutter_material_stepper_view/features/models/step_circle_style.dart';
import 'package:flutter_material_stepper_view/features/models/step_indicator_type.dart';
import 'package:flutter_material_stepper_view/features/models/step_line_style.dart';
import 'package:flutter_material_stepper_view/features/models/stepper_orientation.dart';
import 'package:flutter_material_stepper_view/features/models/stepper_step.dart';
import 'package:flutter_material_stepper_view/features/view/material_stepper_view.dart';
import '../features/material_stepper/controller/material_stepper_controller.dart';

class StepperDemoScreen extends StatelessWidget {
  StepperDemoScreen({super.key});

  final controller = MaterialStepperController();
  final stepCircleStyle = const StepCircleStyle(
    size: 44,
    activeColor: Colors.green,
    inactiveColor: Colors.grey,
    borderColor: Colors.black,
    borderWidth: 2,
    iconColor: Colors.white,
    textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    shadow: [
      BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
    ],
  );

  final steps = [
    StepperStep(
      title: 'Login',
      indicatorType: StepIndicatorType.icon,
      icon: Icons.login,
    ),
    StepperStep(
      title: 'Address',
      indicatorType: StepIndicatorType.icon,
      icon: Icons.location_on,
    ),
    StepperStep(
      title: 'Payment',
      indicatorType: StepIndicatorType.image,
      image: AssetImage('assets/images/test.jpg'),
    ),
    StepperStep(title: 'Confirm'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Material Stepper',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            MaterialStepperView(
              steps: steps,
              controller: controller,
              orientation: StepperOrientation.horizontal,
            ),
            Spacer(),
            MaterialStepperView(
              stepLineStyle: StepLineStyle(activeColor: Colors.green),
              steps: steps,
              controller: controller,
              orientation: StepperOrientation.vertical,
              stepCircleStyle: stepCircleStyle,
            ),
            const Spacer(),
            Row(
              children: [
                ElevatedButton(
                  onPressed: controller.previous,
                  child: const Text('Back'),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: (){
                    controller.next(maxStep: steps.length);
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
