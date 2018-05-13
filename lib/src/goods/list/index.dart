import 'package:flutter/material.dart';
import 'top.dart';
import 'listItem.dart';
import 'tab.dart';
import 'filter.dart';

class HBCGoodList extends StatefulWidget {
  final Map data;
  final List list;
  final Map cityGuide, cityContent, cityService;
  final int goodsCount;


  HBCGoodList(this.data)
      :
        this.list=data['goodses'],
        this.cityGuide = data['cityGuides'],
        this.cityContent = data['cityContent'],
        this.cityService = data['cityService'],
        this.goodsCount = data['goodsCount'];

  @override
  ListState createState() => new ListState();
}

class ListState extends State<HBCGoodList>{
  double _scroll = 0.0;

  void scroll(position){
    setState(() {
      _scroll = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    var topFilter = _scroll > 350 ? new Positioned(
    left: 0.0,
    width: MediaQuery
        .of(context)
        .size
        .width,
    child: new HbcCityFilter(),
    ) : new Container();
    return new SafeArea(
      top: true,
      bottom: false,
      child: new Stack(
        children: <Widget>[
          new Container(
              color: new Color(0xfff5f5f5),
              child: new ListView.builder(
                controller: _getController(context),
                itemCount: 33,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return new HbcCityTitle(
                        widget.cityContent, widget.cityGuide, widget.cityService);
                  }
                  if (index == 1) {
                    return new HbcCityTab(widget.cityService, widget.goodsCount);
                  }
                  if (index == 2) {
                    return new HbcCityFilter();
                  }
                  final Map item = widget.list[index - 3];
                  return new HbcCityListItem(item, widget.cityGuide);
                },
              )
          ),
          topFilter
        ],
      ),
    );
  }

  ScrollController _getController(BuildContext context) {
    var controller = new ScrollController();
    controller.addListener(() {
      double offset = controller.offset;
      var topItem = context.size.height;
      scroll(offset);
    });
    return controller;
  }
}
