import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottie'),
      ),
      body: LottieContent(),
    );
  }
}

class LottieContent extends StatefulWidget {
  _LottieContent createState() => _LottieContent();
}

class _LottieContent extends State<LottieContent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      child: ListView(
        children: <Widget>[Lottie.asset('assets/lottie.json')],
      ),
    );
  }
}
