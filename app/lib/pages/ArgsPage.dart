import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ArgsPage extends StatelessWidget {
  Map arguments = {};
  ArgsPage({Key? key, required this.arguments}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('参数传递')),
      body: ArgsContent(this.arguments),
    );
  }
}

class ArgsContent extends StatefulWidget {
  Map arguments;
  ArgsContent(this.arguments);

  _ArgsContent createState() => _ArgsContent(this.arguments);
}

class _ArgsContent extends State<ArgsContent> {
  Map arguments = {};
  _ArgsContent(this.arguments);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Text("ID:${arguments['id']}"),
            ),
            Container(
              child: Text('姓名为:${arguments['name']}'),
            )
          ],
        ),
      ),
    );
  }
}
