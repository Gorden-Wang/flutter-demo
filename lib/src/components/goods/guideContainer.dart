import 'package:flutter/material.dart';
import 'package:myapp/src/components/lib/image.dart';
import 'package:myapp/src/util/HBCHttpResponse.dart';
import 'package:myapp/src/util/HBCTheme.dart';
import 'package:myapp/src/util/HBCHttp.dart';


class HbcGoodsGuideContainer extends StatelessWidget {
  final int associateGuideAmount;
  final String goodsNo;
  List guideData;
  int swiperIndex = 0;
  Widget cacheWidget;

  HbcGoodsGuideContainer(this.associateGuideAmount, this.goodsNo, {Key key})
      : super(key: key) {
    print(guideData);
    print(associateGuideAmount);
  }

  @override
  Widget build(BuildContext context) {
    final Widget guideTipsWidget = _getGuideTips(context);
    final Widget guideSwiper = (guideData != null && guideData.length > 0)
        ? _buildSwiper(context)
        : buildFutureBuilder;
    cacheWidget = Container(
        child: Column(
          children: <Widget>[
            guideTipsWidget,
            guideSwiper,
          ],
        ));
    return cacheWidget;
  }

  FutureBuilder<HBCHttpResponse> get buildFutureBuilder {
    return FutureBuilder(
      future: HBCHttp(
          url: 'https://api7.huangbaoche.com/goods/v1.1/c/goodsguideinfolist?goodsNo=$goodsNo',
          ak: 'aaa').get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          guideData = snapshot.data.resData['listData'];
          return _buildSwiper(context);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return AspectRatio(
            aspectRatio: 2.0,
            child: Center(
              child: CircularProgressIndicator(),
            )
        );
      },
    );
  }

  Widget _getGuideTips(BuildContext context) {
    return Container(
        alignment: Alignment(-1.0, -1.0),
        margin: EdgeInsets.only(bottom: 15.0),
        child: HBCTheme.buildText(
          text: '可由${this.associateGuideAmount}位当地人带你体验',
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        )
    );
  }


  Widget _buildSwiper(BuildContext context) {
    // @TODO add Swiper
    return AspectRatio(
      aspectRatio: 2.0,
      child: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color(0xffdbdbdb),
                    width: 1.0,
                    style: BorderStyle.solid)
            )
        ),
        child: PageView.builder(
            controller: PageController(
              initialPage: swiperIndex,
              keepPage: true,
            ),
            itemCount: guideData.length,
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
    return Container(
      child: HbcCommonImage(
        guideCover,
        aspectRatio: 2.0,
        fit: BoxFit.cover,
        isStack: true,
        children: <Widget>[
          _buildImageText(guideName)
        ],
      ),
    );
  }

  Positioned _buildImageText(guideName) {
    return Positioned(
        bottom: 10.0,
        left: 10.0,
        child: Container(
            alignment: Alignment.topLeft,
            child: Column(
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
            )));
  }
}

