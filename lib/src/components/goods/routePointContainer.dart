import 'package:flutter/material.dart';

class HbcGoodsRoutePointContainer extends StatelessWidget {

  final List routePointMap;

  HbcGoodsRoutePointContainer(this.routePointMap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: _buildColumItem(context),
    );
  }

  List _buildColumItem(BuildContext context) {
    List<Widget> _list = [];
    this.routePointMap.forEach((item) {
      _list.add(
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Row(
              children: <Widget>[
                Image.network(
                  item['imgUrl'],
                  width: 40.0,
                  height: 40.0,
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left : 20.0),
                      child: Column(
                        crossAxisAlignment : CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              item['title'],
                              style: TextStyle(
                                color: Color(0xff4a4a4a),
                                fontSize : 13.0,
                              ),
                            ),
                          ),
                          Text(
                            item['subTitle'],
                            style: TextStyle(
                              color: Color(0xff4a4a4a),
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
