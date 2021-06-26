import 'package:app/pages/ImagePage.dart';
import 'package:flutter/material.dart';
import '../pages/Home.dart';
import '../pages/HtmlPage.dart';
import '../pages/Lunchpage.dart';
import '../pages/ArgsPage.dart';
import '../pages/Storage.dart';

//配置路由
Map<String, dynamic> routes = {
  '/': (context) => HomePage(),
  '/htmlpage': (context) => HtmlPage(),
  '/lunchpage': (context) => LunchPage(),
  '/imagepage': (context) => ImagePage(),
  '/argspage': (context, {arguments}) => ArgsPage(arguments: arguments),
  '/storage': (context) => StoragePage(),
};

//固定写法
// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name];
  // ignore: unnecessary_null_comparison
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
