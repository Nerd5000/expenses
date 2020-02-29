import 'package:flutter/material.dart';

class Budget with ChangeNotifier {
  double _budget;
  Budget(budget) {
    setBudget(budget);
  }
  double get getBudget => _budget;

  void setBudget(double budget) {
    _budget = budget;
    notifyListeners();
  }

  void cutBudget(double cut) {
    _budget = _budget - cut;
    notifyListeners();
  }
}
