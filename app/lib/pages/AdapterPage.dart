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
      width: double.infinity,
      child: Column(
        children: <Widget>[
          ElevatedButton(
            child: Text('按钮'),
            onPressed: () {
              print('按钮');
            },
          ),
          SizedBox(
            height: ScreenAdapter.height(10),
          ),
          Container(
            width: double.infinity,
            height: ScreenAdapter.height(40),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
