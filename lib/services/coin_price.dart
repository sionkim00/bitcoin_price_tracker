import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class CoinPrice {
  String currency;
  String time;
  String flag; //currency country
  String price;

  CoinPrice({this.currency, this.flag});

  Future<void> getData() async {
    try {
      Response response = await get(
          'https://api.coindesk.com/v1/bpi/currentprice/$currency.json');
      Map data = jsonDecode(response.body);
      DateTime updatedTime = DateTime.parse(data['time']['updatedISO']);
      updatedTime = updatedTime.add(Duration(hours: 9));
      time = DateFormat.yMd().add_jm().format(updatedTime);
      double temp = data['bpi'][currency]['rate_float'];
      price = temp.toStringAsFixed(2);
    } catch (e) {
      time = 'could not fetch data';
      print('error');
    }
  }
}
