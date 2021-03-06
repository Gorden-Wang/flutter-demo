import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class HBCTheme {


  static Widget buildText({
    @required String text,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    double height,
    String fontFamily,
    TextAlign textAlign,
    TextDirection textDirection,
    bool softWrap,
    TextOverflow overflow,
    double textScaleFactor,
    int maxLines,
    TextDecoration decoration,
    Color decorationColor,
    TextDecorationStyle decorationStyle,
  }) {
    color ??= Colors.grey.shade800;
    fontWeight ??= FontWeight.normal;
    fontFamily ??= 'PingFang SC Regular';
    height ??= 1.0;
    decoration ??= TextDecoration.none;
    return new Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      style: new TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          height: height,
          decoration: decoration
      ),
    );
  }
}

