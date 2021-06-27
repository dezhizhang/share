import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('列表页'),
      ),
      body: ListContent(),
    );
  }
}

class ListContent extends StatefulWidget {
  _ListContent createState() => _ListContent();
}

class _ListContent extends State<ListContent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}
