# Material Stepper View

A fully customizable Material Stepper library for Flutter with **horizontal & vertical layouts, icons/images, animations**, and **complete style control**.   
Built for real production apps like **checkout, onboarding, forms,** and **multi-step flows**.

---

## ✨ Features
✅ Horizontal & Vertical stepper   
✅ Icons, Images, or Numbers as step indicators   
✅ Smooth animated transitions   
✅ Fully customizable step circle style   
✅ Fully customizable step line style   
✅ Controller-based navigation (safe & predictable)   
✅ Lightweight & performance friendly

---

## 📸 Preview
![material_stepper_view](https://github.com/user-attachments/assets/c75d0d95-dde6-4612-a166-f0ad593617eb)


---

## 📦 Installation
### Add dependency in `pubspec.yaml`:
```dart
dependencies:
  material_stepper_view:
    path: '../flutter_material_stepper_view/material_stepper_view'
```

### Using GitHub (Recommended during development)
```dart
dependencies:
  material_stepper_view:
    git:
      url: https://github.com/YOUR_USERNAME/material_stepper_view.git
```

### 🚀 Import
```dart
import 'package:material_stepper_view/material_stepper_view.dart';
```

---

## 🧠 Basic Usage
### 1️⃣ Create Controller
```dart
final controller = MaterialStepperController();
```

### 2️⃣ Define Steps
```dart
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
    image: AssetImage('assets/payment.png'),
  ),
  StepperStep(title: 'Confirm'),
];
```

### 3️⃣ Use Stepper Widget  
**🔹 Horizontal Stepper**
```dart
MaterialStepperView(
  steps: steps,
  controller: controller,
  orientation: StepperOrientation.horizontal,
),
```

**🔹 Vertical Stepper**
```dart
MaterialStepperView(
  steps: steps,
  controller: controller,
  orientation: StepperOrientation.vertical,
),
```

---

## 🎨 Custom Styling (Optional)
### 🔵 Step Circle Style
```dart
final circleStyle = const StepCircleStyle(
  size: 44,
  activeColor: Colors.green,
  inactiveColor: Colors.grey,
  borderWidth: 2,
  borderColor: Colors.black,
);
```

### ➖ Step Line Style
```dart
final lineStyle = const StepLineStyle(
  thickness: 4,
  activeColor: Colors.green,
  inactiveColor: Colors.grey,
);
```

### Apply Styles
```dart
MaterialStepperView(
  steps: steps,
  controller: controller,
  stepCircleStyle: circleStyle,
  stepLineStyle: lineStyle,
);
```

⚠️ Styles are **optional**.   
If not provided → default Material look is used.

---

## ⏭️ Navigation (IMPORTANT)
```dart
Row(
  children: [
    ElevatedButton(
      onPressed: controller.previous,
      child: const Text('Back'),
    ),
    const Spacer(),
    ElevatedButton(
      onPressed: () =>
          controller.next(maxStep: steps.length),
      child: const Text('Next'),
    ),
  ],
),
```
---

## 🧩 Full Example
```dart
class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  final controller = MaterialStepperController();

  final steps = [
    StepperStep(title: 'Login'),
    StepperStep(title: 'Address'),
    StepperStep(title: 'Payment'),
    StepperStep(title: 'Confirm'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            MaterialStepperView(
              steps: steps,
              controller: controller,
              orientation: StepperOrientation.horizontal,
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
                  onPressed: () =>
                      controller.next(maxStep: steps.length),
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

## 🧱 Library Structure
```text
lib/
├── flutter_material_stepper_view.dart
└── features/
    └── material_stepper/
        ├── controller/
        ├── models/
        ├── view/
        └── widgets/
```

---

## 🧪 Use Cases
✔️ Checkout flow   
✔️ Onboarding screens   
✔️ Multi-step forms   
✔️ Registration process   
✔️ Order tracking   
✔️ Setup wizards

---

## 📄 License
```text
Copyright (c) 2026 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
