import 'dart:convert';

// import 'package:app/utils/utils.dart';
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
    print('--------');
    print(data);
    print('--------');

    if (data['code'] == 200) {
      setState(() {
        list = data['data'];
      });
    }
  }

  Future<void> onRefresh() async {
    this.loadData();
  }

  @override
  Widget build(BuildContext context) {
    // ScreenAdapter.init(context);
    return Container(
        child: RefreshIndicator(
      onRefresh: onRefresh,
      child: Container(
        // width: (ScreenAdapter.screenWidth() - ScreenAdapter.width(60)) - 60,
        // padding: EdgeInsets.all(ScreenAdapter.height(10)),
        child: InkWell(
          onTap: () {
            print('我被点吉了');
          },
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Text('hello'),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
