import 'package:flutter/material.dart';
import 'package:myapp/src/util/HBCTheme.dart';

class HbcCityTab extends StatelessWidget {
  final Map cityService;
  final int hasAirporService;
  final int hasDailyservice;
  final int hasSingleService;
  final int goodsCount;

  HbcCityTab(this.cityService, this.goodsCount)
      :
        this.hasAirporService = cityService['hasSingleService'],
        this.hasDailyservice = cityService['hasDailyservice'],
        this.hasSingleService = cityService['hasSingleService'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List rows = _buildRow();
    if (rows.length > 0) {
      return new Container(
        color: Colors.white,
//        padding: new EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: rows,
            ),
            _buildLineCont(context)
          ],
        ),
      );
    }

    return null;
  }

  Widget _buildLineCont(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(left: 20.0,top: 15.0,bottom:15.0),
      color: new Color(0xfff5f5f5),
      child: new Row(
        children: <Widget>[
          new Icon(Icons.directions),
          new Expanded(
            child: new Container(
              margin: new EdgeInsets.only(left: 10.0),
              child: HBCTheme.buildText(
                  text: '${this.goodsCount}种包车路线或玩法',
                  fontSize: 13.0
              ),
            ),
          )

        ],
      ),
    );
  }

  List _buildRow() {
    List<Widget> res = [];

    if (hasDailyservice == 1) {
      Map item = {
        'color': new Color(0xff7accf0),
        'icon': new Icon(Icons.directions_car, color: Colors.white),
        'text': '按天包车游'
      };
      res.add(_buildRowItem(res.length, item));
    }
    if (hasAirporService == 1) {
      Map item = {
        'color': new Color(0xfff9be3b),
        'icon': new Icon(Icons.flight_takeoff, color: Colors.white),
        'text': '接送机'
      };
      res.add(_buildRowItem(res.length, item));
    }
    if (hasSingleService == 1) {
      Map item = {
        'color': new Color(0xffff6633),
        'icon': new Icon(Icons.directions, color: Colors.white),
        'text': '接送机'
      };
      res.add(_buildRowItem(res.length, item));
    }
    if (res.length > 0)
      return res;
    return [];
  }

  Widget _buildRowItem(int length, Map item) {
    var border = length == 2 ? null : new Border(
        right: new BorderSide(
            width: 1.0,
            color: Colors.grey.shade300,
            style: BorderStyle.solid
        )
    );
    return new Expanded(
      child: new Container(
        decoration: new BoxDecoration(
            border: border
        ),
        padding: new EdgeInsets.only(bottom: 15.0),
        child: new Column(
          children: <Widget>[
            new Container(
                width: 40.0,
                height: 40.0,
                margin: new EdgeInsets.only(bottom: 8.0,top: 15.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: item['color'],
                ),
                child: item['icon']
            ),
            HBCTheme.buildText(
              text: item['text'],
              fontSize: 13.0,
            )
          ],
        ),
      ),
    );
  }
}