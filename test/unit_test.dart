import 'package:test/test.dart';
import 'package:myapp/src/util/HBCHttp.dart';
import 'package:myapp/src/util/HBCHttpResponse.dart';

void main() {
  test('test HBCHttp', () async  {
    HBCHttp http = new HBCHttp(
      url : 'https://api7.huangbaoche.com/goods/v1.5/p/home/goodsDetail?goodsNo=IC1162040004&channelId=1145431513&offset=0&limit=2&userId=114638169144&fromGuideHome=&guideId=&ignoreGoodsStatus=',
      ak : 'aaa'
    );
    HBCHttpResponse a = await http.get();
    print(a.httpStatus);
    print(a.resData);
    print(a.resStatus);
    print(a.resMessage);
  });
}
