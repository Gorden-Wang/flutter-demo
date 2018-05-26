import 'package:redux/redux.dart';

enum CityAction {
  updateLoading
}


class CityState {
  bool isLoading;
  double scroll;

  CityState({
    this.isLoading = false,
    this.scroll = 0.0
  });

  @override
  String toString() {
    // TODO: implement toString
    return 'isloading=$isLoading&scroll=$scroll';
  }
}


CityState cityReducer(CityState state, action) {
  switch (action) {
    case CityAction.updateLoading :
      state.isLoading = !state.isLoading;
  }
  return state;
}


final CityReducer = combineReducers(
    [cityReducer]
);

final CityStore = new Store(CityReducer, initialState: CityState());