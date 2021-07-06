import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';

class Expandable extends StatefulWidget {
  Expandable({Key? key}) : super(key: key);
  _Expandable createState() => _Expandable();
}

class _Expandable extends State<Expandable>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  bool _expand = false;

  // ignore: unused_field
  AnimationController? _controller;

  Animation<double>? _heightFactor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _heightFactor = _controller!.drive(_easeInTween);
    _controller!.addListener(() {
      print(_heightFactor!.value);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  _buildTitle() {
    return InkWell(
      onTap: _toggleExpand,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Text(
              '国家新闻国家新闻国家新闻国家新闻国家新闻国家新闻国家新闻国家新闻',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.pink),
            ),
          ),
          Icon(_expand
              ? Icons.keyboard_arrow_up_sharp
              : Icons.keyboard_arrow_down_sharp)
        ],
      ),
    );
  }

  _toggleExpand() {
    setState(() {
      _expand = !_expand;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return Container();
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
      child: Column(
        children: <Widget>[
          _buildTitle(),
          Padding(padding: EdgeInsets.only(bottom: 8))
        ],
      ),
    );
  }
}
