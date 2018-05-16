import 'package:flutter/material.dart';

class HbcGoodsRoutePoint extends StatelessWidget {
  /**
   * routePointMap : [
   * {
   *   imgUrl : String,
   *   title : String
   *   subTitle : String
   *  }
   * ]
   */
  final List routePointMap;

  HbcGoodsRoutePoint(this.routePointMap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: _buildColumItem(context),
    );
  }

  List _buildColumItem(BuildContext context) {
    List<Widget> _list = [];
    this.routePointMap.forEach((item) {
      _list.add(
          new Container(
            margin: new EdgeInsets.only(bottom: 20.0),
            child: new Row(
              children: <Widget>[
                new Image.network(
                  item['imgUrl'],
                  width: 40.0,
                  height: 40.0,
                ),
                new Expanded(
                  child: new Container(
                      margin: new EdgeInsets.only(left : 20.0),
                      child: new Column(
                        crossAxisAlignment : CrossAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: new Text(
                              item['title'],
                              style: new TextStyle(
                                color: new Color(0xff4a4a4a),
                                fontSize : 13.0,
                              ),
                            ),
                          ),
                          new Text(
                            item['subTitle'],
                            style: new TextStyle(
                              color: new Color(0xff4a4a4a),
                              fontSize : 13.0,
                            ),
                          ),
                        ],
                      )
                  ),
                )
              ],
            ),
          )
      );
    });
    return _list;
  }
}