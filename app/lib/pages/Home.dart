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
          ),
          ElevatedButton(
            child: Text('缓存数据的设置与获取'),
            onPressed: () {
              Navigator.pushNamed(context, '/storage');
            },
          ),
          ElevatedButton(
            child: Text('获取设备信息'),
            onPressed: () {
              Navigator.pushNamed(context, '/divice');
            },
          ),
          ElevatedButton(
            child: Text('获取网络信息'),
            onPressed: () {
              Navigator.pushNamed(context, '/connectivity');
            },
          ),
          ElevatedButton(
            child: Text('视频播放'),
            onPressed: () {
              Navigator.pushNamed(context, '/movepage');
            },
          )
        ],
      ),
    );
  }
}
