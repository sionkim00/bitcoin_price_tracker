import 'package:crypto_tracker/screens/home.dart';
import 'package:crypto_tracker/screens/loading.dart';
import 'package:crypto_tracker/screens/pick_currency.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => Loading(),
        '/home': (context) => Home(),
        '/currency': (context) => PickCurrency(),
      },
    ),
  );
}
