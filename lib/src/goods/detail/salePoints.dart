import 'package:flutter/material.dart';

class HbcGoodsSalePoints extends StatelessWidget {
  final String salePoints;

  HbcGoodsSalePoints(this.salePoints);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.only(bottom: 20.0),
            alignment: Alignment.centerLeft,
            child: new Text(
                '行程亮点',
                textAlign: TextAlign.left,
                style: new TextStyle(
                    color: new Color(0xff151515),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'PingFang SC'
                )
            ),
          ),
          new Container(
            child: new Text(
              this.salePoints,
              textAlign: TextAlign.left,
              style: new TextStyle(
                  color: new Color(0xff151515),
                  fontSize: 14.0,
                  height: 1.2,
                  fontFamily: 'PingFang SC'
              ),
            ),
          ),
        ],
      ),
    );
  }

}