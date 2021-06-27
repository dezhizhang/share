import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  Future<void> onRefresh() async {}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('上拉刷新下拉加载更多'),
      ),
      body: ListContent(),
    );
  }
}

class ListContent extends StatefulWidget {
  _ListContent createState() => _ListContent();
}

class _ListContent extends State<ListContent> {
  List<Map> list = [];
  var page = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadData();
  }

  loadData() async {
    const url = 'http://127.0.0.1:7001/api/list/search?page=1';
    Response response = await Dio().get(url);
    print(response);
  }

  Future<void> handleRefresh() async {
    this.loadData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: RefreshIndicator(
        onRefresh: handleRefresh,
        child: ListView(
          children: <Widget>[Text('hello')],
        ),
      ),
    );
  }
}
