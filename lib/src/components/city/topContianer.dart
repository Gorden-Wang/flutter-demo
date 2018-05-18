import 'package:flutter/material.dart';
import 'package:myapp/src/components/lib/image.dart';
import 'package:myapp/src/components/lib/text.dart';

class HbcCityTopContainer extends StatelessWidget {
  final Map cityContent, cityGuides, cityService;

  HbcCityTopContainer(this.cityContent, this.cityGuides, this.cityService);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HbcCommonImage(
        cityContent['cityHeadPicture'],
        aspectRatio: 1.875,
        isStack: true,
        stackAlign: AlignmentDirectional.center,
        children: <Widget>[
          _buildTopTexts(context),
        ],
      ),
    );
  }

  Positioned _buildTopTexts(BuildContext context) {
    return Positioned(
        child: Container(
            child: Column(
              children: <Widget>[
                Text(
                  cityContent['cityName'],
                  style: HbcCommonTextStyle
                      .withWhiteColor(context)
                      .headline,
                ),
                Container(
                  margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    '${cityGuides['guideAmount']}位当地中文司导',
                    style: HbcCommonTextStyle
                        .withWhiteColor(context)
                        .body2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildTopGuideList(context),
                )
              ],
            )
        )
    );
  }

  List<Widget> _buildTopGuideList(BuildContext context) {
    List res = <Widget>[];
    List source = cityGuides['guideAvatars'];
    for (int i = 0; i < source.length; i++) {
      String item = source[i];
      double right = i == source.length - 1 ? 0.0 : 5.0;
      res.add(
          Container(
            width: 30.0,
            height: 30.0,
            margin: EdgeInsets.only(right: right),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                  style: BorderStyle.solid
              ),
            ),
            child: HbcCircleImage(item),
          )
      );
    }
    return res;
  }
}
