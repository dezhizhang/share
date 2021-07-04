import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
  List list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadData();
  }

  loadData() async {
    const url = 'http://www.xiaozhi.shop/api/list/search?page=1';
    Response response = await Dio().get(url);
    var data = json.decode(response.toString());
    if (data['code'] == 200) {
      var arr = [];
      for (var i = 0; i < 10000; i++) {
        arr.add(data['data'][1]);
      }
      setState(() {
        list = arr;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Banner(list: this.list);
  }
}

class Banner extends StatelessWidget {
  final List list;
  final double? height;
  final EdgeInsetsGeometry? padding;
  Banner({Key? key, required this.list, this.height = 160, this.padding})
      : super(key: key);
  _banner() {
    var right = 10 + (padding?.horizontal ?? 0) / 2;
    return Swiper(
      autoplay: true,
      itemCount: list.length,
      pagination: SwiperPagination(),
      control: SwiperControl(),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(child: _image(list[index]), onTap: () {});
      },
    );
  }

  _image(item) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          child: Image.network(item['url']),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height,
      child: _banner(),
    );
  }
}
