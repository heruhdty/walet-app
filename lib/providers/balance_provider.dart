import 'package:flutter/material.dart';

class BalanceProvider with ChangeNotifier {
  double _balance = 3460348;

  double get balance => _balance;

  void updateBalance(double amount) {
    _balance += amount;
    notifyListeners();
  }
}
