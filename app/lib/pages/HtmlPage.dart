import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('解析html'),
      ),
      body: HtmlContent(),
    );
  }
}

class HtmlContent extends StatefulWidget {
  _HtmlContent createState() => _HtmlContent();
}

class _HtmlContent extends State<HtmlContent> {
  List _list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadData();
  }

  loadData() async {
    var res = await Dio().get('https://cnodejs.org/api/v1/topics');
    setState(() {
      this._list = res.data['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: <Widget>[
          Html(
              data:
                  '''${this._list.length > 0 ? this._list[0]['content'] : ''}''')
        ],
      ),
    );
  }
}
