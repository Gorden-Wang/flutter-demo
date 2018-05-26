import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:myapp/src/router/application.dart';
import 'package:myapp/src/router/routes.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:myapp/src/screen/city/main.dart';
import 'package:myapp/src/screen/goods/main.dart';

void main() => runApp(Center(child: HbcGoodsDetail()));

class HbcGoodsDetail extends StatelessWidget {
  HbcGoodsDetail(){
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
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
