import 'package:flutter/material.dart';

class HbcGoodsTitle extends StatelessWidget {
  final String title;
  final List theme;

  HbcGoodsTitle(this.title, this.theme);
  /**
   * title Wrap UI
   */
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        _buildTitleContainer(context),
        _buildKeyWordContianer(context),
        _buildGuideTips(context)
      ],
    );
  }

  /**
   * title UI
   */
  Widget _buildTitleContainer(BuildContext context) {
    return new Container(
      child: new Text(this.title,
        style: new TextStyle(
          color: new Color(0xFF151515),
          // color: Colors.black54,
          fontSize: 22.0,
          fontWeight: FontWeight.w400,
          height: 1.0,
          fontFamily: 'FZDYSJW',
        ))
    );
  }
  /**
   * theme inner UI - text & split
   */
  Widget _generateTheme(Map item, [String split]) {
    if (item != null) {
      return new Container(
        child: new Text(
          item['themeName'],
          style: new TextStyle(fontSize: 14.0, color: new Color(0xff929292)),
        ),
      );
    } else {
      return new Container(
        margin: new EdgeInsets.only(
          left: 5.0,
          right: 5.0,
        ),
        child: new Text(
          split,
          style: new TextStyle(fontSize: 14.0, color: new Color(0xff929292)),
        ),
      );
    }
  }
  /**
   *  Theme UI
   */
  Widget _buildKeyWordContianer(BuildContext context) {
    List keyWords = <Widget>[];
    for (int i = 0; i < this.theme.length; i++) {
      if (i == this.theme.length - 1) {
        //最后一个
        keyWords.add(_generateTheme(this.theme[i]));
      } else {
        keyWords.add(_generateTheme(this.theme[i]));
        keyWords.add(_generateTheme(null, '|'));
      }
    }
    return new Container(
      alignment: new Alignment(-1.0, -1.0),
      margin: new EdgeInsets.only(top: 10.0, bottom: 3.0),
      child: new Row(
        children: keyWords,
      ),
    );
  }

  Widget _buildGuideTips(BuildContext context){
    return new Container(
      alignment: new Alignment(-1.0, -1.0),
      child: new Text(
        '预定成功后，可挑选心意司导服务哦!',
        style : new TextStyle(
          fontSize: 14.0,
          color: new Color(0xFFffaf00)
        )
      ),
    );
  }
}
