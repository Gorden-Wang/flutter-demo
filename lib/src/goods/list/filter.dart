import 'package:flutter/material.dart';
import 'package:myapp/src/util/HBCTheme.dart';
class HbcCityFilter extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
          bottom: new BorderSide(
            width: 1.0,
            color: Colors.grey.shade300,
          )
        )
      ),
      child: new Row(
        children: <Widget>[
          _buildItem(context,'类型',true),
          _buildItem(context,'天数',true),
          _buildItem(context,'主题',false),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context,String string,bool isBorder){
    var border = null;
    if(isBorder == true){
      border = new Border(
          right: new BorderSide(
              width: 1.0,
              color: Colors.grey.shade300,
              style: BorderStyle.solid
          )
      );
    }
    return new Expanded(
      child: new Container(
        margin: new EdgeInsets.only(top: 15.0,bottom: 15.0),
        alignment: Alignment.center,
        decoration: new BoxDecoration(
            border: border
        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HBCTheme.buildText(
              text: string,
              fontSize: 16.0,
            ),
            new Container(
              child: new Icon(Icons.arrow_drop_down),
            )
          ],
        ),
      ),
    );
  }


}