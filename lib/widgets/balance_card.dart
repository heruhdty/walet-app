import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final int balance; // Tambahkan parameter balance
  final int changeAmount; // Tambahkan parameter changeAmount
  final double changePercentage; // Tambahkan parameter changePercentage

  const BalanceCard({
    required this.balance,
    required this.changeAmount,
    required this.changePercentage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Balance',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${balance.toString()}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                changeAmount >= 0 ? Icons.arrow_upward : Icons.arrow_downward,
                color: changeAmount >= 0 ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 4),
              Text(
                '\$${changeAmount.toString()} (${changePercentage.toString()}%)',
                style: TextStyle(
                  color: changeAmount >= 0 ? Colors.green : Colors.red,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
