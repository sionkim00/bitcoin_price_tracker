import 'package:crypto_tracker/services/coin_price.dart';
import 'package:flutter/material.dart';

class PickCurrency extends StatefulWidget {
  @override
  _PickCurrencyState createState() => _PickCurrencyState();
}

class _PickCurrencyState extends State<PickCurrency> {
  List<CoinPrice> currencies = [
    CoinPrice(currency: 'USD', flag: 'usa'),
    CoinPrice(currency: 'GBP', flag: 'uk'),
    CoinPrice(currency: 'KRW', flag: 'south_korea'),
  ];

  void updatePrice(index) async {
    CoinPrice instance = currencies[index];
    await instance.getData();

    Navigator.pop(context, {
      'currency': instance.currency,
      'time': instance.time,
      'flag': instance.flag,
      'price': instance.price,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(61, 91, 181, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(48, 63, 159, 1),
      ),
      body: ListView.builder(
        itemCount: currencies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Color.fromRGBO(197, 202, 233, 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      updatePrice(index);
                    },
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/images/${currencies[index].flag}.png'),
                    ),
                    title: Text(
                      currencies[index].currency,
                      style: TextStyle(
                        fontFamily: 'Jura',
                        fontSize: 20,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
