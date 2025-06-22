// views/currency_exchange_view.dart
import 'package:flutter/material.dart';
import '../controllers/currency_controller.dart';
import '../widgets/currency_input_widget.dart';
import '../widgets/currency_result_widget.dart';
import '../widgets/currency_selector_widget.dart';

class CurrencyExchangeView extends StatefulWidget {
  @override
  _CurrencyExchangeViewState createState() => _CurrencyExchangeViewState();
}

class _CurrencyExchangeViewState extends State<CurrencyExchangeView> {
  late CurrencyController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CurrencyController();
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.currency_exchange, size: 28),
            SizedBox(width: 8),
            Text('Currency Exchange', style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _controller.refreshRate,
            tooltip: 'Refresh Rate',
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue[50]!, Colors.white],
              ),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Currency Selector
                  CurrencySelectorWidget(
                    controller: _controller,
                  ),

                  SizedBox(height: 24),

                  // Input Section
                  CurrencyInputWidget(
                    controller: _controller,
                  ),

                  SizedBox(height: 24),

                  // Result Section
                  CurrencyResultWidget(
                    controller: _controller,
                  ),

                  SizedBox(height: 32),

                  // Refresh Button
                  ElevatedButton.icon(
                    onPressed: _controller.isLoading ? null : _controller.refreshRate,
                    icon: _controller.isLoading
                        ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                        : Icon(Icons.refresh),
                    label: Text(_controller.isLoading ? 'Updating...' : 'Refresh Rate'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blue[600],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  // Error Display
                  if (_controller.error != null) ...[
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.red[200]!),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.error_outline, color: Colors.red[600]),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _controller.error!,
                              style: TextStyle(color: Colors.red[800]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}