# app

### 无状态组件
```
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Text('StatelessWidget'),
      ),
    );
  }
}
```
### 有状态组件
```
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(40),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Text('$count'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                child: Text('increment'),
                onPressed: () {
                  setState(() {
                    count = count + 1;
                  });
                }),
            SizedBox(height: 20),
            ElevatedButton(
                child: Text('decrement'),
                onPressed: () {
                  setState(() {
                    count = count - 1;
                  });
                })
          ],
        ),
      ),
    );
  }
}
```
### 解析html
```
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
```






