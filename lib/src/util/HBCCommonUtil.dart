//import 'dart:convert';
//import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class HBCCommonUtil {
  static List<int> getListInt(List<dynamic> list) {
    List res = <int>[];
    if (list == null || !(list is List)) {
      return res;
    }
    list.forEach((val) {
      res.add(int.parse(val.toString()));
    });
    return res;
  }

  static Widget wrapGesture(BuildContext context, Widget widget, {
    onTapUp,
    onTapDown,
    onTap
  }) {
    final GestureTapCallback defaultTap = () => null;
    final GestureTapUpCallback defaultTapUp = (TapUpDetails detail) => null;
    final GestureTapDownCallback defaultTapDown = (
        TapDownDetails detail) => null;
    return GestureDetector(
      child: widget,
      onTapUp: onTapUp ?? defaultTapUp,
      onTap: onTap ?? defaultTap,
      onTapDown: onTapDown ?? defaultTapDown,
    );
  }
}