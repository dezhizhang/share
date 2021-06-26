import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  _HomeContent createState() => _HomeContent();
}

class _HomeContent extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          ElevatedButton(
            child: Text('参数传递'),
            onPressed: () {
              Navigator.pushNamed(context, '/argspage',
                  arguments: {'id': 1, "name": "张三"});
            },
          ),
          ElevatedButton(
            child: Text('解析html'),
            onPressed: () {
              Navigator.pushNamed(context, '/htmlpage');
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/lunchpage');
            },
            child: Text('打电话与发短信功能'),
          ),
          ElevatedButton(
            child: Text('拍照与上传相册'),
            onPressed: () {
              Navigator.pushNamed(context, '/imagepage');
            },
          )
        ],
      ),
    );
  }
}
