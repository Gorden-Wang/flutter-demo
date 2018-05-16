import 'package:flutter/material.dart';
import 'package:myapp/src/util/HBCTheme.dart';
class HbcCityFilterContianer extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new FilterState();
  }

}

class FilterState extends State<HbcCityFilterContianer> {
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
          new _FilterItem(const {'title':'类型','isBorder':true}),
          new _FilterItem(const {'title':'天数','isBorder':true}),
          new _FilterItem(const {'title':'主题','isBorder':false}),
        ],
      ),
    );
  }
}



class _FilterItem extends StatefulWidget{
  final Map item;
  final String title;
  final bool isBorder;

  _FilterItem(this.item):
        this.title = item['title'],
        this.isBorder = item['isBorder'];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HbcCityFilterState();
  }
}

class HbcCityFilterState extends State<_FilterItem>{
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildItem(context, widget.title, widget.isBorder);
  }

  Widget _buildItem(BuildContext context, String string, bool isBorder) {
    var border = null;
    if (isBorder == true) {
      border = new Border(
          right: new BorderSide(
              width: 1.0,
              color: Colors.grey.shade300,
              style: BorderStyle.solid
          )
      );
    }

    Icon icon = isClick == false ? new Icon(Icons.arrow_drop_down) : new Icon(Icons.arrow_drop_up);

    return new Expanded(
      child: new GestureDetector(
        onTap: _tapHandler,
        child: new Container(
          margin: new EdgeInsets.only(top: 15.0, bottom: 15.0),
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
                child: icon,
              )
            ],
          ),
        ),
      ),
    );
  }

  _tapHandler(){
    setState(() {
      isClick = !isClick;
    });
  }
}
