import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../util/HBCTheme.dart';

class HbcCityTitle extends StatelessWidget {
  final Map cityContent, cityGuides, cityService;

  HbcCityTitle(this.cityContent, this.cityGuides, this.cityService);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Stack(
        alignment: Alignment.center,
        children: <Widget>[
          new AspectRatio(
            aspectRatio: 1.875,
            child: new CachedNetworkImage(
              placeholder: new DecoratedBox(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage('assets/imgs/hold.png'),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              imageUrl: cityContent['cityHeadPicture'],
              height: MediaQuery
                  .of(context)
                  .size
                  .width,
              fit: BoxFit.cover,
            ),
          ),

          new Positioned(
              child: new Container(
                  child: new Column(
                    children: <Widget>[
                      HBCTheme.buildText(
                          text: cityContent['cityName'],
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600
                      ),
                      new Container(
                        margin: new EdgeInsets.only(top: 8.0,bottom: 8.0),
                        child: HBCTheme.buildText(
                            text: '${cityGuides['guideAmount']}位当地中文司导',
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buidTopGuideList(context),
                      )
                    ],
                  )
              )
          ),
        ],
      ),
    );
  }

  List<Widget> _buidTopGuideList(BuildContext context) {
    List res = <Widget>[];
    List source = cityGuides['guideAvatars'];
    for (int i = 0; i < source.length; i++) {
      String item = source[i];
      double right = i == source.length - 1 ? 0.0 : 5.0;
      res.add(
          new Container(
            width: 30.0,
            height: 30.0,
            margin: new EdgeInsets.only(right: right),
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    image: new CachedNetworkImageProvider(item)
                )
            ),
          )
      );
    }
    return res;
  }
}