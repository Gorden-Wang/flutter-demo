//import 'dart:convert';
//import 'package:meta/meta.dart';
class HBCCommonUtil {
  static List<int> getListInt(List<dynamic> list){
    List res = <int>[];
    if(list == null || !(list is List)){
      return res;
    }
    list.forEach((val){
      if(val is Object){
        res.add(int.parse(val.toString()));
      }
    });
    return res;

  }
}