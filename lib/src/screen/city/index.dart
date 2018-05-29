import 'package:flutter/material.dart';
import 'dart:async';

import 'package:myapp/src/util/HBCHttp.dart';
import 'package:myapp/src/util/HBCHttpResponse.dart';
import 'package:myapp/src/util/HBCCommonUtil.dart';
import 'package:myapp/src/components/city/topContianer.dart';
import 'package:myapp/src/components/city/listItemContainer.dart';
import 'package:myapp/src/components/city/tabContianer.dart';
import 'package:myapp/src/components/city/filterContianer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myapp/src/redux/city_state.dart';

const double BOTTOMPOSITION = 300.0;
const int LIMIT = 10;

class HBCGoodList extends StatelessWidget {
  final Map data;
  final List list, goodsThemes;
  final Map cityGuide, cityContent, cityService;
  final int goodsCount;

//  ScrollController controller = ScrollController();

  HBCGoodList(this.data)
      :
        this.list = data['goodses'],
        this.cityGuide = data['cityGuides'],
        this.cityContent = data['cityContent'],
        this.goodsThemes = data['goodsThemes'],
        this.cityService = data['cityService'],
        this.goodsCount = data['goodsCount'];

  @override
  Widget build(BuildContext context) {
    // TODO: try to dispatch one action;

    cityStore.dispatch(CityActions(
        CityAction.updateFilterOff, data: _getFilterOffset(context)));
    cityStore.dispatch(
        CityActions(CityAction.updateDefaultList, data: this.list));
    return getReduxProvider(context);
  }

  Widget getReduxProvider(BuildContext context) {
    return new StoreConnector<CityState, CityState>(
        converter: (store) => store.state,
        builder: (context, state) =>
            getMainBuilder(context, state)
    );
  }

  Widget getListBuilder(BuildContext context, CityState state,
      ScrollController scroller) {
    return ListView.builder(
      controller: scroller,
      itemCount: state.cityList.length,
      itemBuilder: (BuildContext context, int index) {
        switch (state.cityList[index]['BUILDTYPE']) {
          case 'topContainer' :
            return HbcCityTopContainer(
                cityContent, cityGuide,
                cityService);
          case 'tabContainer' :
            return HbcCityTabContainer(
                cityService, goodsCount);
          case 'filterContainer' :
            return HbcCityFilterContainer(goodsThemes, scroller: scroller);
          default :
            return HbcCityListItemContainer(
                state.cityList[index], cityGuide);
        }
      },
    );
  }

  Widget getMainBuilder(BuildContext context, CityState state) {
    final ScrollController scroller = _getController(context, state);
    bool isFixBar = state.isFixBar;
    bool isExpendTab = state.isExpendTab;
    var topFilter = isFixBar == true ? Positioned(
      left: 0.0,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: HbcCityFilterContainer(goodsThemes, scroller: scroller),
    ) : Container();
    Widget overLay_inner = Container(
      color: new Color(0x50000000),
    );
    Widget wrapGuest = HBCCommonUtil.wrapGesture(context, overLay_inner,
        onTap: (){
          cityStore.dispatch(CityActions(CityAction.resetSelTabItem));
        });
    Widget overLay_posiiton = isExpendTab == true ? Positioned(
        left: 0.0,
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: wrapGuest
    ) : Container();



    return SafeArea(
      top: true,
      bottom: false,
      child: Stack(
        children: <Widget>[
          Container(
            color: Color(0xfff5f5f5),
            child: getListBuilder(context, state, scroller),
          ),
          overLay_posiiton,
          topFilter,

        ],
      ),
    );
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

  /// compute scroll position to fix tab bar and load more data;
  ScrollController _getController(BuildContext context, CityState state) {
    var controller = ScrollController();
    controller.addListener(() {
      double offset = controller.offset;
      double maxScrollExtent = controller.position.maxScrollExtent;
      if (offset > state.filterOffset && state.isFixBar == false) {
        cityStore.dispatch(CityActions(CityAction.updateFixBar, data: true));
      }
      if (offset <= state.filterOffset && state.isFixBar == true) {
        cityStore.dispatch(CityActions(CityAction.updateFixBar, data: false));
      }
      scroll(offset, maxScrollExtent, state);
    });
    return controller;
  }

  void scroll(double position, double maxScrollExtent, CityState state) {
    double diff = maxScrollExtent - position;
    bool _isFetch = state.isFetch;
    int pageCount = (goodsCount / LIMIT).ceil();
    int offset = state.queryOffset;
    if (diff <= BOTTOMPOSITION && diff >= 0 && _isFetch == false &&
        offset <= pageCount) {
      cityStore.dispatch(CityActions(CityAction.updateIsFetch, data: true));
      _fetchData(offset).then((value) {
        cityStore.dispatch(CityActions(
            CityAction.updateCityList, data: value.resData['goodses']));
        cityStore.dispatch(CityActions(CityAction.updateIsFetch, data: false));
        cityStore.dispatch(
            CityActions(CityAction.updateQueryOffset, data: offset + 1));
      });
    }
    cityStore.dispatch(CityActions(CityAction.updateScroll, data: position));
  }

  Future<HBCHttpResponse> _fetchData(int offset) {
    offset = offset * LIMIT;
    print('offset=$offset&limit=$LIMIT');
    return HBCHttp(
        url: 'https://api7.huangbaoche.com/goods/v1.4/p/home/cityGoods?cityId=217&cityHeadPicSize=750&themeId=0&daysCountMin=0&daysCountMax=0&goodsClass=0&channelId=1108019942&offset=$offset&limit=$LIMIT',
        ak: 'test').get();
  }

}

