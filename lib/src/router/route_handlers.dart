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
import 'dart:convert';
import 'package:myapp/src/util/HBCCommonUtil.dart';

var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new HbcCity();
    });
var goodsDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      final String goodsNo = params['goodsNo'][0];
      return new HbcGoodDetail(goodsNo);
    });

var poiHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      final String poiId = params['poiId'][0];
      List<int> decoder = HBCCommonUtil.getListInt(json.decode(params['poiName'][0]));
      final String poiName =  utf8.decode(decoder);
      return WebviewScaffold(
        url: 'https://goods.huangbaoche.com/goods/poi/$poiId',
        appBar: AppBar(
          title: Text(poiName),
        ),
        withZoom: true,
        withLocalStorage: true,
        clearCache: false,
      );
    });