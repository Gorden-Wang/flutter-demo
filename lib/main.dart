import 'package:flutter/material.dart';
import 'dart:async';
import 'package:myapp/src/screen/goods/index.dart';
import 'package:myapp/src/components/goods/footer.dart';
import 'src/util/HBCHttp.dart';
import 'src/util/HBCHttpResponse.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:myapp/src/screen/city/index.dart';

void main() => runApp(Center(child: HbcGoodsDetail()));

class HbcGoodsDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white,
          fontFamily: 'PingFang SC Regular'
      ),
      home: Container(
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
      ),
      routes:
      <String, WidgetBuilder>{
//        '/':         (BuildContext context) => StockHome(stocks, _configuration, configurationUpdater),
        '/poi': (BuildContext context) => null
      },
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    final List<String> path = settings.name.split('/poi/');
    final List<String> goodsPath = settings.name.split('/goods/');

    if (goodsPath.length == 2 && goodsPath[1] != null) {
      return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return Container(
              color: Colors.white,
              child: Center(
                child: FutureBuilder<HBCHttpResponse>(
                  future: HBCHttp(
                      url: 'https://api7.huangbaoche.com/goods/v1.5/p/home/goodsDetail?goodsNo=${goodsPath[1]}&channelId=1145431513&offset=0&limit=2&userId=114638169144&fromGuideHome=&guideId=&ignoreGoodsStatus=',
                      ak: 'aaa').get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _buildHome(snapshot.data.resData);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            );
          }
      );
    }
    if (path.length == 2 && path[1] != null) {
      return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return WebviewScaffold(
              url: 'https://goods.huangbaoche.com/goods/poi/${path[1]}',
              appBar: AppBar(
                title: Text('阿斯蒂芬'),
              ),
              withZoom: true,
              withLocalStorage: true,
            );
          }
      );
    }

    return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) {
          return null;
        }
    );
  }

  Scaffold _buildHome(Map data) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              data['goodsName']),
        ),
        bottomNavigationBar: HbcGoodFooter(),
        body: HbcGoodsIndex(
            data: data
        )
    );
  }

  Future<Null> _launchURL(BuildContext context, String url,
      String title) async {
    Navigator.push(context, MaterialPageRoute<void>(
        builder: (BuildContext context)
    {
      return WebviewScaffold(
        url: url,
        appBar: AppBar(
          title: Text(title),
        ),
        withZoom: true,
        withLocalStorage: true,
      );
    }
    )
    );
  }
}
