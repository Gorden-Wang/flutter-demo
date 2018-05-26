import 'package:flutter/material.dart';
import 'package:myapp/src/screen/city/index.dart';
import 'package:myapp/src/util/HBCHttp.dart';
import 'package:myapp/src/util/HBCHttpResponse.dart';


import 'package:flutter_redux/flutter_redux.dart';
import 'package:myapp/src/redux/city_state.dart';

class HbcCity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Container(
          child: Center(
            child: FutureBuilder<HBCHttpResponse>(
              future: HBCHttp(
                  url: 'https://api7.huangbaoche.com/goods/v1.4/p/home/cityGoods?cityId=217&cityHeadPicSize=750&themeId=0&daysCountMin=0&daysCountMax=0&goodsClass=0&channelId=1108019942&offset=0&limit=10',
                  ak: 'aaa').get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return HBCGoodList(snapshot.data.resData);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          )
      ),
    );

//    return StoreProvider(
//      store: CityStore,
//      child: Container(
//          color: Colors.white,
//          child: Stack(
//            children: <Widget>[
//              Center(
//                  child: new StoreConnector<CityState, VoidCallback>(
//                    converter: (store) {
//                      // Return a `VoidCallback`, which is a fancy name for a function
//                      // with no parameters. It only dispatches an Increment action.
//                      return () => store.dispatch(CityAction.updateLoading);
//                    },
//                    builder: (context, callback) =>
//                    new FloatingActionButton(
//                      // Attach the `callback` to the `onPressed` attribute
//                      onPressed: callback,
//                      tooltip: 'Increment',
//                      child: new Icon(Icons.add),
//                    ),
//                  )),
//              new StoreConnector<CityState, String>(
//                converter: (store) => store.state.isLoading.toString(),
//                builder: (context, isLoading) =>
//                new Text(
//                  isLoading,
//                  style: Theme
//                      .of(context)
//                      .textTheme
//                      .display1,
//                ),
//              )
//
//            ],
//                child: FutureBuilder<HBCHttpResponse>(
//                  future: HBCHttp(
//                      url: 'https://api7.huangbaoche.com/goods/v1.4/p/home/cityGoods?cityId=217&cityHeadPicSize=750&themeId=0&daysCountMin=0&daysCountMax=0&goodsClass=0&channelId=1108019942&offset=0&limit=10',
//                      ak: 'aaa').get(),
//                  builder: (context, snapshot) {
//                    if (snapshot.hasData) {
//                      return HBCGoodList(snapshot.data.resData);
//                    } else if (snapshot.hasError) {
//                      return Text("${snapshot.error}");
//                    }
//                    return CircularProgressIndicator();
//                  },
//                ),
//          )
//      ),
//    );
  }
}