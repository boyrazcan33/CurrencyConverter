// controllers/currency_controller.dart
import 'package:flutter/material.dart';
import '../models/currency_model.dart';
import '../services/currency_service.dart';

class CurrencyController extends ChangeNotifier {
  final CurrencyService _service = CurrencyService();

  ExchangeRate? _currentRate;
  bool _isLoading = false;
  String? _error;

  CurrencyPair _currentPair = CurrencyPair(from: 'EUR', to: 'USD');
  double _amount = 0.0;

  ExchangeRate? get currentRate => _currentRate;
  bool get isLoading => _isLoading;
  String? get error => _error;
  CurrencyPair get currentPair => _currentPair;
  double get amount => _amount;
  List<String> get supportedCurrencies => _service.getSupportedCurrencies();

  double get convertedAmount {
    if (_currentRate != null && _amount > 0) {
      return _amount * _currentRate!.rate;
    }
    return 0.0;
  }

  Future<void> initialize() async {
    await fetchExchangeRate();
  }

  void updateAmount(String value) {
    _amount = double.tryParse(value) ?? 0.0;
    notifyListeners();
  }

  void swapCurrencies() {
    _currentPair = _currentPair.swap();
    fetchExchangeRate();
  }

  void updateCurrencyPair(String from, String to) {
    _currentPair = CurrencyPair(from: from, to: to);
    fetchExchangeRate();
  }

  Future<void> fetchExchangeRate() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _currentRate = await _service.getExchangeRate(
        _currentPair.from,
        _currentPair.to,
      );
    } catch (e) {
      _error = e.toString();
      _currentRate = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshRate() async {
    await fetchExchangeRate();
  }
}