/*
 * fluro
 * A Posse Production
 * http://goposse.com
 * Copyright (c) 2018 Posse Productions LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:myapp/src/screen/city/main.dart';
import 'package:myapp/src/screen/goods/main.dart';

var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new HbcCity();
    });
var goodsDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new HbcGoodDetail(params['goodsNo'][0]);
    });


var poiHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return WebviewScaffold(
        url: 'https://goods.huangbaoche.com/goods/poi/${params['poiId'][0]}',
        appBar: AppBar(
          title: Text('阿斯蒂芬'),
        ),
        withZoom: true,
        withLocalStorage: true,
        clearCache: false,
      );
    });