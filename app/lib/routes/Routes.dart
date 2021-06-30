import 'package:app/pages/FormPage.dart';
import 'package:app/pages/ImagePage.dart';
import 'package:app/pages/NetworkPage.dart';
import 'package:app/pages/ScanPage.dart';
import 'package:app/pages/SwiperPage.dart';
import 'package:flutter/material.dart';
import '../pages/Home.dart';
import '../pages/RouterPage.dart';
import '../pages/HtmlPage.dart';
import '../pages/Lunchpage.dart';
import '../pages/ArgsPage.dart';
import '../pages/Storage.dart';
import '../pages/DivicePage.dart';
import '../pages/Movepage.dart';
import '../pages/TablePage.dart';
import '../pages/EchartsPage.dart';
import '../pages/ListPage.dart';
import '../pages/LifeCyclePage.dart';
import '../pages/ProviderPage.dart';

//配置路由
Map<String, dynamic> routes = {
  '/': (context) => HomePage(),
  '/htmlpage': (context) => HtmlPage(),
  '/lifeCycle': (context) => LifeCyclePage(),
  '/lunchpage': (context) => LunchPage(),
  '/routerpage': (context) => RouterPage(),
  '/imagepage': (context) => ImagePage(),
  '/divice': (context) => DivicePage(),
  '/argspage': (context, {arguments}) => ArgsPage(arguments: arguments),
  '/storage': (context) => StoragePage(),
  '/movepage': (context) => MovePage(),
  '/provider': (context) => ProviderPage(),
  '/connectivity': (context) => NetworkPage(),
  '/form': (context) => FromPage(),
  '/table': (context) => TablePage(),
  '/echarts': (context) => EchartsPage(),
  '/list': (context) => ListPage(),
  '/scan': (context) => ScanPage(),
  '/swiper': (context) => SwiperPage(),
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
