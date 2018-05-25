import 'package:flutter/material.dart';
import 'package:myapp/src/util/HBCTheme.dart';
import 'package:myapp/src/components/lib/text.dart';

class HbcGoodsTitleContainer extends StatelessWidget {
  final String title;
  final List theme;

  HbcGoodsTitleContainer(this.title, this.theme);

  ///   title Wrap UI
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTitleContainer(context),
        _buildKeyWordContianer(context),
        _buildGuideTips(context)
      ],
    );
  }

  /// title UI
  Widget _buildTitleContainer(BuildContext context) {
    return Container(
        child: Text(
          title,
          style: HbcCommonTextStyle(context, style: TextStyle(
              fontSize: 22.0,
              fontFamily: 'FZDYSJW'
          )).title,
        )
    );
  }

  /// theme inner UI - text & split
  Widget _generateTheme(BuildContext context, Map item, [String split]) {
    if (item != null) {
      return Container(
        child: Text(
          item['themeName'],
          style: HbcCommonTextStyle(context, style: TextStyle(
              color: Colors.grey.shade500
          )).body1,
        ),
      );
    } else {
      return Container(
          margin: EdgeInsets.only(
            left: 5.0,
            right: 5.0,
          ),
          child: HBCTheme.buildText(
              text: split,
              fontSize: 14.0,
              color: Colors.grey.shade500
          )
      );
    }
  }

  /// Theme UI
  Widget _buildKeyWordContianer(BuildContext context) {
    List keyWords = <Widget>[];
    for (int i = 0; i < this.theme.length; i++) {
      if (i == this.theme.length - 1) {
        //最后一个
        keyWords.add(_generateTheme(context,this.theme[i]));
      } else {
        keyWords.add(_generateTheme(context,this.theme[i]));
        keyWords.add(_generateTheme(context,null, '|'));
      }
    }
    return Container(
      alignment: Alignment(-1.0, -1.0),
      margin: EdgeInsets.only(top: 10.0, bottom: 3.0),
      child: Row(
        children: keyWords,
      ),
    );
  }

  Widget _buildGuideTips(BuildContext context) {
    return Container(
        alignment: Alignment(-1.0, -1.0),
        child: HBCTheme.buildText(
            text: '预定成功后，可挑选心意司导服务哦!',
            fontSize: 14.0,
            color: Colors.yellow.shade700
        )
    );
  }
}
