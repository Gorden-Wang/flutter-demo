import 'package:flutter/material.dart';

import 'package:myapp/src/components/lib/text.dart';

class HbcCityFilterContainer extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FilterState();
  }

}

class FilterState extends State<HbcCityFilterContainer> {
  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IndexedStack(
      children: <Widget>[
        _buildFilterContainer
      ],
    );
  }

  Container get _buildFilterContainer {
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
          _FilterItem(const {'title': '类型', 'isBorder': true},clickHandle),
          _FilterItem(const {'title': '天数', 'isBorder': true},clickHandle),
          _FilterItem(const {'title': '主题', 'isBorder': false},clickHandle),
        ],
      ),
    );
  }

  void clickHandle(Map item) {
    setState(() {
      isClick = !isClick;
      print(isClick);
      print(item);
    });
  }
}


class _FilterItem extends StatefulWidget {
  final Map item;
  final String title;
  final bool isBorder;
  final Function clickHandle;

  _FilterItem(this.item,this.clickHandle)
      :
        this.title = item['title'],
        this.isBorder = item['isBorder'];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HbcCityFilterState();
  }

}

class HbcCityFilterState extends State<_FilterItem> {
  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

    Icon container = isClick == false ? Icon(Icons.arrow_drop_down)
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
      isClick = !isClick;
      widget.clickHandle != null ? widget.clickHandle(widget.item) : null;
    });
  }
}
