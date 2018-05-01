import 'package:flutter/material.dart';
import 'top.dart'; // top Image wrap
import 'title.dart'; // title wrap

class HbcGoodsIndex extends StatelessWidget {
  Map data;
  HbcGoodsIndex(data) {
    this.data = new Map.from(data);
  }
  @override
  Widget build(BuildContext context) {
    final goodsName = this.data['data']['goodsName'];
    final theme = this.data['data']['goodsThemes'];
    return new ListView(
      children: <Widget>[
        new HbcGoodsTopImage(
            this.data['data']['goodsPictures'][0], 375.0, 375.0, '日本 - 东京'),
        new Container(
          padding: new EdgeInsets.only(
            left: 20.0,
            top: 10.0,
            right: 20.0,
            bottom: 10.0
          ),
          child: new HbcGoodsTitle(goodsName, theme),
        ),

        
      ],
    );
  }
}
