// models/currency_model.dart
class ExchangeRate {
  final String fromCurrency;
  final String toCurrency;
  final double rate;
  final DateTime lastUpdated;

  ExchangeRate({
    required this.fromCurrency,
    required this.toCurrency,
    required this.rate,
    required this.lastUpdated,
  });

  factory ExchangeRate.fromJson(Map<String, dynamic> json, String from, String to) {
    return ExchangeRate(
      fromCurrency: from,
      toCurrency: to,
      rate: json['data'][to].toDouble(),
      lastUpdated: DateTime.now(),
    );
  }
}

class CurrencyPair {
  final String from;
  final String to;

  CurrencyPair({required this.from, required this.to});

  CurrencyPair swap() {
    return CurrencyPair(from: to, to: from);
  }

  @override
  String toString() => '$from to $to';
}