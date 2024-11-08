import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 2) {
      Navigator.pushNamed(context, '/exchange');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Hello, Tim',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundImage: AssetImage(
                'assets/profile_image.jpg'), // Ganti dengan URL gambar profil
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kartu Saldo
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Balance',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$3,460,348',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_upward,
                                color: Colors.green, size: 16),
                            Text(
                              '670 • 2%',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Tombol Aksi (Tambah Uang, Berdagang, Tarik)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton('Add Money', Icons.add, Color(0xFFD7C4F2)),
                _buildActionButton('Trade', Icons.sync_alt, Color(0xFFFCD4B2)),
                _buildActionButton(
                    'Withdraw', Icons.arrow_downward, Color(0xFFB3D4FB)),
              ],
            ),
            SizedBox(height: 20),

            // Daftar Transaksi
            Text(
              'Transaction',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildTransactionItem(
                      'Matteo', 'Aug 25, 2022', '€100', '-0.04%'),
                  _buildTransactionItem(
                      'Bitcoin', 'Aug 25, 2022', '\$300', '-0.04%'),
                  _buildTransactionItem(
                      'Solana', 'Aug 25, 2022', '\$900', '-0.04%'),
                ],
              ),
            ),
          ],
        ),
      ),
      // Navigasi Bawah
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync),
            label: 'Sync',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  // Widget helper untuk tombol aksi
  Widget _buildActionButton(String text, IconData icon, Color color) {
    return Container(
      width: 100,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(icon, color: Colors.black, size: 30),
            ),
          ),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // Widget helper untuk item transaksi
  Widget _buildTransactionItem(
      String name, String date, String amount, String change) {
    IconData transactionIcon;

    // Menentukan ikon berdasarkan nama transaksi
    switch (name) {
      case 'Matteo':
        transactionIcon = Icons.open_in_new; // Ikon khusus untuk Matteo
        break;
      case 'Bitcoin':
        transactionIcon = Icons.currency_bitcoin; // Ikon khusus untuk Bitcoin
        break;
      case 'Solana':
        transactionIcon = Icons.sports_baseball; // Ikon khusus untuk Solana
        break;
      default:
        transactionIcon = Icons.account_balance_wallet; // Ikon default
    }

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.black,
        child:
            Icon(transactionIcon, color: Colors.white), // Gunakan ikon khusus
      ),
      title: Text(name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: Text(date, style: TextStyle(color: Colors.grey)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(amount,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(change, style: TextStyle(color: Colors.redAccent)),
        ],
      ),
    );
  }
}
