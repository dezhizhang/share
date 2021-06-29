import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe

class SwiperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('swiper'),
      ),
      body: SwiperContent(),
    );
  }
}

class SwiperContent extends StatefulWidget {
  _SwiperContent createState() => _SwiperContent();
}

class _SwiperContent extends State<SwiperContent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('hello');
  }
}
