import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const String DAY_BG = 'https://fr-static.huangbaoche.com/20180320/icon-day.6bd0b42e4c3243a9.png';
const String QUESTION_ICON = 'https://fr-static.huangbaoche.com/20180320/wen.8e3e27ff1f412a62.png';

class HbcGoodTripContainer extends StatelessWidget {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  final List trip;
  Widget cacheWidget;

  HbcGoodTripContainer({
    Key key,
    this.trip
  }) : super(key: key) {
    print('init trip');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    if(cacheWidget == null){
    print('trip widgets');
    cacheWidget = new Container(
      alignment: Alignment.centerLeft,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: new Text(
              '行程参考',
              style: new TextStyle(
                  color: new Color(0xff151515),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'PingFang SC'
              ),
            ),
          ),
          new Text(
            '以下参考行程和建议的出发时间可根据您的需要灵活调整',
            style: new TextStyle(
                color: new Color(0xff929292),
                fontSize: 14.0,
                fontFamily: 'PingFang SC'
            ),
          ),
          new Text(
            '仅需调整出发时间，您可在下单时自助修改；需要调整行程，您可以免费咨询，人工协助您下单',
            style: new TextStyle(
                color: new Color(0xff929292),
                fontSize: 14.0,
                fontFamily: 'PingFang SC'
            ),
          ),
        ],
      ),
    );
//    }

    return cacheWidget;
  }
}
