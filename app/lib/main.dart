import 'package:app/pages/Counter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './routes/Routes.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Counter())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, //去掉debug图标
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder, // Add the builder here
        initialRoute: '/', //初始化的时候加载的路由
        onGenerateRoute: onGenerateRoute,
      ),
    );
    ;
  }
}
