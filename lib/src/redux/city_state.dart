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

class CityActions {
  final CityAction action;
  final data;

  CityActions(this.action,{
    this.data
  });
}


class CityState {
  bool isLoading;
  double scroll;
  Map cityVo;
  bool isFetch;
  int queryOffset;
  List cityList;
  bool isFixBar;
  double filterOffset;

  CityState({
    this.isLoading = false,
    this.scroll = 0.0,
    this.cityVo,
    this.isFetch = false,
    this.queryOffset = 1,
    this.isFixBar = false,
    this.filterOffset = 0.0,
  }){
    cityList = [];
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'isloading=$isLoading&scroll=$scroll&cityVo=$cityVo&isFetch=$isFetch';
  }
}


CityState cityMainReducer(CityState state,  action) {
  final data = action.data;
  switch (action.action) {
    case  CityAction.updateLoading:
      state.isLoading = !state.isLoading;
      break;
    case CityAction.updateCityVo :
      state.cityVo = data;
      break;
    case CityAction.updateScroll :
      state.scroll = data;
      break;
    case CityAction.updateIsFetch :
      state.isFetch = data;
      break;
    case CityAction.updateQueryOffset :
      state.queryOffset = data;
      break;
    case CityAction.updateCityList :
      if(state.cityList.length == 0){
        state.cityList = data;
        break;
      }
      state.cityList.addAll(data);
      break;
    case CityAction.updateFixBar :
      state.isFixBar = data;
      break;
    case CityAction.updateFilterOff :
      state.filterOffset = data;
  }
//  print('offset=${action.data}');
  return state;
}



final cityReducers = combineReducers(
    [cityMainReducer]
);

final cityStore = new Store(cityReducers, initialState: CityState());