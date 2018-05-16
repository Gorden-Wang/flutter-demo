import 'package:flutter/material.dart';
import 'package:myapp/src/util/HBCTheme.dart';

class HbcCityTabContianer extends StatelessWidget {
  final Map cityService;
  final int hasAirporService;
  final int hasDailyservice;
  final int hasSingleService;
  final int goodsCount;

  HbcCityTabContianer(this.cityService, this.goodsCount)
      :
        this.hasAirporService = cityService['hasSingleService'],
        this.hasDailyservice = cityService['hasDailyservice'],
        this.hasSingleService = cityService['hasSingleService'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List rows = _buildRow();
    if (rows.length > 0) {
      return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
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
    return Container(
      padding: EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0),
      color: Color(0xfff5f5f5),
      height: 60.0,
      child: Row(
        children: <Widget>[
          Icon(Icons.directions),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
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
        'color': Color(0xff7accf0),
        'icon': Icon(Icons.directions_car, color: Colors.white),
        'text': '按天包车游'
      };
      res.add(_buildRowItem(res.length, item));
    }
    if (hasAirporService == 1) {
      Map item = {
        'color': Color(0xfff9be3b),
        'icon': Icon(Icons.flight_takeoff, color: Colors.white),
        'text': '接送机'
      };
      res.add(_buildRowItem(res.length, item));
    }
    if (hasSingleService == 1) {
      Map item = {
        'color': Color(0xffff6633),
        'icon': Icon(Icons.directions, color: Colors.white),
        'text': '接送机'
      };
      res.add(_buildRowItem(res.length, item));
    }
    if (res.length > 0)
      return res;
    return [];
  }

  Widget _buildRowItem(int length, Map item) {
    var border = length == 2 ? null : Border(
        right: BorderSide(
            width: 1.0,
            color: Colors.grey.shade300,
            style: BorderStyle.solid
        )
    );
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: border
        ),
        height: 100.0,
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 15.0),
        child: Column(
          children: <Widget>[
            Container(
                width: 40.0,
                height: 40.0,
                margin: EdgeInsets.only(bottom: 8.0, top: 15.0),
                decoration: BoxDecoration(
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
