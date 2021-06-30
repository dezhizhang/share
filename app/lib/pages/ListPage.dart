import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class ListPage extends StatelessWidget {
  Future<void> onRefresh() async {}
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
  List list = [];
  var page = 1;
  ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadData();
    //监听滚动条事件
    _scrollController.addListener(() {
      print(_scrollController.position.pixels); //获取滚动条下拉的距离

      print(_scrollController.position.maxScrollExtent); //获取整个页面的高度

      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 40) {
        this.loadData();
      }
    });
  }

  loadData() async {
    const url = 'http://www.xiaozhi.shop/api/list/search?page=1';
    Response response = await Dio().get(url);
    var data = json.decode(response.toString());
    if (data['code'] == 200) {
      var arr = [];
      for (var i = 0; i < 10000; i++) {
        arr.add(data['data'][1]);
      }
      setState(() {
        list = arr;
      });
    }
  }

  Future<void> onRefresh() async {
    this.loadData();
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
        child: RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Image.network(
                        "http://www.xiaozhi.shop${list[index]['url']}",
                        fit: BoxFit.cover),
                  );
                })));
  }
}
