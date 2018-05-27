import 'package:flutter/material.dart';
import 'dart:async';
import 'package:myapp/src/util/HBCHttp.dart';
import 'package:myapp/src/util/HBCHttpResponse.dart';
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

  List get defaultListData => _getListViewData();


  HBCGoodList(this.data)
      :
        this.list = data['goodses'],
        this.cityGuide = data['cityGuides'],
        this.cityContent = data['cityContent'],
        this.goodsThemes = data['goodsThemes'],
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
  Widget build(BuildContext context) {
    // TODO: try to dispatch one action;
    CityStore.dispatch(CityActions(
        CityAction.updateFilterOff, data: _getFilterOffset(context)));
    CityStore.dispatch(
        CityActions(CityAction.updateCityList, data: this.defaultListData));
    return getReduxProvider(context);
  }

  Widget getReduxProvider(BuildContext context) {
    return new StoreConnector<CityState, CityState>(
        converter: (store) => store.state,
        builder: (context, state) =>
            getMainBuilder(context, state)
    );
  }

  Widget getListBuilder(BuildContext context, CityState state) {
    return ListView.builder(
      controller: _getController(context, state),
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
            return HbcCityFilterContainer(goodsThemes);
          default :
            return HbcCityListItemContainer(
                state.cityList[index], cityGuide);
        }
      },
    );
  }

  Widget getMainBuilder(BuildContext context, CityState state) {
    bool isFixBar = state.isFixBar;
    var topFilter = isFixBar == true ? Positioned(
      left: 0.0,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: HbcCityFilterContainer(goodsThemes),
    ) : Container();

    return SafeArea(
      top: true,
      bottom: false,
      child: Stack(
        children: <Widget>[
          Container(
            color: Color(0xfff5f5f5),
            child: getListBuilder(context, state),
          ),
          topFilter
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
        CityStore.dispatch(CityActions(CityAction.updateFixBar, data: true));
      }
      if (offset <= state.filterOffset && state.isFixBar == true) {
        CityStore.dispatch(CityActions(CityAction.updateFixBar, data: false));
      }
      scroll(offset, maxScrollExtent, state);
    });
    return controller;
  }

  void scroll(double position, double maxScrollExtent, CityState state) {
    double diff = maxScrollExtent - position;
    bool _isFetch = state.isFetch;
    int pageCount = (goodsCount / LIMIT).ceil();
    int offset = state.query_offset;
    if (diff <= BOTTOMPOSITION && diff >= 0 && _isFetch == false &&
        offset <= pageCount) {
      CityStore.dispatch(CityActions(CityAction.updateIsFetch, data: true));
      _fetchData(offset).then((value) {
        CityStore.dispatch(CityActions(
            CityAction.updateCityList, data: value.resData['goodses']));
        CityStore.dispatch(CityActions(CityAction.updateIsFetch, data: false));
        CityStore.dispatch(
            CityActions(CityAction.updateQueryOffset, data: ++offset));
      });
    }
    CityStore.dispatch(CityActions(CityAction.updateScroll, data: position));
  }

  Future<HBCHttpResponse> _fetchData(int offset) {
    return HBCHttp(
        url: 'https://api7.huangbaoche.com/goods/v1.4/p/home/cityGoods?cityId=217&cityHeadPicSize=750&themeId=0&daysCountMin=0&daysCountMax=0&goodsClass=0&channelId=1108019942&offset=$offset&limit=$LIMIT',
        ak: 'test').get();
  }

}

