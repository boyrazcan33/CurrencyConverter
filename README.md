Currency Exchange App
A clean and simple Flutter application for real-time currency exchange rates with an intuitive user interface.
Features

Real-time exchange rates from FreeCurrencyAPI
EUR ↔ USD conversion with instant swap functionality
20+ supported currencies including USD, EUR, GBP, JPY, AUD, CAD, CHF, CNY
Clean Material Design with gradient backgrounds and smooth animations
Quick amount selection buttons (100, 500, 1000, 5000)
Refresh functionality to get latest rates
Error handling with user-friendly messages

Getting Started
Prerequisites

Flutter SDK (>=2.17.0)
Dart SDK
Android Studio / VS Code

Installation

Clone the repository

bashgit clone https://github.com/yourusername/currency-exchange-app.git
cd currency-exchange-app

Install dependencies

bashflutter pub get

Run the app

bashflutter run
Project Structure
lib/
├── main.dart                           # App entry point
├── models/
│   └── currency_model.dart             # Data models
├── services/
│   └── currency_service.dart           # API service
├── controllers/
│   └── currency_controller.dart        # Business logic
├── views/
│   └── currency_exchange_view.dart     # Main screen
└── widgets/
├── currency_input_widget.dart      # Amount input
├── currency_result_widget.dart     # Results display
└── currency_selector_widget.dart   # Currency selection
API Configuration
The app uses FreeCurrencyAPI for real-time exchange rates.
To use your own API key:

Sign up at freecurrencyapi.com
Replace the API key in lib/services/currency_service.dart

dartstatic const String _apiKey = 'your_api_key_here';
Architecture
This app follows MVC (Model-View-Controller) pattern:

Models: Data structures (ExchangeRate, CurrencyPair)
Views: UI components and screens
Controllers: Business logic and state management
Services: External API communication

Dependencies
yamldependencies:
flutter:
sdk: flutter
http: ^1.1.0              # HTTP requests
cupertino_icons: ^1.0.2   # Icons
Supported Currencies
USD, EUR, GBP, JPY, AUD, CAD, CHF, CNY, SEK, NZD, MXN, SGD, HKD, NOK, TRY, RUB, INR, BRL, ZAR, KRWgit add . 