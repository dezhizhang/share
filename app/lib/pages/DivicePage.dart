import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

class DivicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('获取调备信息'),
      ),
      body: DiviceContent(),
    );
  }
}

class DiviceContent extends StatefulWidget {
  _DiviceContent createState() => _DiviceContent();
}

class _DiviceContent extends State<DiviceContent> {
  var model = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getDiviceInfo();
  }

  getDiviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    setState(() {
      model = iosInfo.name;
    });
    print(iosInfo.model);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement buil
    return Container(
      child: Center(
        child: Container(
          child: Text('$model'),
        ),
      ),
    );
  }
}
