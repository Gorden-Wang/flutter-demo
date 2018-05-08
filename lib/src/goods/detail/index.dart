import 'package:flutter/material.dart';
import 'top.dart'; // top Image wrap
import 'title.dart'; // title wrap
import 'guilde.dart';
import 'salePoints.dart';
import 'routePoint.dart';
import 'map.dart';
import 'trip.dart';
import 'order.dart';

class HbcGoodsIndex extends StatelessWidget {
  Map data;
  HbcGoodsIndex(data) {
    this.data = new Map.from(data);
  }
  @override
  Widget build(BuildContext context) {
    final Map data = this.data;
    final goodsName = data['goodsName'];
    final depCountryName = data['depCountryName'];
    final depCityName = data['depCityName'];
    final theme = data['goodsThemes'];
    final associateGuideAmount = data['associateGuideAmount'];
    final String salePoints = data['salePoints'];
    final List routePointData = _getRoutePointData();
    final List tripData = data['routes'];
    return new ListView(
      children: <Widget>[
        new HbcGoodsTopImage(
            this.data['goodsPictures'][0], 375.0, 375.0, '${depCountryName} - ${depCityName}'),
        _getSamePadding(context,new HbcGoodsTitle(goodsName, theme)),
        _getSamePadding(context, new HbcGoodsGuide(associateGuideAmount)),
        _getSamePadding(context, new HbcGoodsSalePoints(salePoints)),
        _getSamePadding(context, new HbcGoodsRoutePoint(routePointData)),
        _getSamePadding(context, new HbcGoodMap()),
        _getSamePadding(context, new HbcGoodTrip(tripData)),
        _getSamePadding(context, new HbcGoodOrderTips())
        // new HbcGoodsGuide(6),
      ],
    );
  }
  Widget _getSamePadding(BuildContext context,Widget someWidget){
    return new Container(
       padding: new EdgeInsets.only(
            left: 20.0,
            top: 10.0,
            right: 20.0,
            bottom: 10.0

          ),
          child: someWidget,
    );
  }
  List<Map> _getRoutePointData(){
    final Map data = this.data;
    final dayCount = data['daysCount'];
    final totalDistance = data['totalDistance'];
    final routeCityDesc = data['routeCityDesc'];
    final boardingTimeStart = data['boardingTimeStart'];
    final boardingTimeEnd = data['boardingTimeEnd'];
    final maxCapOfPerson = data['maxCapOfPerson'];
    final carTypeNum = data['carTypeNum'];
    final carTypeDesc = data['carTypeDesc'];

    String _getRout3SubTitle(){
      if(carTypeNum > 0){
        if(carTypeDesc != null || carTypeDesc != ''){
          List _darr =  carTypeDesc.split('、');
          int _length = _darr.length;
          String _d;
          if(_length > 4){
            _d = _darr.getRange(0,4).join('、');
          }else{
            _d = _darr.getRange(0,_length).join('、');
          }
          return '${_d}等${carTypeNum}种车型';
        }
        return '没有可服务车型';
      }
      return '';
    }

    Map route1 = {
      'imgUrl':'https://fr-static.huangbaoche.com/20180305/route-info1.66769120966ac3f8.png',
      'title' : '${dayCount}天,(约${totalDistance}公里)',
      'subTitle' : '${routeCityDesc}'
    };
    Map route2 = {
      'imgUrl' : 'https://fr-static.huangbaoche.com/20180305/route-info2.3a7c8c14c30f8a67.png',
      'title' : '上车时间可协调更改，建议${boardingTimeStart}${boardingTimeEnd != null ? '~${boardingTimeEnd}' : ''}',
      'subTitle' : '酒店门口／机场／指定地点接送'
    };
    Map route3 = {
      'imgUrl' : 'https://fr-static.huangbaoche.com/20180305/route-info3.ac42ea4631d85fd8.png',
      'title' : '中文服务，可接待(1${maxCapOfPerson != 0 ? '~${maxCapOfPerson}' : ''}人)',
      'subTitle' : _getRout3SubTitle(),
    };

    return [route1,route2,route3];
  }
}
