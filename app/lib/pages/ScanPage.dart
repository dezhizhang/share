import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

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
  ScanController controller = ScanController();
  String qrcode = 'Unknown';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ScanView(
        controller: controller,
        scanAreaScale: .7,
        scanLineColor: Colors.green.shade400,
        onCapture: (data) {
          print(data);
        },
      ),
    );
  }
}
