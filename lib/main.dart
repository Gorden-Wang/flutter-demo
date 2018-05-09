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
          body:  new HbcGoodsIndex(
            data : data
          )
      );
  }
}
