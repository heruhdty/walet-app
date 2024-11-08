import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/exchange_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Wallet',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Menetapkan SplashScreen sebagai layar awal
      routes: {
        '/': (context) => SplashScreen(), // Hapus "splash."
        '/home': (context) => HomeScreen(), // Hapus "home."
        '/exchange': (context) => ExchangeScreen(),
      },
    );
  }
}
