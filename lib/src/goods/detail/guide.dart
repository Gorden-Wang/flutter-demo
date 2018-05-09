import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/util/HBCHttpResponse.dart';
import 'package:myapp/src/util/HBCTheme.dart';
import 'package:myapp/src/util/HBCHttp.dart';



class HbcGoodsGuide extends StatelessWidget {
  final int associateGuideAmount;
  List guideData;
  int swiperIndex = 0;
  Widget cacheWidget;

  HbcGoodsGuide(this.associateGuideAmount, {Key key}) : super(key: key){
    print('init guide');
  }
  @override
  Widget build(BuildContext context) {
//    if(cacheWidget == null){
      print('guide widgets');
      final Widget guideTipsWidget = _getGuideTips(context);
      final Widget guideSwiper = (guideData != null && guideData.length > 0)
          ? _buildSwiper(context)
          : buildFutureBuilder;
      cacheWidget =  new Container(
          child: new Column(
            children: <Widget>[
              guideTipsWidget,
              guideSwiper,
            ],
          ));
//    }
    return cacheWidget;
//    return cacheWidget!=null ? cacheWidget : cacheWidget = new Container(
//        child: new Column(
//          children: <Widget>[
//            guideTipsWidget,
//            guideSwiper,
//          ],
//        ));
  }

  FutureBuilder<HBCHttpResponse> get buildFutureBuilder {
    return new FutureBuilder(
      future: new HBCHttp(
          url: 'https://api7.huangbaoche.com/goods/v1.1/c/goodsguideinfolist?goodsNo=IC1162040004',
          ak: 'aaa').get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          guideData = snapshot.data.resData['listData'];
          return _buildSwiper(context);
        } else if (snapshot.hasError) {
          return new Text("${snapshot.error}");
        }
        return new CircularProgressIndicator();
      },
    );
  }

  Widget _getGuideTips(BuildContext context) {
    return new Container(
        alignment: new Alignment(-1.0, -1.0),
        child: HBCTheme.buildText(
          text: '可由${this.associateGuideAmount}位当地人带你体验',
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        )
    );
  }


  Widget _buildSwiper(BuildContext context) {
    // @TODO add Swiper
    return new Container(
      alignment: Alignment.topLeft,
      margin: new EdgeInsetsDirectional.only(top: 15.0),
      padding: new EdgeInsetsDirectional.only(bottom: 25.0),
      decoration: new BoxDecoration(
          border: new Border(
              bottom: new BorderSide(color: new Color(0xffdbdbdb),
                  width: 1.0,
                  style: BorderStyle.solid)
          )
      ),
      child: new SizedBox.fromSize(
        size: new Size(MediaQuery
            .of(context)
            .size
            .width, 140.0),
        child: new PageView.builder(
            controller: new PageController(
              initialPage: swiperIndex,
              keepPage: true,
            ),
            itemCount : guideData.length,
            itemBuilder: (BuildContext context, int index) {
              swiperIndex = index;
              return _getGuideList(context, swiperIndex);
            }
        ),
      ),
    );
  }

  Widget _getGuideList(BuildContext context, int index) {
    return _getGuideItem(context, guideData[index]);
  }

  Widget _getGuideItem(BuildContext context, Map guideItem) {
    final guideName = guideItem['guideName'];
    final guideCover = guideItem['guideCover'];
    return new Container(
      width: 245.0,
      height: 140.0,
      alignment: Alignment.topLeft,
      child: new Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          new CachedNetworkImage(
            placeholder: new DecoratedBox(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage('assets/imgs/hold.png'),
                    fit: BoxFit.cover
                ),
              ),
            ),
            imageUrl: guideCover,
            width: MediaQuery
                .of(context)
                .size
                .width,
            fit: BoxFit.cover,
          ),
          new Positioned(
              bottom: 10.0,
              left: 10.0,
              child: new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      HBCTheme.buildText(
                          text: guideName,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      ),
                      HBCTheme.buildText(
                          text: '下单支付后可聊天',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}

