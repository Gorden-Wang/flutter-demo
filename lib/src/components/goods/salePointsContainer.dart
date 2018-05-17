import 'package:flutter/material.dart';

class HbcGoodsSalePointsContainer extends StatelessWidget {
  final String salePoints;

  HbcGoodsSalePointsContainer(this.salePoints);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            alignment: Alignment.centerLeft,
            child: Text(
                '行程亮点',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff151515),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'PingFang SC'
                )
            ),
          ),
          Container(
            child: Text(
              this.salePoints,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff151515),
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
