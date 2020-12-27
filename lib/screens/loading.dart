import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:crypto_tracker/services/coin_price.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void fetchPrice() async {
    CoinPrice instance = CoinPrice(currency: 'USD');
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'currency': instance.currency,
      'flag': instance.flag,
      'time': instance.time,
      'price': instance.price,
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 63, 159, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCubeGrid(
              color: Color.fromRGBO(255, 193, 7, 1),
              size: 75.0,
            ),
            SizedBox(height: 10),
            Text(
              'Loading...',
              style: TextStyle(
                fontSize: 35,
                fontFamily: 'Jura',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
