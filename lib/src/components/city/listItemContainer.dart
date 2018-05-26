import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:myapp/src/router/application.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:myapp/src/components/lib/text.dart';

class HbcCityListItemContainer extends StatelessWidget {
  final Map item;
  final Map cityGuide;

  HbcCityListItemContainer(this.item, this.cityGuide);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        String route = "/goods?goodsNo=${item['goodsNo']}";
        TransitionType transitionType = TransitionType.native;
        Application.router.navigateTo(
            context, route,
            transition: transitionType).then((result) {
          // when back callback ?
        });
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.only(bottom: 15.0),
        child: _buildListItem(context, item),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Map item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildItemImgContianer(
            context,
            url: '${item['goodsPicture']}',
            title: '${item['headLable']}',
            subTitle: '${cityGuide['guideAmount']}'
        ),
        _buildItemTitle(context, '${item['goodsName']}'),
        _buildItemPrice(context, '${item['perPrice']}', '${item['daysCount']}')

      ],
    );
  }

  Widget _buildItemImgContianer(BuildContext context,
      {String title, String subTitle, String url}) {
    return Stack(
      children: <Widget>[
        _buildItemImg(
            context, url),
        _buildItemTag(context, title: title),
        _buildItemTip(context, subTitle: subTitle)
      ],
    );
  }

  Widget _buildItemTag(BuildContext context, {String title}) {
    Color color = title == '超省心' ? Color(0xff8bd36d) : Color(
        0xff69cbd6);
    return Positioned(
      top: 20.0,
      child: Container(
          padding: EdgeInsets.only(
              top: 3.0,
              right: 8.0,
              bottom: 3.0,
              left: 8.0
          ),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)
              )
          ),
          child: Text(
            title,
            style: HbcCommonTextStyle
                .withWhiteColor(context)
                .caption,
          )
      ),
    );
  }

  Widget _buildItemTip(BuildContext context, {String subTitle}) {
    return Positioned(
      bottom: 15.0,
      child: Container(
        padding: EdgeInsets.only(
            top: 3.0,
            right: 5.0,
            bottom: 3.0,
            left: 5.0
        ),
        decoration: BoxDecoration(
            color: Color.fromARGB(100, 0, 0, 0),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)
            )
        ),
        child: Row(
          children: <Widget>[
            Text(
              '$subTitle 位当地中文司导',
              style: HbcCommonTextStyle
                  .withWhiteColor(context)
                  .caption,
            ),
            Container(
              margin: EdgeInsets.only(left: 5.0),
              child: Image.network(
                'https://fr-static.huangbaoche.com/20180313/guide.0ca8d80948c9964b.png',
                width: 15.0,
                height: 15.0,
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _buildItemImg(BuildContext context, String url) {
    return AspectRatio(
      aspectRatio: 2.0,
      child: CachedNetworkImage(
        placeholder: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/imgs/hold.png'),
                fit: BoxFit.cover
            ),
          ),
        ),
        imageUrl: url,
        height: MediaQuery
            .of(context)
            .size
            .width,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildItemTitle(BuildContext context, String title) {
    TextStyle styleCandS = TextStyle(
      fontSize: 18.0,
    );
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Text(
        title,
        style: HbcCommonTextStyle(context, style: styleCandS).body2,
      ),
    );
  }

  Widget _buildItemPrice(BuildContext context, String price, String dayCount) {
    TextStyle styleColor = TextStyle(
        color: Color(0xfff63000)
    );
    TextStyle styleCandS = TextStyle(
      color: Color(0xfff63000),
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          '￥',
          style: HbcCommonTextStyle(context, style: styleColor).body2,
        ),
        Text(
          price,
          style: HbcCommonTextStyle(context, style: styleCandS).title,
        ),
        Container(
          margin: EdgeInsets.only(left: 8.0),
          child: Text(
            '起/人.$dayCount日',
            style: HbcCommonTextStyle(context).caption,
          ),
        )
      ],
    );
  }
}
