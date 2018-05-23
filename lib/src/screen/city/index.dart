import 'package:flutter/material.dart';
import 'dart:async';
import 'package:myapp/src/util/HBCHttp.dart';
import 'package:myapp/src/util/HBCHttpResponse.dart';
import 'package:myapp/src/components/city/topContianer.dart';
import 'package:myapp/src/components/city/listItemContainer.dart';
import 'package:myapp/src/components/city/tabContianer.dart';
import 'package:myapp/src/components/city/filterContianer.dart';

const double BOTTOMPOSITION = 300.0;
const int LIMIT = 10;

class HBCGoodList extends StatefulWidget {
  final Map data;
  final List list;
  final Map cityGuide, cityContent, cityService;
  final int goodsCount;

  List get listViewData => _getListViewData();

  HBCGoodList(this.data)
      :
        this.list = data['goodses'],
        this.cityGuide = data['cityGuides'],
        this.cityContent = data['cityContent'],
        this.cityService = data['cityService'],
        this.goodsCount = data['goodsCount'];





  List _getListViewData() {
    List list = [
      Map.from({
        'BUILDTYPE': 'topContainer',
      }),
      Map.from({
        'BUILDTYPE': 'tabContainer',
      }),
      Map.from({
        'BUILDTYPE': 'filterContainer',
      }),
    ];

    list.addAll(this.list);
    return list;
  }

  @override
  ListState createState() =>
      ListState(listViewData, (goodsCount / LIMIT).ceil());

}

class ListState extends State<HBCGoodList> {
  final int pageCount; // default fetch api count;
  double _scroll = 0.0; //  default scroll offset
  bool _isFetch; // chick is fetching api;
  List listViewData; // default listView data;
  int count; // default listView count;
  int offset = 1; // default api offset;

  ListState(this.listViewData, this.pageCount)
      : this.count = listViewData.length,
        this._isFetch = false;




  void scroll(double position, double maxScrollExtent) {
    double diff = maxScrollExtent - position;
    if (diff <= BOTTOMPOSITION && diff >= 0 && _isFetch == false &&
        offset <= pageCount) {
      _isFetch = true;
      _fetchData().then((value) {
        listViewData.addAll(value.resData['goodses']);
        count = listViewData.length;
        _isFetch = false;
        offset++;
      });
    }
    setState(() {
      _scroll = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    var topFilter = _scroll > _getFilterOffset(context) ? Positioned(
      left: 0.0,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: HbcCityFilterContainer(),
    ) : Container();

    return SafeArea(
      top: true,
      bottom: false,
      child: Stack(
        children: <Widget>[
          Container(
              color: Color(0xfff5f5f5),
              child: ListView.builder(
                controller: _getController(context),
                itemCount: count,
                itemBuilder: (BuildContext context, int index) {
                  switch (listViewData[index]['BUILDTYPE']) {
                    case 'topContainer' :
                      return HbcCityTopContainer(
                          widget.cityContent, widget.cityGuide,
                          widget.cityService);
                    case 'tabContainer' :
                      return HbcCityTabContainer(
                          widget.cityService, widget.goodsCount);
                    case 'filterContainer' :
                      return HbcCityFilterContainer();
                    default :
                      return HbcCityListItemContainer(
                          listViewData[index], widget.cityGuide);
                  }
                },
              )
          ),
          topFilter
        ],
      ),
    );
  }

  ScrollController _getController(BuildContext context) {
    var controller = ScrollController();
    controller.addListener(() {
      double offset = controller.offset;
      double maxScrollExtent = controller.position.maxScrollExtent;
      scroll(offset, maxScrollExtent);
    });
    return controller;
  }

  double _getFilterOffset(BuildContext context) {
    double topImageHeight = MediaQuery
        .of(context)
        .size
        .width / 1.875;
    double tabHeight = 100.0;
    double lineCountHeight = 60.0;
    return topImageHeight + tabHeight + lineCountHeight;
  }

  Future<HBCHttpResponse> _fetchData() {
    return HBCHttp(
        url: 'https://api7.huangbaoche.com/goods/v1.4/p/home/cityGoods?cityId=217&cityHeadPicSize=750&themeId=0&daysCountMin=0&daysCountMax=0&goodsClass=0&channelId=1108019942&offset=${offset}&limit=${LIMIT}',
        ak: 'test').get();
  }
}
