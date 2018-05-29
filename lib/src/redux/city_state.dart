import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

enum CityAction {
  updateLoading,
  updateScroll,
  updateCityVo,
  updateIsFetch,
  updateQueryOffset,
  updateCityList,
  updateFixBar,
  updateFilterOff,
  updateDefaultList,
  updateSelTabItem,
  resetSelTabItem
}

@immutable
class CityActions {
  final CityAction action;
  final data;

  CityActions(this.action, {
    this.data
  });
}

const TAB_ITEMS = const [
  {'title': '类型', 'isBorder': true, 'index': 0, 'isOpen': false},
  {'title': '天数', 'isBorder': true, 'index': 1, 'isOpen': false},
  {'title': '主题', 'isBorder': false, 'index': 2, 'isOpen': false}
];
@immutable
class CityState {
  final bool isLoading;
  final double scroll;
  final Map cityVo;
  final bool isFetch;
  final int queryOffset;
  final List cityList;
  final bool isFixBar;
  final double filterOffset;
  final Map selTabItem;
  final List tabItems;
  final bool isExpendTab;

  CityState({
    this.isLoading = false,
    this.scroll = 0.0,
    this.cityVo,
    this.isFetch = false,
    this.queryOffset = 1,
    this.isFixBar = false,
    this.filterOffset = 0.0,
    this.cityList = const [
      {
        'BUILDTYPE': 'topContainer',
      },
      {
        'BUILDTYPE': 'tabContainer',
      },
      {
        'BUILDTYPE': 'filterContainer',
      },
    ],
    this.selTabItem,
    this.tabItems = TAB_ITEMS,
    this.isExpendTab = false
  });

  CityState copyWith({
    isLoading,
    scroll,
    cityVo,
    isFetch,
    queryOffset,
    cityList,
    isFixBar,
    filterOffset,
    selTabItem,
    tabItems,
    isExpendTab
  }) {
    return CityState(
        isLoading: isLoading ?? this.isLoading,
        scroll: scroll ?? this.scroll,
        cityVo: cityVo ?? this.cityVo,
        isFetch: isFetch ?? this.isFetch,
        queryOffset: queryOffset ?? this.queryOffset,
        cityList: cityList ?? this.cityList,
        isFixBar: isFixBar ?? this.isFixBar,
        filterOffset: filterOffset ?? this.filterOffset,
        selTabItem: selTabItem ?? this.selTabItem,
        tabItems: tabItems ?? this.tabItems,
        isExpendTab: isExpendTab ?? this.isExpendTab
    );
  }

  Map get map {
    return Map.of({
      'isLoading': this.isLoading,
      'scroll': this.scroll,
      'cityVo': this.cityVo,
      'isFetch': this.isFetch,
      'queryOffset': this.queryOffset,
      'cityList': this.cityList,
      'isFixBar': this.isFixBar,
      'filterOffset': this.filterOffset,
      'selTabItem': this.selTabItem,
      'isExpendTab': this.isExpendTab
    });
  }

  @override
  String toString() {
    // big list will remove 。。
    String str = 'CityState{';
    map.forEach((key, value) {
      if (key == 'isFetch')
        str += '$key:$value,';
    });
    str += '}';
    return str;
  }
}


CityState cityMainReducer(CityState state, action) {
  final data = action.data;
  switch (action.action) {
    case CityAction.updateLoading:
      state = state.copyWith(
          isLoading: !state.isLoading
      );
      break;
    case CityAction.updateCityVo :
      state = state.copyWith(
          cityVo: data
      );
      break;
    case CityAction.updateScroll :
      state = state.copyWith(
          scroll: data
      );
      break;
    case CityAction.updateIsFetch :
      state = state.copyWith(
          isFetch: data
      );
      break;
    case CityAction.updateQueryOffset :
      state = state.copyWith(
          queryOffset: data
      );
      break;
    case CityAction.updateCityList :
      state = state.copyWith(
          cityList: state.cityList + data
      );
      break;
    case CityAction.updateDefaultList :
      if (state.cityList.length == 3) {
        state = state.copyWith(
          cityList: state.cityList + data,
        );
        break;
      }
      break;
    case CityAction.updateFixBar:
      state = state.copyWith(
          isFixBar: data
      );
      break;
    case CityAction.updateFilterOff:
      state = state.copyWith(
          filterOffset: data
      );
      break;
    case CityAction.updateSelTabItem :
      List tabItems = List.of(state.tabItems);
      bool isExpendTab = false;
      if (data != null) {
        final int index = data['index'];
        for(int i = 0 ; i<tabItems.length;i++){
          Map tabItem = Map.of(tabItems[i]);
          if(i == index){
            tabItem['isOpen'] = !tabItem['isOpen'];
          }else{
            tabItem['isOpen'] = false;
          }
          tabItems[i] = tabItem;
        }
        isExpendTab = tabItems[index]['isOpen'];

      }
      state = state.copyWith(
          selTabItem: data,
          tabItems: tabItems,
          isExpendTab : isExpendTab
      );
      break;
    case CityAction.resetSelTabItem :
      state = state.copyWith(
          selTabItem: Map.of({}),
          tabItems: TAB_ITEMS,
          isExpendTab : false,
      );
      break;
  }
//  print(state);
  return state;
}


final cityReducers = combineReducers(
    [cityMainReducer]
);

final cityStore = new Store(cityReducers, initialState: CityState());