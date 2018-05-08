import 'package:flutter/material.dart';
import 'src/goods/detail/index.dart';
import 'src/goods/detail/footer.dart';
import 'src/util/HBCHttp.dart';
import 'src/util/HBCHttpResponse.dart';





void main() => runApp(new Center(child: new HbcGoodsDetail()));

class HbcGoodsDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: '别样樱花 | 井之头恩赐公园+三鹰吉卜力美术馆+台场自由女神像+森美术馆 中文1日包车游，东京往返',
      theme: new ThemeData(
          primaryColor: Colors.white
      ),
      home: new Container(
        color: Colors.white,
        child:  new Center(
          child:new FutureBuilder<HBCHttpResponse>(
            future: new HBCHttp(url: 'https://api7.huangbaoche.com/goods/v1.5/p/home/goodsDetail?goodsNo=IC1162040004&channelId=1145431513&offset=0&limit=2&userId=114638169144&fromGuideHome=&guideId=&ignoreGoodsStatus=', ak: 'aaa').get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return  _buildHome(snapshot.data.resData);
              } else if (snapshot.hasError) {
                return new Text("${snapshot.error}");
              }
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Scaffold _buildHome(Map data){
    return new Scaffold(
          appBar: new AppBar(
            title: new Text(
                data['goodsName']),
          ),
          bottomNavigationBar: new HbcGoodFooter(),
          body:  new HbcGoodsIndex(data)
      );
  }
}
