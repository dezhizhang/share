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
      child: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          ElevatedButton(
            child: Text('列表页'),
            onPressed: () {
              Navigator.pushNamed(context, '/list');
            },
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/canvas');
              },
              child: Text('canvas')),
          ElevatedButton(
            child: Text('生命周期'),
            onPressed: () {
              Navigator.pushNamed(context, '/lifeCycle');
            },
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/routerpage');
              },
              child: Text('路由')),
          ElevatedButton(
            child: Text('路由参数传递'),
            onPressed: () {
              Navigator.pushNamed(context, '/argspage',
                  arguments: {'id': 1, "name": "张三"});
            },
          ),
          ElevatedButton(
            child: Text('Provider状态管理'),
            onPressed: () {
              Navigator.pushNamed(context, '/provider');
            },
          ),
          ElevatedButton(
            child: Text('适配'),
            onPressed: () {
              Navigator.pushNamed(context, '/adapter');
            },
          ),
          ElevatedButton(
            child: Text('lottie'),
            onPressed: () {
              Navigator.pushNamed(context, '/lottie');
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
            child: Text('扫码'),
            onPressed: () {
              Navigator.pushNamed(context, '/scan');
            },
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
          ),
          ElevatedButton(
              child: Text('form表单'),
              onPressed: () {
                Navigator.pushNamed(context, '/form');
              }),
          ElevatedButton(
            child: Text('table'),
            onPressed: () {
              Navigator.pushNamed(context, '/table');
            },
          ),
          ElevatedButton(
            child: Text('echarts'),
            onPressed: () {
              Navigator.pushNamed(context, '/echarts');
            },
          ),
          ElevatedButton(
            child: Text('BottomNavigationBar'),
            onPressed: () {
              Navigator.pushNamed(context, '/bottomBar');
            },
          )
        ],
      ),
    );
  }
}
