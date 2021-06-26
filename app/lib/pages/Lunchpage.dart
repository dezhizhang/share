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
  //打开外部应用
  openApplication() async {
    const url = "https://www.baidu.com";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '您的设置暂不支持';
    }
  }

  //打电话
  telPhone() async {
    const tel = 'tel:15992478448';
    if (await canLaunch(tel)) {
      await launch(tel);
    } else {
      throw '您的设置暂不支持';
    }
  }

  //发短信
  sendSms() async {
    const sms = "sms:15992478448";
    if (await canLaunch(sms)) {
      await launch(sms);
    } else {
      throw '您的设置暂不支持';
    }
  }

  //打开第三方
  thirdParty() async {
    const url = 'weixin://';
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
            ),
            ElevatedButton(
              child: Text('拨打电话'),
              onPressed: telPhone,
            ),
            ElevatedButton(
              child: Text('必送短信'),
              onPressed: sendSms,
            ),
            ElevatedButton(child: Text('打开第三方应用'), onPressed: thirdParty)
          ],
        ),
      ),
    );
  }
}
