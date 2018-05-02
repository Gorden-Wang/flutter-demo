import 'package:flutter/material.dart';

class HbcGoodsGuide extends StatelessWidget {
  final int associateGuideAmount;

  HbcGoodsGuide(this.associateGuideAmount);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(
      children: <Widget>[_getGuideTips(context)],
    ));
  }

  Widget _getGuideTips(BuildContext context) {
    return new Container(
      alignment: new Alignment(-1.0, -1.0),
        child: new Text(
      '可由${this.associateGuideAmount}位当地人带你体验',
      style: new TextStyle(
        color: new Color(0xff151515),
        fontSize: 16.0,
        fontWeight: FontWeight.w400
      ),
    ));
  }
}
