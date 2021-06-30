import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ScreenAdapter {
  static init(context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(360, 690),
    );
  }

  static width(double value) {
    return ScreenUtil().setWidth(value);
  }

  static height(double value) {
    return ScreenUtil().setHeight(value);
  }

  static screenHeight() {
    return ScreenUtil().screenHeight;
  }

  static screenWidth() {
    return ScreenUtil().screenWidth;
  }

  static fontSize(double fontSize) {
    return ScreenUtil().setSp(fontSize);
  }
}
