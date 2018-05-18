import 'package:flutter/material.dart';
class HbcGoodMapContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      alignment: Alignment.center,
      color: Colors.black45,
      child: Text(
        '这个区域将是inline map',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
