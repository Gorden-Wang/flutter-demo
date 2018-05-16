import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// Build A Circle Image with url , with default width and height 30.0
///

class HbcCircleImage extends StatelessWidget {

  final Key key;
  final String url;
  final double width, height;
  final Color bgColor;


  HbcCircleImage(@required this.url, {
    this.key,
    this.width = 30.0,
    this.height = 30.0,
    this.bgColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 30.0,
      height: 30.0,
      decoration: new BoxDecoration(
          color: bgColor ?? Colors.grey.shade300,
          shape: BoxShape.circle,
          image: new DecorationImage(
              image: new CachedNetworkImageProvider(url)
          )
      ),
    );
  }
}

/// build a CachedNetworkImage
class HbcCommonImage extends StatelessWidget {
  final Key key;
  final String url;
  final double width, height;
  final String placeHolderImg;
  final BoxFit fit;
  final double aspectRatio;

  HbcCommonImage(@required this.url, {
    this.key,
    this.width,
    this.height,
    this.placeHolderImg = 'assets/imgs/hold.png',
    this.fit = BoxFit.cover,
    this.aspectRatio,
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    if(aspectRatio == null){
      return _buildImage(context);
    }
    return new AspectRatio(
      aspectRatio: aspectRatio,
      child: _buildImage(context),
    );
  }

  Widget _buildImage(BuildContext context){
    return new CachedNetworkImage(
      placeholder: new DecoratedBox(
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage(placeHolderImg),
              fit: BoxFit.cover
          ),
        ),
      ),
      imageUrl: url,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: fit,
    );
  }
}
