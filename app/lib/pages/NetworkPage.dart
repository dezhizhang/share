import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class NetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('检测网络变化'),
      ),
      body: NetWorkContent(),
    );
  }
}

class NetWorkContent extends StatefulWidget {
  _NetWorkContent createState() => _NetWorkContent();
}

class _NetWorkContent extends State<NetWorkContent> {
  var subscription;
  String _stateText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNetWork();
  }

  getNetWork() async {
    var result = await (Connectivity().checkConnectivity());
    if (result == ConnectivityResult.mobile) {
      setState(() {
        _stateText = '手话在线';
      });
    } else if (result == ConnectivityResult.wifi) {
      setState(() {
        _stateText = 'wifi在线';
      });
    } else {
      setState(() {
        _stateText = '没有网络';
      });
    }
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Text('$_stateText'),
      ),
    );
  }
}
