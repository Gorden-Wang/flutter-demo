import 'package:flutter/material.dart';
import 'package:myapp/src/components/lib/image.dart';
import 'package:myapp/src/components/lib/text.dart';

class HbcGoodsTopContainer extends StatelessWidget {

  final String url, imgTitle;

  HbcGoodsTopContainer({
    Key key,
    @required this.url,
    @required this.imgTitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HbcCommonImage(
      this.url,
      aspectRatio: 1.0,
      isStack: true,
      children: <Widget>[
        Positioned(
          bottom: 20.0,
          left: 0.0,
          child: _buildImageTextContainer(context),
        ),
      ],
    );
  }

  Widget _buildImageTextContainer(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.only(
              topLeft: Radius.zero,
              topRight: Radius.circular(21.0),
              bottomRight: Radius.circular(21.0),
              bottomLeft: Radius.zero
          )
      ),
      padding: EdgeInsets.only(
          left: 15.0,
          top: 3.0,
          right: 10.0,
          bottom: 3.0
      ),
      child: _buildImageText(context),
    );
  }

  Text _buildImageText(BuildContext context) {
    return Text(
      imgTitle,
      style: HbcCommonTextStyle.withWhiteColor(context).body2,
    );
  }
}
