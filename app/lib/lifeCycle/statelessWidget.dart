/*
 * :file description: 
 * :name: /app/lib/lifeCycle/statelessWidget.dart
 * :author: 张德志
 * :copyright: (c) 2021, Tungee
 * :date created: 2021-06-25 23:15:32
 * :last editor: 张德志
 * :date last edited: 2021-06-25 23:26:42
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Text('StatelessWidget'),
      ),
    );
  }
}
