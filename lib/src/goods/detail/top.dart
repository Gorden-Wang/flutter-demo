import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../util/HBCTheme.dart';

class HbcGoodsTopImage extends StatelessWidget {

  final String url, imgTitle;
  final double width, height;

  HbcGoodsTopImage({
    Key key,
    @required this.url,
    this.width,
    this.height,
    @required this.imgTitle
  }) : super(key:key){
    print('top init');
  }

  @override
  Widget build(BuildContext context) {
    print('top widgets');
    return new Stack(
      alignment: const Alignment(-1.0, 0.8),
      children: <Widget>[
        _buildImage(context),
        new Positioned(
          bottom: 20.0,
          left: 0.0,
          child: _buildImageTextContainer(context),
        )
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    final double width = MediaQuery
        .of(context)
        .size
        .width;

    return new SizedBox.fromSize(
      size: new Size(width, width),
      child: new CachedNetworkImage(
        placeholder: new DecoratedBox(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage('assets/imgs/hold.png'),
                fit: BoxFit.cover
            ),
          ),
        ),
        imageUrl: this.url,
        width: width,
        height: width,
        fit: BoxFit.cover,
      ),
    );
  }

  Container _buildImageTextContainer(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
          color: Colors.black54,
          borderRadius: new BorderRadius.only(
              topLeft: Radius.zero,
              topRight: Radius.circular(21.0),
              bottomRight: Radius.circular(21.0),
              bottomLeft: Radius.zero
          )
      ),
      padding: new EdgeInsets.only(
          left: 20.0,
          top: 3.0,
          right: 10.0,
          bottom: 3.0
      ),
      child: _buildImageText(context),
    );
  }

  Text _buildImageText(BuildContext context) {
    return HBCTheme.buildText(
      text: this.imgTitle,
      fontSize: 16.0,
      color: Colors.white,
      fontWeight: FontWeight.w700
    );
  }
}
