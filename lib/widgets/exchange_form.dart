import 'package:flutter/material.dart';

class ExchangeForm extends StatefulWidget {
  @override
  _ExchangeFormState createState() => _ExchangeFormState();
}

class _ExchangeFormState extends State<ExchangeForm> {
  String? fromCurrency = 'USDT';
  String? toCurrency = 'BTC';
  final TextEditingController amountController = TextEditingController();
  final TextEditingController toAmountController = TextEditingController();

  void _executeTransfer() {
    // Mendapatkan nilai dari form
    final amount = double.tryParse(amountController.text);
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Masukkan jumlah yang valid')),
      );
      return;
    }

    // Menampilkan konfirmasi transfer
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Transfer'),
          content: Text(
            'Anda akan mentransfer $amount $fromCurrency ke $toCurrency',
          ),
          actions: [
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Konfirmasi'),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Transfer berhasil!')),
                );
                // Logika transfer dana di sini, misalnya memanggil API
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ever ETH Swap',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Field untuk memilih jumlah dari currency asal
            TextFormField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'From',
                suffixIcon: DropdownButton<String>(
                  value: fromCurrency,
                  items: [
                    DropdownMenuItem(value: 'USDT', child: Text('USDT')),
                    DropdownMenuItem(value: 'BTC', child: Text('BTC')),
                    DropdownMenuItem(value: 'ETH', child: Text('ETH')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      fromCurrency = value;
                    });
                  },
                  underline: SizedBox(),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            // Field untuk memilih jumlah dari currency tujuan
            TextFormField(
              controller: toAmountController,
              decoration: InputDecoration(
                labelText: 'To',
                suffixIcon: DropdownButton<String>(
                  value: toCurrency,
                  items: [
                    DropdownMenuItem(value: 'BTC', child: Text('BTC')),
                    DropdownMenuItem(value: 'ETH', child: Text('ETH')),
                    DropdownMenuItem(value: 'USDT', child: Text('USDT')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      toCurrency = value;
                    });
                  },
                  underline: SizedBox(),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            // Informasi nilai tukar
            Text(
              '1 BTC = 25839.80 USD',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            // Tombol untuk mengeksekusi exchange/transfer
            ElevatedButton(
              onPressed: _executeTransfer,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.swap_horiz),
                  SizedBox(width: 8),
                  Text(
                    'Exchange',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
