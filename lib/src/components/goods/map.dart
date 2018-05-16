import 'package:flutter/material.dart';
class HbcGoodMap extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      alignment: Alignment.center,
      color: Colors.black45,
      child: new Text(
        '这个区域将是inline map',
        style: new TextStyle(
          fontSize: 18.0,
          color: Colors.white,
        ),
      ),
    );
  }
}