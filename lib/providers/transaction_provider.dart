import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> _transactions = [
    Transaction(
        name: 'Matteo', date: 'Aug 25, 2022', amount: 100, currency: 'EUR'),
    Transaction(
        name: 'Bitcoin', date: 'Aug 25, 2022', amount: 300, currency: 'USD'),
    Transaction(
        name: 'Solana', date: 'Aug 25, 2022', amount: 900, currency: 'USD'),
  ];

  List<Transaction> get transactions => _transactions;

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}
