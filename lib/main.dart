// main.dart
import 'package:flutter/material.dart';
import 'views/currency_exchange_view.dart';

void main() {
  runApp(CurrencyExchangeApp());
}

class CurrencyExchangeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Exchange',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[600],
          foregroundColor: Colors.white,
          elevation: 2,
        ),
      ),
      home: CurrencyExchangeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}