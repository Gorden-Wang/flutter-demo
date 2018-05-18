import 'package:flutter/material.dart';
import 'package:myapp/src/components/city/topContianer.dart';
import 'package:myapp/src/components/city/listItemContainer.dart';
import 'package:myapp/src/components/city/tabContianer.dart';
import 'package:myapp/src/components/city/filterContianer.dart';


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
    var topFilter = _scroll > _getFilterOffset(context) ? new Positioned(
      left: 0.0,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: new HbcCityFilterContainer(),
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
                    return new HbcCityTopContainer(
                        widget.cityContent, widget.cityGuide, widget.cityService);
                  }
                  if (index == 1) {
                    return new HbcCityTabContainer(widget.cityService, widget.goodsCount);
                  }
                  if (index == 2) {
                    return new HbcCityFilterContainer();
                  }
                  final Map item = widget.list[index - 3];
                  return new HbcCityListItemContainer(item, widget.cityGuide);
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
      scroll(offset);
    });
    return controller;
  }

  double _getFilterOffset(BuildContext context){
    double topImageHeight = MediaQuery.of(context).size.width / 1.875;
    double tabHeight = 100.0;
    double lineCountHeight = 60.0;
    return topImageHeight + tabHeight + lineCountHeight;

  }
}
