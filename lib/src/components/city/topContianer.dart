import 'package:flutter/material.dart';
import '../../util/HBCTheme.dart';
import 'package:myapp/src/components/lib/image.dart';

class HbcCityTopContianer extends StatelessWidget {
  final Map cityContent, cityGuides, cityService;

  HbcCityTopContianer(this.cityContent, this.cityGuides, this.cityService);

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
                HBCTheme.buildText(
                    text: cityContent['cityName'],
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600
                ),
                Container(
                  margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: HBCTheme.buildText(
                      text: '${cityGuides['guideAmount']}位当地中文司导',
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buidTopGuideList(context),
                )
              ],
            )
        )
    );
  }

  List<Widget> _buidTopGuideList(BuildContext context) {
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
