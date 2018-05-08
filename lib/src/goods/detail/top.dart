import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HbcGoodsTopImage extends StatelessWidget {
  // url : ImageUrl
  // width,height : discrib the size of the Images

  final String url, imgTitle;
  final double width, height;

  HbcGoodsTopImage(this.url, this.width, this.height, this.imgTitle);

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: const Alignment(-1.0, 0.8),
      children: <Widget>[
        _buildImage(context),
        new Positioned(
          bottom: 20.0,
          left: 0.0,
          child: _buildImageTextContainer(context),
        )
        // _buildImageTextContainer(context)
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    final double width = MediaQuery
        .of(context)
        .size
        .width;
//    return new SizedBox.fromSize(
//      size: new Size(width,width),
//      child: new Image.network(
//        this.url,
//      width: width,
//      height: width,
//        fit: BoxFit.cover,
//      ),
//    );


    return new SizedBox.fromSize(
      size: new Size(width, width),
      child: new CachedNetworkImage(
        imageUrl: this.url,
        width: width,
        height: width,
        fit: BoxFit.cover,
      ),
    );
//    return new SizedBox.fromSize(
//      size: new Size(width,width),
//      child: new FadeInImage(
//        placeholder: kTransparentImage,
//        image: new CachedNetworkImage(
//          imageUrl:
//          this.url
//        ),
//        width: width,
//        height: width,
//      )
//    );


//    return new Image.network(
//      this.url,
////      width: this.width,
////      height: this.height,
//      fit: BoxFit.cover,
//    );
  }

  Widget _buildImageTextContainer(BuildContext context) {
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

  Widget _buildImageText(BuildContext context) {
    return new Text(
        this.imgTitle,
        style: new TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w700
        )
    );
  }
}
