### flutter 

## Day1
预览dart基本语法，决定先开干。找一个最具代表性的页面进行试验。从而验证flutter的布局能力和编码能力。决定以https://goods.huangbaoche.com/goods/detail/IC1180330008 [这个页面为模板，搞一发~](https://fr-static.huangbaoche.com/20180501/goods.huangbaoche.com_goods_detail_IC1180330008(HBCC).48cf025ee05e4d5e.png)

## Day2

先搞[头图](https://fr-static.huangbaoche.com/20180501/top.4cf7ca4db94df898.png)。用到的Widgets有Image，Text，Contianer，Statck，ListView。

### Widget
所有的View都要返回Widget

#### Image

可以通过本地文件，网络文件，ImageProvider来初始化。同时可以设置width，height，fit，scale，alignment，repeat等等。

```dart
Widget _buildImage(BuildContext context){
    return new Image.network(
      this.url,
      width: this.width,
      height: this.height
    );  
  }
```
#### Text
可以设置style，textAlign，textDirection,softWrap(断行)，overflow,textScaleFactor,maxLine等。TextStyle 中的height是lineHeight，对应的是多少倍的文字大小

```dart
Widget _buildImageText(BuildContext context){
    return new Text(
      this.imgTitle,
      style : new TextStyle(
        color : Colors.white,
        fontSize : 16.0,
        fontWeight : FontWeight.w400
      )
    );
  }
```
#### Stack
需要children的Widgets多继承自Flex~同时设置定位位置Positioned，Positioned必须搭配Stack使用 A [Positioned] widget **must be** a descendant of a [Stack].. Stack更像是定位后的盒子。

```dart 
/// A widget that positions its children relative to the edges of its box.
Widget build(BuildContext context){
    return new Stack(
      alignment : const Alignment(-1.0, 0.8),
      children: <Widget>[
        _buildImage(context),
        new Positioned(
          bottom:20.0,
          left:0.0,
          child: _buildImageTextContainer(context),
        )
        // _buildImageTextContainer(context)
      ],
    );
  }
```

#### Positioned

```dart

new Positioned(
          bottom:20.0,
          left:0.0,
          child: _buildImageTextContainer(context),
        )
```
#### Colum

 The [Column] widget does not scroll (and in general it is considered an error to have more children in a [Column] than will fit in the available room). If you have a line of widgets and want them to be able to scroll if there is
insufficient room, consider using a [ListView].
Colum 不能滚动，如果children的高度高于可是范围的话会有警告~，如果想滚动，可以使用ListView

```dart
 Widget build(BuildContext context){
    return new Column(
      children: <Widget>[
        _buildTitle(context)
      ],
    );
  }
```

#### ListView

```dart
Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new HbcGoodsTopImage(
            this.data['data']['goodsPictures'][0], 375.0, 375.0, '日本 - 东京'),
        new HbcGoodsTitle(this.data['data']['goodsName']),
      ],
    );
  }
```
### fonts

pubspec.yaml

```yaml
 fonts:
    - family: FZDYSJW
      fonts:
        - asset: fonts/FZDYSJW.ttf

```

### 单位 logical pixels
