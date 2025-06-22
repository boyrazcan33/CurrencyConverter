// services/currency_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/currency_model.dart';

class CurrencyService {
  static const String _baseUrl = 'https://api.freecurrencyapi.com/v1/latest';
  static const String _apiKey = 'fca_live_DRoRyyK9sYLihROu2DbI7Rl18luHhguOynZXbtrK';

  Future<ExchangeRate> getExchangeRate(String fromCurrency, String toCurrency) async {
    final url = '$_baseUrl?apikey=$_apiKey&base_currency=$fromCurrency&currencies=$toCurrency';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final rate = data['data'][toCurrency].toDouble();

      return ExchangeRate(
        fromCurrency: fromCurrency,
        toCurrency: toCurrency,
        rate: rate,
        lastUpdated: DateTime.now(),
      );
    } else {
      throw Exception('Failed to load exchange rate');
    }
  }

  List<String> getSupportedCurrencies() {
    return [
      'USD', 'EUR', 'GBP', 'JPY', 'AUD', 'CAD', 'CHF', 'CNY',
      'SEK', 'NZD', 'MXN', 'SGD', 'HKD', 'NOK', 'TRY', 'RUB',
      'INR', 'BRL', 'ZAR', 'KRW'
    ];
  }
}