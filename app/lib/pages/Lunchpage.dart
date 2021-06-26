import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LunchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('调起外部功能'),
      ),
      body: LunchContent(),
    );
  }
}

class LunchContent extends StatefulWidget {
  _LunchContent createState() => _LunchContent();
}

class _LunchContent extends State<LunchContent> {
  openApplication() async {
    const url = "https://www.baidu.com";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '您的设置暂不支持';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text('打开外部应用'),
              onPressed: openApplication,
            )
          ],
        ),
      ),
    );
  }
}
