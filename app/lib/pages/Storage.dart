import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoragePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('缓存'),
      ),
      body: StorageContent(),
    );
  }
}

class StorageContent extends StatefulWidget {
  _StorageContent createState() => _StorageContent();
}

class _StorageContent extends State<StorageContent> {
  String text = '';
  setStorage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("name", "张三");
  }

  getStorage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var res = pref.getString('name');
    setState(() {
      text = res.toString();
    });
    print('---');
    print(res);
    print('---');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.setMockInitialValues;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: setStorage,
              child: Text('设置'),
            ),
            ElevatedButton(
              child: Text('获取'),
              onPressed: getStorage,
            ),
            Container(
              child: Text('$text'),
            )
          ],
        ),
      ),
    );
  }
}
