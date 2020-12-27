import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(48, 63, 159, 1),
        title: Text(
          'Bitcoin price tracker',
          style: TextStyle(
            fontFamily: 'Jura',
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(255, 193, 7, 1),
        child: Icon(
          Icons.list,
        ),
        onPressed: () async {
          dynamic result = await Navigator.pushNamed(context, '/currency');
          setState(() {
            data = {
              'currency': result['currency'],
              'time': result['time'],
              'flag': result['flag'],
              'price': result['price'],
            };
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 100,
              child: RotateAnimatedTextKit(
                text: [
                  "1 Bitcoin: ",
                  "${data['price']} ${data['currency']}",
                ],
                textStyle: TextStyle(fontSize: 30.0, fontFamily: "Jura"),
                textAlign: TextAlign.start,
                repeatForever: true,
              ),
            ),
            // Text(
            //   '1 Bitcoin: ',
            //   style: TextStyle(fontFamily: 'Jura', fontSize: 40),
            // ),
            // SizedBox(height: 10),
            // Text(
            //   '${data['price']} ${data['currency']}',
            //   style: TextStyle(
            //     fontSize: 30,
            //     fontFamily: 'Jura',
            //   ),
            // ),
            Text('Updated time: ${data['time']}',
                style: TextStyle(
                  fontFamily: 'Jura',
                  color: Colors.grey[600],
                )),
          ],
        ),
      ),
    );
  }
}
