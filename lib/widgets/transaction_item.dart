import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String name;
  final String date;
  final double amount;
  final String currency;
  final double percentageChange;

  const TransactionItem({
    required this.name,
    required this.date,
    required this.amount,
    required this.currency,
    required this.percentageChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Ikon dalam lingkaran hitam
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getIconForName(
                  name), // Fungsi untuk mendapatkan ikon berdasarkan nama
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          // Nama transaksi dan tanggal
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Jumlah dan persentase perubahan
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$currency${amount.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '${percentageChange.toStringAsFixed(2)}%',
                style: TextStyle(
                  color: percentageChange < 0 ? Colors.red : Colors.green,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Fungsi untuk mendapatkan ikon berdasarkan nama transaksi
  IconData _getIconForName(String name) {
    switch (name) {
      case 'Bitcoin':
        return Icons.currency_bitcoin;
      case 'Solana':
        return Icons.device_hub;
      default:
        return Icons.open_in_new;
    }
  }
}
