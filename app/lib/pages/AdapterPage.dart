import 'package:flutter/material.dart';
import '../utils/utils.dart';

class AdapterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('适配'),
      ),
      body: AdapterContent(),
    );
  }
}

class AdapterContent extends StatefulWidget {
  _AdapterContent createState() => _AdapterContent();
}

class _AdapterContent extends State<AdapterContent> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // TODO: implement build
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenAdapter.width(100),
            height: ScreenAdapter.height(100),
            color: Colors.red,
          ),
          Container(
            width: ScreenAdapter.width(100),
            height: ScreenAdapter.height(100),
            color: Colors.yellow,
          ),
          Container(
            width: ScreenAdapter.width(100),
            height: ScreenAdapter.height(100),
            color: Colors.pink,
          ),
          Container(
            width: ScreenAdapter.width(60),
            height: ScreenAdapter.height(100),
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
