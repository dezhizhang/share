import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('地理信息'),
      ),
      body: LocationContent(),
    );
  }
}

class LocationContent extends StatefulWidget {
  _LocationContent createState() => _LocationContent();
}

class _LocationContent extends State<LocationContent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}
