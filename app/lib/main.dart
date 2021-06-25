/*
 * :file description: 
 * :name: /app/lib/main.dart
 * :author: 张德志
 * :copyright: (c) 2021, Tungee
 * :date created: 2021-06-25 23:15:32
 * :last editor: 张德志
 * :date last edited: 2021-06-25 23:33:55
 */
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(40),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Text('$count'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                child: Text('increment'),
                onPressed: () {
                  setState(() {
                    count = count + 1;
                  });
                }),
            SizedBox(height: 20),
            ElevatedButton(
                child: Text('decrement'),
                onPressed: () {
                  setState(() {
                    count = count - 1;
                  });
                })
          ],
        ),
      ),
    );
  }
}
