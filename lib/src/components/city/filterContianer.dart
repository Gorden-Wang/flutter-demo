import 'package:flutter/material.dart';

import 'package:myapp/src/components/lib/text.dart';

class HbcCityFilterContainer extends StatefulWidget {
  final List goodsThemes;

  HbcCityFilterContainer(this.goodsThemes);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FilterState();
  }

}

class FilterState extends State<HbcCityFilterContainer> {
  bool isOpen = false;
  Map item = {};
  List itemList = [
    {'title': '类型', 'isBorder': true, 'index': 0, 'isOpen': false},
    {'title': '天数', 'isBorder': true, 'index': 1, 'isOpen': false},
    {'title': '主题', 'isBorder': false, 'index': 2, 'isOpen': false}
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> filterWidgets = [buildFilterContainer];
    double maxHeight = 55.0;
    if (isOpen == true) {
      filterWidgets.addAll([filterRows, filterButton]);
      maxHeight = 198.0;
    }
    return SizedBox(
      height: maxHeight,
      child: Column(
        children: filterWidgets,
      ),
    );
  }

  Container get filterButton {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[BoxShadow(
          color: Colors.grey.shade300,
            blurRadius : 5.0

        )]
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1.0
                      )
                  )
              ),
              child: FlatButton(
                onPressed: () {

                },
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                    '重置'
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xfff9be3b),
                  border: Border(
                      top: BorderSide(
                          color: Color(0xfff9be3b),
                          width: 1.0
                      )
                  )
              ),
              child: FlatButton(
                onPressed: () {

                },
                color: Color(0xfff9be3b),
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                    '确定'
                ),
              ),
            ),
          )

        ],
      ),
    );
  }

  Expanded get filterRows {
    List list0 = <Widget>[BuildListItem({'isBordered' : true,'title':'超省心(固定线路)'}),
    BuildListItem({'isBordered' : false,'title':'超省心(固定线路)'})];
    List list1 = <Widget>[BuildListItem({'isBordered' : true,'title':'1日'}),
    BuildListItem({'isBordered' : false,'title':'多日'})];
    List list;
    if(item['index'] == 0){
      list = list0;
    }else if(item['index'] == 1){
      list = list1;
    }else{
      return Expanded(
        child: Container(
          color: Colors.white,
          child: buildGrid(),
        ),
      );
    }
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 20.5, right: 20.5),
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(0.0),
          primary: false,
          children: list,
        ),
      ),
    );
  }

  Widget buildGrid(){
    List<Widget> res = widget.goodsThemes.map((item){
      return BuildListItem({'isBordered':false,'title':item['themeName']});
    }).toList();
    return new GridView.count(
      primary: false,
      padding: const EdgeInsets.only(bottom: 10.0),
      crossAxisSpacing: 10.0,
      crossAxisCount: 2,
      childAspectRatio : 6.0,
      children: res
    );
  }

  Container BuildListItem(Map map) {
    var boxDecoration = map['isBordered'] ? BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0
            )
        )
    ) : null;
    return Container(
      padding: EdgeInsets.all(15.0),
      alignment: Alignment.center,
      decoration:boxDecoration,
      child: Text(
          map['title'],
          style: HbcCommonTextStyle(context).body1
      ),
    );
  }

  Container get buildFilterContainer {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
                width: 1.0,
                color: Colors.grey.shade300,
              )
          )
      ),
      child: Row(
        children: <Widget>[
          FilterItem(itemList[0], clickHandle),
          FilterItem(itemList[1], clickHandle),
          FilterItem(itemList[2], clickHandle),
        ],
      ),
    );
  }

  void clickHandle(Map item) {
    setState(() {
      int index = item['index'];
      isOpen = item['isOpen'];
      for (int i = 0; i < itemList.length; i++) {
        if (index != i) {
          itemList[i]['isOpen'] = false;
        }
      }
      itemList[index] = item;
      this.item = item;
    });
  }
}


class FilterItem extends StatefulWidget {
  final Map item;
  final String title;
  final bool isBorder;
  bool isOpen;
  final Function clickHandle;

  FilterItem(this.item, this.clickHandle)
      :
        this.title = item['title'],
        this.isOpen = item['isOpen'],
        this.isBorder = item['isBorder'];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HbcCityFilterState();
  }

}

class HbcCityFilterState extends State<FilterItem> {
  bool isOpen;

  HbcCityFilterState() {
//    isOpen = widget.isOpen;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    isOpen = widget.isOpen;
    return _buildItem(context, widget.title, widget.isBorder);
  }

  Widget _buildItem(BuildContext context, String string, bool isBorder) {
    var border = null;
    if (isBorder == true) {
      border = Border(
          right: BorderSide(
              width: 1.0,
              color: Colors.grey.shade300,
              style: BorderStyle.solid
          )
      );
    }

    Icon container = isOpen == false ? Icon(Icons.arrow_drop_down)
        : Icon(
        Icons.arrow_drop_up);

    return Expanded(
      child: GestureDetector(
        onTap: _tapHandler,
        child: Container(
          margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: border
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                string,
                style: HbcCommonTextStyle(context).button,
              ),

              Container(
                child: container,
              )
            ],
          ),
        ),
      ),
    );
  }

  _tapHandler() {
    setState(() {
      isOpen = !isOpen;
      Map item = Map.from(widget.item);
      item['isOpen'] = isOpen;
      widget.clickHandle != null ? widget.clickHandle(item) : null;
    });
  }
}
