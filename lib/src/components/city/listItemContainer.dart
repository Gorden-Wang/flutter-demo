import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../util/HBCTheme.dart';

class HbcCityListItemContianer extends StatelessWidget{
  final Map item;
  final Map cityGuide;
  HbcCityListItemContianer(this.item,this.cityGuide);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('/goods/${item['goodsNo']}');
      },
      child:  new Container(
        color: Colors.white,
        padding: new EdgeInsets.all(20.0),
        margin: new EdgeInsets.only(bottom: 15.0),
        child: _buildListItem(context,item),
      ),
    );
  }
  Widget _buildListItem(BuildContext context,Map item) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildItemImgContianer(
            context,
            url : '${item['goodsPicture']}',
            title : '${item['headLable']}',
            subTitle: '${cityGuide['guideAmount']}'
        ),
        _buildItemTitle(context, '${item['goodsName']}'),
        _buildItemPrice(context, '${item['perPrice']}')

      ],
    );
  }

  Widget _buildItemImgContianer(BuildContext context,
      {String title, String subTitle,String url}) {
    return new Stack(
      children: <Widget>[
        _buildItemImg(
            context, url),
        _buildItemTag(context,title: title),
        _buildItemTip(context,subTitle:subTitle)
      ],
    );
  }

  Widget _buildItemTag(BuildContext context,{String title}){
    Color color = title == '超省心' ? new Color(0xff8bd36d) : new Color(0xff69cbd6);
    return new Positioned(
      top: 20.0,
      child: new Container(
        padding: new EdgeInsets.only(
            top: 3.0,
            right: 8.0,
            bottom: 3.0,
            left: 8.0
        ),
        decoration: new BoxDecoration(
            color: color,
            borderRadius : new BorderRadius.only(
                topRight: new Radius.circular(30.0),
                bottomRight: new Radius.circular(30.0)
            )
        ),
        child: HBCTheme.buildText(
            text: title,
            fontSize: 13.0,
            color: Colors.white
        ),
      ),
    );
  }

  Widget _buildItemTip(BuildContext context,{String subTitle}){
    return new Positioned(
      bottom: 15.0,
      child: new Container(
        padding: new EdgeInsets.only(
            top:3.0,
            right: 5.0,
            bottom: 3.0,
            left: 5.0
        ),
        decoration: new BoxDecoration(
            color: new Color.fromARGB(100,0,0,0),
            borderRadius : new BorderRadius.only(
                topRight: new Radius.circular(30.0),
                bottomRight: new Radius.circular(30.0)
            )
        ),
        child: new Row(
          children: <Widget>[
            HBCTheme.buildText(
              text: '${subTitle} 位当地中文司导',
              fontSize: 13.0,
              color: Colors.white,
            ),
            new Container(
              margin: new EdgeInsets.only(left:5.0),
              child: new Image.network(
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
    return new AspectRatio(
      aspectRatio: 2.0,
      child: new CachedNetworkImage(
        placeholder: new DecoratedBox(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage('assets/imgs/hold.png'),
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
    return new Container(
      margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: HBCTheme.buildText(
          text: title,
          fontSize: 18.0,
          color: Colors.grey.shade800,
          fontWeight: FontWeight.w400
      ),
    );
  }

  Widget _buildItemPrice(BuildContext context, String price) {
    return new Row(
      children: <Widget>[
        HBCTheme.buildText(
            text: '￥',
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: new Color(0xfff63000)
        ),

        HBCTheme.buildText(
            text: price,
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: new Color(0xfff63000)
        ),
        new Container(
          margin: new EdgeInsets.only(left: 8.0),
          child: HBCTheme.buildText(
              text: '起/人.1日',
              fontSize: 14.0,
              color: Colors.grey.shade500
          ),
        )
      ],
    );
  }
}
