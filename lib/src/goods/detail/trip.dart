import 'package:flutter/material.dart';

const String DAY_BG = 'https://fr-static.huangbaoche.com/20180320/icon-day.6bd0b42e4c3243a9.png';
const String QUESTION_ICON = 'https://fr-static.huangbaoche.com/20180320/wen.8e3e27ff1f412a62.png';

class HbcGoodTrip extends StatelessWidget {
  final List trip;

  HbcGoodTrip(this.trip);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      alignment: Alignment.centerLeft,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: new Text(
              '行程参考',
              style: new TextStyle(
                  color: new Color(0xff151515),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'PingFang SC'
              ),
            ),
          ),
          new Text(
            '以下参考行程和建议的出发时间可根据您的需要灵活调整',
            style: new TextStyle(
                color: new Color(0xff929292),
                fontSize: 14.0,
                fontFamily: 'PingFang SC'
            ),
          ),
          new Text(
            '仅需调整出发时间，您可在下单时自助修改；需要调整行程，您可以免费咨询，人工协助您下单',
            style: new TextStyle(
                color: new Color(0xff929292),
                fontSize: 14.0,
                fontFamily: 'PingFang SC'
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: new Column(
                children: _getListItem(context, null)
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _getListItem(BuildContext context, Widget day) {
    List<Widget> arr = [];
    List<Widget> row = [];
    this.trip.forEach((item) {
      row.addAll([row2(item), titlePadding(item)]);
      row.addAll(getDayInner(context, item['poaList']));

      arr.add(
          new Container(
            margin: new EdgeInsets.only(top: 20.0),
            child: new Column(
                children: row
            ),
          )
      );
    });
    return arr;
  }

  List<Widget> getDayInner(BuildContext context, dayList) {
    List<Widget> data = [];
    dayList.forEach((dayItem) {
      data.add(
          new Container(
            margin: new EdgeInsets.only(left : 20.0),
            decoration: new BoxDecoration(
              border: new Border(
                bottom: new BorderSide(
                  color: new Color(0xffe8e8e8),
                  width: 1.0
                )
              )
            ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _getDayInnerRow(dayItem),
                _getDayInnerItemTitle(dayItem),
                _getDayInnerItemImg(context, dayItem),
                _getDayInnerItemSub(dayItem)
              ],
            ),
          )
      );
    });

    return data;
  }

  Container _getDayInnerItemImg(BuildContext context, dayItem) {
    List<Widget> data = [];
    if (dayItem['pois'] == null || dayItem['pois'].length == 0) {
      return new Container();
    };

    dayItem['pois'].forEach((item) {
      data.add(
          new Container(
            margin: new EdgeInsets.only(bottom: 10.0),
            child: new Stack(
              children: <Widget>[
                new Image.network(
                  item['poiPic'],
                  height: 190.0,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  fit: BoxFit.cover,
                ),
                new Positioned(
                  bottom: 15.0,
                  right: 20.0,
                  child: new Container(
                    child: new Text(
                        '${item['poiName']}',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),

              ],
            ),
          )
      );
    });

    return new Container(
      margin: new EdgeInsets.only(left : 0.0),
      child: new Column(
        children: data,
      ),
    );
  }

  Object _getDayInnerItemSub(dayItem) {
    if (dayItem['poaDesc'] == null || dayItem['poaDesc'] == '') {
      return new Container();
    }
    return new Container(
      margin: new EdgeInsets.only(top: 5.0, bottom: 10.0,left : 0.0),
      child: new Text(
        '${dayItem['poaDesc']}',
        style: new TextStyle(
            color: new Color(0xff929292),
            fontSize: 15.0,
            fontWeight: FontWeight.w400
        ),
      ),
    );
  }

  Container _getDayInnerItemTitle(dayItem) {
    return new Container(
      margin: new EdgeInsets.only(top: 5.0, bottom: 5.0,left: 0.0),
      child: new Text(
        '${dayItem['poaName']}',
        style: new TextStyle(
            color: new Color(0xff000111),
            fontSize: 15.0,
            fontWeight: FontWeight.w400
        ),
      ),
    );
  }

  Widget _getDayInnerRow(dayItem) {
    return new Padding(
      padding: const EdgeInsets.only(left : 0.0),
      child: new Row(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
                border: new Border.all(color: new Color(0xff0ac9a8),
                    width: 1.0,
                    style: BorderStyle.solid)
            ),
            width: 50.0,
            margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
            padding: new EdgeInsets.all(3.0),
            child: new Text(
              dayItem['startTime'],
              style: new TextStyle(
                  color: new Color(0xff0ac9a8)
              ),
            ),
          ),
          new Expanded(
            child: new Container(
              margin: new EdgeInsets.only(left: 10.0),
              child: new Text(
                '乘车约${dayItem['usingTime']}小时',
                style: new TextStyle(
                  fontSize: 13.0,
                  color: new Color(0xff929292),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding titlePadding(item) {
    return new Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: new Text(
        '参考景点：${item['routePoiDesc']}',
        textAlign: TextAlign.justify,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: new TextStyle(
          color: new Color(0xffe98100),
        ),
      ),
    );
  }

  Row row2(item) {
    return new Row(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: new Stack(
            children: <Widget>[
              new Image.network(
                DAY_BG,
                width: 40.0,
              ),
              new Positioned(
                  left: 15.0,
                  top: 2.0,
                  child: new Text(
                    item['dateNum'],
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        color: new Color(0xff151515),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300
                    ),
                  )
              )

            ],
          ),
        ),
        new Expanded(
          child: new Text(
            item['startCityName'],
            style: new TextStyle(
                color: new Color(0xff000111),
                fontSize: 16.0,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
        new Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: new Text(
            '${item['serviceHours']}小时·${item['serviceKms']}公里',
            style: new TextStyle(
                color: new Color(0xff7f7f7f),
                fontSize: 13.0
            ),
          ),
        ),
        new Image.network(
          QUESTION_ICON,
          width: 15.0,
        )
      ],
    );
  }

}