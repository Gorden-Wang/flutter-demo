import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'dart:convert';
import 'package:myapp/src/router/application.dart';
import 'package:myapp/src/components/lib/image.dart';


const String DAY_BG = 'https://fr-static.huangbaoche.com/20180320/icon-day.6bd0b42e4c3243a9.png';
const String QUESTION_ICON = 'https://fr-static.huangbaoche.com/20180320/wen.8e3e27ff1f412a62.png';


class HbcGoodTripDayItem extends StatelessWidget{
  final Map item;
  HbcGoodTripDayItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Stack(
              children: <Widget>[
                Image.network(
                  DAY_BG,
                  width: 40.0,
                ),
                Positioned(
                    left: 15.0,
                    top: 2.0,
                    child: Text(
                      item['dateNum'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff151515),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300
                      ),
                    )
                )

              ],
            ),
          ),
          Expanded(
            child: Text(
              item['startCityName'],
              style: TextStyle(
                  color: Color(0xff000111),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Text(
              '${item['serviceHours']}小时·${item['serviceKms']}公里',
              style: TextStyle(
                  color: Color(0xff7f7f7f),
                  fontSize: 13.0
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _neverSatisfied(context);
            },
            child: Image.network(
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
        return AlertDialog(
          content: Container(
            child: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                        '1. 全天服务时长及行驶公里数，为此行程预估值供您参考。'
                    ),
                    Text(
                        '2. 您可咨询司导或小管家调整行程。'
                    ),
                    Text(
                        '3. 第一天上车时间可在下单时修改。'
                    )
                  ],
                )
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                '知道啦',
                style: TextStyle(
                  color: Color(0xffffaf00),
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
}


class HbcGoodTripListPoiItem extends StatelessWidget{
  final Map item;

  HbcGoodTripListPoiItem(this.item);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
//            margin: EdgeInsets.only(left : 20.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color(0xffe8e8e8),
                  width: 1.0
              )
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getDayInnerRow(item),
          _getDayInnerItemTitle(item),
          _getDayInnerItemImg(context, item),
          _getDayInnerItemSub(item)
        ],
      ),
    );
  }

  // 每个时间段的 img list
  Container _getDayInnerItemImg(BuildContext context, dayItem) {
    List<Widget> data = [];
    if (dayItem['pois'] == null || dayItem['pois'].length == 0) {
      return Container();
    }

    dayItem['pois'].forEach((item) {
      data.add(
        GestureDetector(
            onTap: () {
              final String poiName = utf8.encode(item['poiName']).toString();
              final String route = '/poi?poiId=${item['poiId']}&poiName=$poiName';
              final transitionType = TransitionType.fadeIn;
              Application.router.navigateTo(context, route,transition: transitionType).then((res){

              });

            },
            child: Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: HbcCommonImage(
                  item['poiPic'],
                  isStack: true,
                  aspectRatio: 2.0,
                  children: <Widget>[
                    Positioned(
                      bottom: 15.0,
                      right: 20.0,
                      child: Container(
                        child: Text(
                          '${item['poiName']}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            )
        ),

      );
    });

    return Container(
      margin: EdgeInsets.only(left: 0.0),
      child: Column(
        children: data,
      ),
    );
  }

  // 每个时间段的 subtitle
  Object _getDayInnerItemSub(dayItem) {
    if (dayItem['poaDesc'] == null || dayItem['poaDesc'] == '') {
      return Container();
    }
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 10.0, left: 0.0),
      child: Text(
        '${dayItem['poaDesc']}',
        style: TextStyle(
            color: Color(0xff929292),
            fontSize: 15.0,
            fontWeight: FontWeight.w400
        ),
      ),
    );
  }

  // 每个时间段的 title
  Container _getDayInnerItemTitle(dayItem) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 10.0, left: 0.0),
      child: Text(
        '${dayItem['poaName']}',
        style: TextStyle(
            color: Color(0xff000111),
            fontSize: 15.0,
            fontWeight: FontWeight.w400
        ),
      ),
    );
  }

  // 每个时间段的 spliter
  Widget _getDayInnerRow(dayItem) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xff0ac9a8),
                    width: 1.0,
                    style: BorderStyle.solid)
            ),
            width: 50.0,
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            padding: EdgeInsets.all(3.0),
            child: Text(
              dayItem['startTime'],
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff0ac9a8)
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Text(
                '乘车约${dayItem['usingTime']}小时',
                style: TextStyle(
                  fontSize: 13.0,
                  color: Color(0xff929292),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
