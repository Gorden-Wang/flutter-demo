import 'package:flutter/material.dart';
import 'top.dart'; // top Image wrap
import 'title.dart'; // title wrap
import 'guilde.dart';
import 'salePoints.dart';

class HbcGoodsIndex extends StatelessWidget {
  Map data;
  HbcGoodsIndex(data) {
    this.data = new Map.from(data);
  }
  @override
  Widget build(BuildContext context) {
    final Map data = this.data['data'];
    final goodsName = data['goodsName'];
    final theme = data['goodsThemes'];
    final associateGuideAmount = data['associateGuideAmount'];
    final String salePoints = data['salePoints'];
    return new ListView(
      children: <Widget>[
        new HbcGoodsTopImage(
            this.data['data']['goodsPictures'][0], 375.0, 375.0, '日本 - 东京'),
        _getSamePadding(context,new HbcGoodsTitle(goodsName, theme)),
        _getSamePadding(context, new HbcGoodsGuide(associateGuideAmount)),
        _getSamePadding(context, new HbcGoodsSalePoints(salePoints))
        // new HbcGoodsGuide(6),
      ],
    );
  }
  Widget _getSamePadding(BuildContext context,Widget someWidget){
    return new Container(
       padding: new EdgeInsets.only(
            left: 20.0,
            top: 10.0,
            right: 20.0,
            bottom: 10.0
          ),
          child: someWidget,
    );
  }
}
