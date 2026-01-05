import 'package:flutter/material.dart';

class MaterialStepperController extends ChangeNotifier {
  int _currentStep = 0;

  int get currentStep => _currentStep;

  void next({required int maxStep}) {
    if (_currentStep < maxStep - 1) {
      _currentStep++;
      notifyListeners();
    }
  }

  void previous() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  void goTo(int index, {required int maxStep}) {
    if (index >= 0 && index < maxStep) {
      _currentStep = index;
      notifyListeners();
    }
  }
}

