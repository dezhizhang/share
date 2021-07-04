import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
    print('------');
    print(list);
    print('------');
    ScreenAdapter.init(context);
    return Container(
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: list.length > 0
            ? StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return ListCard(
                    title: list[index]['title'],
                    url: list[index]['url'],
                    subtitle: list[index]['subtitle'],
                    status: list[index]['status'],
                  );
                },
                staggeredTileBuilder: (int index) {
                  return StaggeredTile.fit(1);
                })
            : Text('加载中....'),
      ),
    );
  }
}

class ListCard extends StatefulWidget {
  final String url;
  final String title;
  final String subtitle;
  final String status;
  ListCard(
      {Key? key,
      required this.url,
      required this.title,
      required this.subtitle,
      required this.status})
      : super(key: key);
  _ListCard createState() => _ListCard();
}

class _ListCard extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    // TODO: implement build
    return Card(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: ScreenAdapter.height(180),
              child: Image.network('http://www.xiaozhi.shop${widget.url}'),
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenAdapter.width(10)),
              alignment: Alignment.centerLeft,
              child: Text('${widget.title}'),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, left: 10),
              child: Text('${widget.subtitle}',
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Text('￥：100', style: TextStyle(color: Colors.red)),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: ScreenAdapter.width(10)),
                      alignment: Alignment.centerRight,
                      child: Text('激活'),
                    ))
              ],
            )
          ],
        ),
        height: ScreenAdapter.height(250),
      ),
    );
  }
}
