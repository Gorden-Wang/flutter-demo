import 'package:flutter/material.dart';
import 'top.dart';
import 'listItem.dart';
import 'tab.dart';

class HBCGoodList extends StatelessWidget {
  final Map data;
  final List list;
  final Map cityGuide,cityContent,cityService;
  final int goodsCount;


  HBCGoodList(this.data) :
        this.list=data['goodses'],
        this.cityGuide = data['cityGuides'],
        this.cityContent = data['cityContent'],
        this.cityService = data['cityService'],
        this.goodsCount = data['goodsCount'];
  @override
  Widget build(BuildContext context) {
    print('widgets list ');
    return new Container(
      color: new Color(0xfff5f5f5),
      child: new ListView.builder(
          controller : _getController(context),
        itemBuilder: (BuildContext context,int index){
          if(index == 0){
            return new HbcCityTitle(cityContent, cityGuide, cityService);
          }
          if(index == 1){
            return new HbcCityTab(cityService,goodsCount);
          }
          final Map item = list[index-2];
          return new HbcCityListItem(item, cityGuide);
        },
      )
    );
  }
  
  ScrollController _getController(BuildContext context){
    var controller = new ScrollController();
    controller.addListener((){
      double offset = controller.offset;
      var topItem =context.size.height;
      print(topItem);
    });
    return controller;
  }

}
