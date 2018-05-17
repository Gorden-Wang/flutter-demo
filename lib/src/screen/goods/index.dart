import 'package:flutter/material.dart';
import 'package:myapp/src/components/goods/topContainer.dart';
import 'package:myapp/src/components/goods/titleContainer.dart';
import 'package:myapp/src/components/goods/guideContainer.dart';
import 'package:myapp/src/components/goods/salePointsContainer.dart';
import 'package:myapp/src/components/goods/routePointContainer.dart';
import 'package:myapp/src/components/goods/mapContainer.dart';
import 'package:myapp/src/components/goods/tripContainer.dart';
import 'package:myapp/src/components/goods/orderContainer.dart';
import 'package:myapp/src/components/goods/tripListItemContainer.dart';


class HbcGoodsIndex extends StatelessWidget {
  final Map data;

  HbcGoodsIndex({
    Key key,
    this.data
  }) : super(key: key);

  set data(data) {
    this.data = new Map.from(data);
  }

  get routePointData => _getRoutePointData();


  dynamic getData(String key) {
    return data[key];
  }

  @override
  Widget build(BuildContext context) {
    final Map routes = _getRouteList();
    final int length = routes['length'];
    final List routesList = routes['list'];
    Map item ;
    return new ListView.builder(
      itemCount: 8+length,
      itemBuilder: (BuildContext context, index) {
        if(index >= 7 && index < length+7){
          item = routesList[index-7];

          if(item['isDay'] == true){
            return _getSamePadding(context,new HbcGoodTripDayItem(item));
          }else{
            return _getSamePadding(context,new HbcGoodTripListPoiItem(item));
          }

        }
        if(index == length+7){
          return _getSamePadding(context, new HbcGoodOrderTipsContainer());
        }
        switch (index ) {
          case 0 :
            return new HbcGoodsTopContainer(
                url: getData('goodsPictures')[0],
                imgTitle: '${getData('depCountryName')} - ${getData(
                    'depCityName')}',
            );
          case 1 :
            return _getSamePadding(context, new HbcGoodsTitleContainer(
                getData('goodsName'), getData('goodsThemes')));
          case 2 :
            return _getSamePadding(
                context, new HbcGoodsGuideContainer(getData('associateGuideAmount'),getData('goodsNo')));
          case 3 :
            return _getSamePadding(context, new HbcGoodsSalePointsContainer(getData('salePoints')));
          case 4 :
            return _getSamePadding(context, new HbcGoodsRoutePointContainer(routePointData));
          case 5 :
            return _getSamePadding(context, new HbcGoodMapContainer());
          case 6 :
            return _getSamePadding(context, new HbcGoodTripContainer(trip: getData('routes')));
        }
      }
    );
  }

  Widget _getSamePadding(BuildContext context, Widget someWidget) {
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

  List<Map> _getRoutePointData() {
    final dayCount = getData('daysCount');
    final totalDistance = getData('totalDistance');
    final routeCityDesc = getData('routeCityDesc');
    final boardingTimeStart = getData('boardingTimeStart');
    final boardingTimeEnd = getData('boardingTimeEnd');
    final maxCapOfPerson = getData('maxCapOfPerson');
    final carTypeNum = getData('carTypeNum');
    final carTypeDesc = getData('carTypeDesc');

    String _getRout3SubTitle() {
      if (carTypeNum > 0) {
        if (carTypeDesc != null || carTypeDesc != '') {
          List _darr = carTypeDesc.split('、');
          int _length = _darr.length;
          String _d;
          if (_length > 4) {
            _d = _darr.getRange(0, 4).join('、');
          } else {
            _d = _darr.getRange(0, _length).join('、');
          }
          return '${_d}等${carTypeNum}种车型';
        }
        return '没有可服务车型';
      }
      return '';
    }

    final Map route1 = {
      'imgUrl': 'https://fr-static.huangbaoche.com/20180305/route-info1.66769120966ac3f8.png',
      'title': '${dayCount}天,(约${totalDistance}公里)',
      'subTitle': '${routeCityDesc}'
    };
    final Map route2 = {
      'imgUrl': 'https://fr-static.huangbaoche.com/20180305/route-info2.3a7c8c14c30f8a67.png',
      'title': '上车时间可协调更改，建议${boardingTimeStart}${boardingTimeEnd != null
          ? '~${boardingTimeEnd}'
          : ''}',
      'subTitle': '酒店门口／机场／指定地点接送'
    };
    final Map route3 = {
      'imgUrl': 'https://fr-static.huangbaoche.com/20180305/route-info3.ac42ea4631d85fd8.png',
      'title': '中文服务，可接待(1${maxCapOfPerson != 0 ? '~${maxCapOfPerson}' : ''}人)',
      'subTitle': _getRout3SubTitle(),
    };

    return [route1, route2, route3];
  }

  Map _getRouteList(){
    List list = getData('routes');
    List res = [];
    Map day;
    List pois;
    Map poi;
    for(int i = 0 ; i< list.length ; i++){
      day = list[i];
      day['isDay'] = true;
      pois = day['poaList'];
      res.add(day);
      for(int j = 0; j< pois.length ; j++){
        poi = pois[j];
        poi['isPoi'] = true;
        res.add(poi);
      }
    }
    return new Map.from({
      'length' : res.length,
      'list' : res
    });
  }
}
