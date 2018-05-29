import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myapp/src/redux/city_state.dart';
import 'package:myapp/src/components/lib/text.dart';

class HbcCityFilterContainer extends StatelessWidget {
  final List goodsThemes;
  final ScrollController scroller;

  HbcCityFilterContainer(this.goodsThemes, {
    this.scroller
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return getReduxWrap();
  }

  Widget getReduxWrap() {
    return new StoreConnector<CityState, CityState>(
        converter: (store) => store.state,
        builder: (context, state) =>
            getMainBuild(context, state)
    );
  }

  Widget getMainBuild(BuildContext context, CityState state) {
    final isOpen = state.isExpendTab;
    List<Widget> filterWidgets = [buildFilterContainer(context, state)];
    double maxHeight = 55.0;
    if (isOpen == true) {
      filterWidgets.addAll([filterRows(context, state), filterButton]);
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
              blurRadius: 5.0
          )
          ]
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () => null,
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
                    cityStore.dispatch(CityActions(CityAction.resetSelTabItem));
                  },
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                      '重置'
                  ),
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

  Expanded filterRows(BuildContext context, CityState state) {
    final Map item = state.selTabItem;
    List list0 = <Widget>[
      buildListItem(context, {'isBordered': true, 'title': '超省心(固定线路)'}),
      buildListItem(context, {'isBordered': false, 'title': '超省心(固定线路)'})
    ];
    List list1 = <Widget>[
      buildListItem(context, {'isBordered': true, 'title': '1日'}),
      buildListItem(context, {'isBordered': false, 'title': '多日'})
    ];
    List list;
    if (item['index'] == 0) {
      list = list0;
    } else if (item['index'] == 1) {
      list = list1;
    } else {
      return Expanded(
        child: Container(
          color: Colors.white,
          child: buildGrid(context),
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

  Container buildFilterContainer(BuildContext context, CityState state) {
    final List itemList = state.tabItems;
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
          HbcCityFilterItem(itemList[0], handler: handler,
              scrollPosition: state.filterOffset),
          HbcCityFilterItem(itemList[1], handler: handler,
              scrollPosition: state.filterOffset),
          HbcCityFilterItem(itemList[2], handler: handler,
              scrollPosition: state.filterOffset),
        ],
      ),
    );
  }

  void handler(double position) {
    if (scroller.offset <= position) {
      scroller.animateTo((position+1.0),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut);
    }
  }

  Widget buildGrid(BuildContext context) {
    List<Widget> res = goodsThemes.map((item) {
      return buildListItem(
          context, {'isBordered': false, 'title': item['themeName']});
    }).toList();
    return new GridView.count(
        primary: false,
        padding: const EdgeInsets.only(bottom: 10.0),
        crossAxisSpacing: 10.0,
        crossAxisCount: 2,
        childAspectRatio: 6.0,
        children: res
    );
  }

  Container buildListItem(BuildContext context, Map map) {
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
      decoration: boxDecoration,
      child: Text(
          map['title'],
          style: HbcCommonTextStyle(context).body1
      ),
    );
  }

}


class HbcCityFilterItem extends StatelessWidget {
  final bool isOpen;
  final String title;
  final bool isBorder;
  final int index;
  final Function handler;
  final double scrollPosition;

  final Map item;

  HbcCityFilterItem(this.item, {
    this.handler,
    this.scrollPosition
  })
      :
        this.isOpen = item['isOpen'],
        this.title = item['title'],
        this.isBorder = item['isBorder'],
        this.index = item['index'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildItem(context, title, isBorder);
  }

  Widget _buildItem(BuildContext context, String string, bool isBorder) {
    Border border;
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
    cityStore.dispatch(CityActions(CityAction.updateSelTabItem, data: Map.from({
      'index': index,
    })));
    if (handler != null && isOpen == false) {
      handler(scrollPosition);
    }
  }
}
