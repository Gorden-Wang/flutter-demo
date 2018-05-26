import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:myapp/src/router/application.dart';
import 'package:myapp/src/router/routes.dart';
import 'package:myapp/src/screen/city/main.dart';

void main() => runApp(Center(child: HbcGoodsDetail()));

class HbcGoodsDetail extends StatelessWidget {
  HbcGoodsDetail(){
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
//    List<dynamic> a = json.decode('[231, 142, 139, 233, 135, 138, 229, 186, 134]');
//    List<int> b = HBCCommonUtil.getListInt(a);
//    print(b);
//    print(utf8.encode('王释庆'));
//    print(utf8.decode(b));
//    print(utf8.decode('[231, 142, 139, 233, 135, 138, 229, 186, 134]'.codeUnits));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white,
          fontFamily: 'PingFang SC Regular'
      ),
      home: HbcCity(),
      onGenerateRoute: Application.router.generator,
    );
  }
}
