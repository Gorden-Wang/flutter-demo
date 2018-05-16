import 'package:flutter/material.dart';
import 'dart:async';
import 'src/goods/detail/index.dart';
import 'src/goods/detail/footer.dart';
import 'src/util/HBCHttp.dart';
import 'src/util/HBCHttpResponse.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:myapp/src/screen/city/index.dart';

void main() => runApp(new Center(child: new HbcGoodsDetail()));

class HbcGoodsDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primaryColor: Colors.white
      ),
      home: new Container(
        color: Colors.white,
        child: new Container(
            child: new Center(
              child: new FutureBuilder<HBCHttpResponse>(
                future: new HBCHttp(
                    url: 'https://api7.huangbaoche.com/goods/v1.4/p/home/cityGoods?cityId=217&cityHeadPicSize=750&themeId=0&daysCountMin=0&daysCountMax=0&goodsClass=0&channelId=1108019942&offset=0&limit=30',
                    ak: 'aaa').get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return new HBCGoodList(snapshot.data.resData);
                  } else if (snapshot.hasError) {
                    return new Text("${snapshot.error}");
                  }
                  return new CircularProgressIndicator();
                },
              ),
            )
        ),
      ),
      routes:
      <String, WidgetBuilder>{
//        '/':         (BuildContext context) => new StockHome(stocks, _configuration, configurationUpdater),
        '/poi': (BuildContext context) => null
      },
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    final List<String> path = settings.name.split('/poi/');
    final List<String> goodsPath = settings.name.split('/goods/');

    if (goodsPath.length == 2 && goodsPath[1] != null) {
      return new MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return new Container(
              color: Colors.white,
              child: new Center(
                child: new FutureBuilder<HBCHttpResponse>(
                  future: new HBCHttp(
                      url: 'https://api7.huangbaoche.com/goods/v1.5/p/home/goodsDetail?goodsNo=${goodsPath[1]}&channelId=1145431513&offset=0&limit=2&userId=114638169144&fromGuideHome=&guideId=&ignoreGoodsStatus=',
                      ak: 'aaa').get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _buildHome(snapshot.data.resData);
                    } else if (snapshot.hasError) {
                      return new Text("${snapshot.error}");
                    }
                    return new CircularProgressIndicator();
                  },
                ),
              ),
            );
          }
      );
    }
    if (path.length == 2 && path[1] != null) {
      return new MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return new WebviewScaffold(
              url: 'https://goods.huangbaoche.com/goods/poi/${path[1]}',
              appBar: new AppBar(
                title: new Text('阿斯蒂芬'),
              ),
              withZoom: true,
              withLocalStorage: true,
            );
          }
      );
    }

    return new MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) {
          return null;
        }
    );
  }

  Scaffold _buildHome(Map data) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
              data['goodsName']),
        ),
        bottomNavigationBar: new HbcGoodFooter(),
        body: new HbcGoodsIndex(
            data: data
        )
    );
  }

  Future<Null> _launchURL(BuildContext context, String url,
      String title) async {
//    const url = 'sms:18510249866';
//    flutterWebviewPlugin.launch(url);
    Navigator.push(context, new MaterialPageRoute<void>(
        builder: (BuildContext context)
    {
      return new WebviewScaffold(
        url: url,
        appBar: new AppBar(
          title: new Text(title),
        ),
        withZoom: true,
        withLocalStorage: true,
      );
    }
    )
    );
  }
}
