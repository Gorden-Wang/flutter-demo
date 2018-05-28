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
}

@immutable
class CityActions {
  final CityAction action;
  final data;

  CityActions(this.action, {
    this.data
  });
}

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

  CityState({
    this.isLoading = false,
    this.scroll = 0.0,
    this.cityVo,
    this.isFetch = false,
    this.queryOffset = 1,
    this.isFixBar = false,
    this.filterOffset = 0.0,
    this.cityList = const []
  });

  CityState copyWith({
    isLoading,
    scroll,
    cityVo,
    isFetch,
    queryOffset,
    cityList,
    isFixBar,
    filterOffset
  }) {
    return CityState(
        isLoading: isLoading ?? this.isLoading,
        scroll: scroll ?? this.scroll,
        cityVo: cityVo ?? this.cityVo,
        isFetch: isFetch ?? this.isFetch,
        queryOffset: queryOffset ?? this.queryOffset,
        cityList: cityList ?? this.cityList,
        isFixBar: isFixBar ?? this.isFixBar,
        filterOffset: filterOffset ?? this.filterOffset
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
      'filterOffset': this.filterOffset
    });
  }

  @override
  String toString() {
    // big list will remove 。。
    String str = 'CityState{';
    map.forEach((key, value) {
      if(key != 'cityVo' && key != 'cityList')
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
      if (state.cityList.length == 0) {
        state = state.copyWith(
            cityList: data
        );
        break;
      }
      state = state.copyWith(
          cityList: state.cityList + data
      );
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
  }
  print(state);
  return state;
}


final cityReducers = combineReducers(
    [cityMainReducer]
);

final cityStore = new Store(cityReducers, initialState: CityState());