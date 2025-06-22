// widgets/currency_selector_widget.dart
import 'package:flutter/material.dart';
import '../controllers/currency_controller.dart';

class CurrencySelectorWidget extends StatelessWidget {
  final CurrencyController controller;

  const CurrencySelectorWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Select Currency Pair',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                // From Currency
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'From',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: controller.currentPair.from,
                            isExpanded: true,
                            items: controller.supportedCurrencies
                                .map((currency) => DropdownMenuItem(
                              value: currency,
                              child: Text(
                                currency,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ))
                                .toList(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                controller.updateCurrencyPair(
                                  newValue,
                                  controller.currentPair.to,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Swap Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: GestureDetector(
                    onTap: controller.swapCurrencies,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.swap_horiz,
                        color: Colors.blue[700],
                        size: 24,
                      ),
                    ),
                  ),
                ),

                // To Currency
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'To',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: controller.currentPair.to,
                            isExpanded: true,
                            items: controller.supportedCurrencies
                                .map((currency) => DropdownMenuItem(
                              value: currency,
                              child: Text(
                                currency,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ))
                                .toList(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                controller.updateCurrencyPair(
                                  controller.currentPair.from,
                                  newValue,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Current Rate Display
            if (controller.currentRate != null) ...[
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green[200]!),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.trending_up, color: Colors.green[700], size: 16),
                    SizedBox(width: 8),
                    Text(
                      '1 ${controller.currentPair.from} = ${controller.currentRate!.rate.toStringAsFixed(4)} ${controller.currentPair.to}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.green[800],
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
  }
}