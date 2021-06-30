import './Home.dart';
import 'package:flutter/material.dart';

class RouterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('路由'),
      ),
      body: RouterContent(),
    );
  }
}

class RouterContent extends StatefulWidget {
  _RouterContent createState() => _RouterContent();
}

class _RouterContent extends State<RouterContent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: ElevatedButton(
          child: Text('跳转到首页'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
    );
  }
}
