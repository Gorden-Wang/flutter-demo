import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:cached_network_image/cached_network_image.dart';

const String DAY_BG = 'https://fr-static.huangbaoche.com/20180320/icon-day.6bd0b42e4c3243a9.png';
const String QUESTION_ICON = 'https://fr-static.huangbaoche.com/20180320/wen.8e3e27ff1f412a62.png';

class HbcGoodTrip extends StatelessWidget {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
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
                children: _getListItem(context)
            ),
          )
        ],
      ),
    );
  }

  // 每天的 inner wrapper
  List<Widget> _getListItem(BuildContext context) {
    List<Widget> arr = [];

    this.trip.forEach((item) {
      List<Widget> row = [];
      row.addAll([_getDayTitle(context, item), _getTitlePadding(item)]);
      row.addAll(_getDayInner(context, item['poaList']));
      arr.add(
          new Container(
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: row
            ),
          )
      );
    });

    return arr;
  }

  // 每个时间段的inner wrap
  List<Widget> _getDayInner(BuildContext context, dayList) {
    List<Widget> data = [];
    dayList.forEach((dayItem) {
      data.add(
          new Container(
//            margin: new EdgeInsets.only(left : 20.0),
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

  // 每个时间段的 img list
  Container _getDayInnerItemImg(BuildContext context, dayItem) {
    List<Widget> data = [];
    if (dayItem['pois'] == null || dayItem['pois'].length == 0) {
      return new Container();
    };

    dayItem['pois'].forEach((item) {
      data.add(
        new GestureDetector(
            onTap: () {
              _launchURL(context,
                  'https://goods.huangbaoche.com/goods/poi/${item['poiId']}',
                  item['poiName']);
            },
            child: new Container(
              margin: new EdgeInsets.only(bottom: 10.0),
              child: new Stack(
                children: <Widget>[
                  new CachedNetworkImage(
                    imageUrl: item['poiPic'],
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 190.0,
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
        ),

//          new Container(
//            margin: new EdgeInsets.only(bottom: 10.0),
//            child: new Stack(
//              children: <Widget>[
//                new Image.network(
//                  item['poiPic'],
//                  height: 190.0,
//                  width: MediaQuery
//                      .of(context)
//                      .size
//                      .width,
//                  fit: BoxFit.cover,
//                ),
//                new Positioned(
//                  bottom: 15.0,
//                  right: 20.0,
//                  child: new Container(
//                    child: new Text(
//                      '${item['poiName']}',
//                      style: new TextStyle(
//                          color: Colors.white,
//                          fontSize: 14.0,
//                          fontWeight: FontWeight.w600
//                      ),
//                    ),
//                  ),
//                ),
//
//              ],
//            ),
//          )
      );
    });

    return new Container(
      margin: new EdgeInsets.only(left: 0.0),
      child: new Column(
        children: data,
      ),
    );
  }

  // 每个时间段的 subtitle
  Object _getDayInnerItemSub(dayItem) {
    if (dayItem['poaDesc'] == null || dayItem['poaDesc'] == '') {
      return new Container();
    }
    return new Container(
      margin: new EdgeInsets.only(top: 5.0, bottom: 10.0, left: 0.0),
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

  // 每个时间段的 title
  Container _getDayInnerItemTitle(dayItem) {
    return new Container(
      margin: new EdgeInsets.only(top: 5.0, bottom: 10.0, left: 0.0),
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

  // 每个时间段的 spliter
  Widget _getDayInnerRow(dayItem) {
    return new Padding(
      padding: const EdgeInsets.only(left: 0.0),
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

  // 每天玩法的subtitle
  Padding _getTitlePadding(item) {
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

  // 每天的玩法title
  Widget _getDayTitle(BuildContext context, item) {
    return new Container(
      margin: new EdgeInsets.only(top: 20.0),
      child: new Row(
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
          new GestureDetector(
            onTap: () {
              _neverSatisfied(context);
            },
            child: new Image.network(
              QUESTION_ICON,
              width: 15.0,
            ),
          )

        ],
      ),
    );
  }

  Future<Null> _neverSatisfied(BuildContext context) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
//          title: new Text('Rewind and remember'),
          content: new Container(
            child: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    new Text(
                        '1. 全天服务时长及行驶公里数，为此行程预估值供您参考。'
                    ),
                    new Text(
                        '2. 您可咨询司导或小管家调整行程。'
                    ),
                    new Text(
                        '3. 第一天上车时间可在下单时修改。'
                    )
                  ],
                )
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text(
                '知道啦',
                style: new TextStyle(
                  color: new Color(0xffffaf00),
                ),

              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<Null> _launchURL(BuildContext context, String url,
      String title) async {
//    const url = 'sms:18510249866';
//    flutterWebviewPlugin.launch(url);
    Navigator.push(context, new MaterialPageRoute<void>(
        builder: (BuildContext context)
    {
      return new WebviewScaffold(
        url: url,
        appBar: new AppBar(
          title: new Text(title),
        ),
        withZoom: true,
        withLocalStorage: true,
      );
    }
    )
    );
  }

}
