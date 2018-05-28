
import 'package:flutter/material.dart';
import 'package:myapp/src/screen/goods/index.dart';
import 'package:myapp/src/components/goods/footer.dart';
import 'package:myapp/src/util/HBCHttp.dart';
import 'package:myapp/src/util/HBCHttpResponse.dart';

class HbcGoodDetail extends StatelessWidget{
  final String goodsNo;

  HbcGoodDetail(this.goodsNo);

  @override
  Widget build(BuildContext context){
    print(this.goodsNo);
    return Container(
      color: Colors.white,
      child: Center(
        child: FutureBuilder<HBCHttpResponse>(
          future: HBCHttp(
              url: 'https://api7.huangbaoche.com/goods/v1.5/p/home/goodsDetail?goodsNo=$goodsNo&channelId=1145431513&offset=0&limit=2&userId=114638169144&fromGuideHome=&guideId=&ignoreGoodsStatus=',
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
}