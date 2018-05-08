import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class HBCTheme  {


  static Widget buildText({
    @required String text,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    double height,
    String fontFamily
  }) {
    color ??= Colors.grey.shade800;
    fontWeight ??= FontWeight.normal;
    fontFamily ??= 'PingFang SC';
    height ??= 1.0;
    return new Text(
      text,
      style: new TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          height : height
      ),
    );
  }
}

