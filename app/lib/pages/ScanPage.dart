import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scan/scan.dart';
import 'package:image_picker/image_picker.dart';

class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text('扫码'),
      ),
      body: ScanContent(),
    );
  }
}

class ScanContent extends StatefulWidget {
  _ScanContent createState() => _ScanContent();
}

class _ScanContent extends State<ScanContent> {
  String qrcode = 'Unknown';
  String _platformVersion = 'Unknown';
  ScanController controller = ScanController();
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await Scan.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Wrap(
          children: <Widget>[
            ElevatedButton(
              child: Text("开启闪光灯"),
              onPressed: () {
                controller.toggleTorchMode();
              },
            ),
            ElevatedButton(
              child: Text("重扫"),
              onPressed: () {
                controller.resume();
              },
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 400,
          child: ScanView(
            controller: controller,
            scanAreaScale: .7,
            scanLineColor: Colors.green.shade400,
            onCapture: (data) {
              print('--------------');
              print(data);
              print('--------------');
              setState(() {
                qrcode = data;
              });
            },
          ),
        ),
        Center(
          child: Text(
            '我是扫码结果$qrcode',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        )
      ],
    );
  }
}
