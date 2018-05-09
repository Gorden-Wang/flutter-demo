import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/util/HBCTheme.dart';

const Map GUIDE = {
  "data": {
    "filterGuideCount": 6,
    "listData": [
      {
        "avatar": "https://hbcdn.huangbaoche.com/guideavatar/60/8.png",
        "carGuestNum": 5,
        "chatAbility": 1,
        "cityId": 217,
        "cityName": "东京",
        "commentNum": 162,
        "completeOrderNum": 468,
        "gender": 1,
        "genderName": "男",
        "guideCover": "https://hbcdn.huangbaoche.com/guidecover/60/8.jpg",
        "guideId": "200100008748",
        "guideLevel": 1,
        "guideLevelName": "A级",
        "guideName": "张先生",
        "guideNo": "A18004",
        "guideStatus": 4,
        "homeDesc":
        "10年日企工作经验，20万公里霓虹旅行经验，精通中日英语，稳重热情颜值高-_-||熟悉日本文化社会历史，为您讲解美食背景，给您安排张驰有度的行程。真诚友善的阿德，是您深度私密的日本trip的可信任挚友",
        "imTargetId": "g200100008748",
        "isQuality": 0,
        "langString": "英语 上海话 中文",
        "replayFrequency": "",
        "serviceDaily": 1,
        "serviceJsc": 1,
        "serviceStar": 4.85,
        "skillLabelNames": ["专业翻译", "置业投资", "移民咨询", "美食家", "摄影达人"]
      },
      {
        "avatar": "https://hbcdn.huangbaoche.com/guideavatar/60/7.png",
        "carGuestNum": 6,
        "chatAbility": 0,
        "cityId": 217,
        "cityName": "东京",
        "commentNum": 69,
        "completeOrderNum": 145,
        "gender": 1,
        "genderName": "男",
        "guideCover": "https://hbcdn.huangbaoche.com/guidecover/60/7.jpg",
        "guideId": "214114782137",
        "guideLevel": 1,
        "guideLevelName": "A级",
        "guideName": "杨先生",
        "guideNo": "A21023",
        "guideStatus": 0,
        "homeDesc":
        "来日本16年对日本的风土人情非常了解、可能是在日本太久的原因、见到中国客人有一种由衷的亲切感，喜欢日本更喜欢我的母国中国、我会用对待家人一样的热情来为您提供专业的服务，让您感觉不到身处异国他乡的无助感、日本欢迎您。",
        "imTargetId": "g214114782137",
        "isQuality": 0,
        "langString": "中文",
        "replayFrequency": "",
        "serviceDaily": 1,
        "serviceJsc": 1,
        "serviceStar": 5,
        "skillLabelNames": ["美食家", "行程规划", "精通人文艺术", "历史讲解", "擅长照看儿童"]
      },
      {
        "avatar": "https://hbcdn.huangbaoche.com/guideavatar/60/6.png",
        "carGuestNum": 4,
        "chatAbility": 0,
        "cityId": 217,
        "cityName": "东京",
        "commentNum": 25,
        "completeOrderNum": 111,
        "gender": 1,
        "genderName": "男",
        "guideCover": "https://hbcdn.huangbaoche.com/guidecover/60/6.jpg",
        "guideId": "210325471526",
        "guideLevel": 2,
        "guideLevelName": "B级",
        "guideName": "沈先生",
        "guideNo": "A25681",
        "guideStatus": 0,
        "homeDesc": "来日十年 喜欢音乐 自驾",
        "imTargetId": "g210325471526",
        "isQuality": 0,
        "langString": "中文",
        "replayFrequency": "",
        "serviceDaily": 1,
        "serviceJsc": 1,
        "serviceStar": 5,
        "skillLabelNames": ["行程规划"]
      },
      {
        "avatar": "https://hbcdn.huangbaoche.com/guideavatar/60/4.png",
        "carGuestNum": 9,
        "chatAbility": 0,
        "cityId": 217,
        "cityName": "东京",
        "commentNum": 41,
        "completeOrderNum": 102,
        "gender": 1,
        "genderName": "男",
        "guideCover": "https://hbcdn.huangbaoche.com/guidecover/60/4.jpg",
        "guideId": "200100000354",
        "guideLevel": 1,
        "guideLevelName": "A级",
        "guideName": "孙先生",
        "guideNo": "A80450",
        "guideStatus": 0,
        "homeDesc":
        "80后的东北人，高中毕业后来东京跟家里人团聚，语言学校，大学，现在已经就职，来日本以后发现和曾经自己想象的有很大的差别，这里的人很谦逊、不愿意给别人带来麻烦，这里的人很拘谨，不愿意轻易向别人敞开心扉，这里的人很敬业，即使枯燥乏味的工作岗位也会一丝不苟的去完成，这里的人又很奔放，尤其是喝过酒以后，种种看似完全各异的性格组成了日本这一个国家，这个国家与我们有千丝万缕的联系和隔阂，所以更值得您亲身来体验",
        "imTargetId": "g200100000354",
        "isQuality": 0,
        "langString": "日语 中文",
        "replayFrequency": "",
        "serviceDaily": 1,
        "serviceJsc": 1,
        "serviceStar": 5,
        "skillLabelNames": ["摄影达人", "精通建筑设计", "夜店达人", "美食家", "置业投资"]
      },
      {
        "avatar": "https://hbcdn.huangbaoche.com/guideavatar/60/4.png",
        "carGuestNum": 6,
        "chatAbility": 0,
        "cityId": 217,
        "cityName": "东京",
        "commentNum": 663,
        "completeOrderNum": 1847,
        "gender": 1,
        "genderName": "男",
        "guideCover": "https://hbcdn.huangbaoche.com/guidecover/60/4.jpg",
        "guideId": "200100008344",
        "guideLevel": 1,
        "guideLevelName": "A级",
        "guideName": "塞先生",
        "guideNo": "A35608",
        "guideStatus": 0,
        "homeDesc":
        "喜欢旅游、喜欢美食、热爱生活的小伙子^_^ 让初来乍到的您体验不一样的本土风情 像老朋友一样一起用“心”旅行Y(^_^)Y",
        "imTargetId": "g200100008344",
        "isQuality": 0,
        "langString": "英语 日语 中文",
        "replayFrequency": "",
        "serviceDaily": 1,
        "serviceJsc": 1,
        "serviceStar": 4.98,
        "skillLabelNames": ["夜店达人", "滑雪爱好者", "户外达人"]
      },
      {
        "avatar": "https://hbcdn.huangbaoche.com/guideavatar/60/6.png",
        "carGuestNum": 7,
        "chatAbility": 0,
        "cityId": 217,
        "cityName": "东京",
        "commentNum": 262,
        "completeOrderNum": 519,
        "gender": 1,
        "genderName": "男",
        "guideCover": "https://hbcdn.huangbaoche.com/guidecover/60/6.jpg",
        "guideId": "200100008086",
        "guideLevel": 1,
        "guideLevelName": "A级",
        "guideName": "李先生",
        "guideNo": "A65127",
        "guideStatus": 0,
        "homeDesc": "因为生活，所以热爱；因为热爱，所以收获。",
        "imTargetId": "g200100008086",
        "isQuality": 0,
        "langString": "日语 中文",
        "replayFrequency": "",
        "serviceDaily": 1,
        "serviceJsc": 1,
        "serviceStar": 4.96,
        "skillLabelNames": ["擅长照看儿童", "夜店达人", "美食家", "品酒爱好者", "明星团经验"]
      }
    ],
    "listCount": 30
  },
  "status": 200
};
Map GUIDE_DATA =  GUIDE['data'];

class HbcGoodsGuide extends StatelessWidget {
  final int associateGuideAmount;

  HbcGoodsGuide(this.associateGuideAmount);

  @override
  Widget build(BuildContext context) {
    final guildList = GUIDE_DATA['listData'];
    return new Container(
        child: new Column(
          children: <Widget>[
            _getGuideTips(context),
            new _HbcGuideSwiper(guildList)
          ],
        ));
  }

  Widget _getGuideTips(BuildContext context) {
    return new Container(
        alignment: new Alignment(-1.0, -1.0),
        child: HBCTheme.buildText(
          text: '可由${this.associateGuideAmount}位当地人带你体验',
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        )
    );
  }
}

class _HbcGuideSwiper extends StatefulWidget {
  final List guildList;

  _HbcGuideSwiper(this.guildList);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HbcGuildSwiperState();
  }
}

class _HbcGuildSwiperState extends State<_HbcGuideSwiper> {
  // final List guildList;
  // _HbcGuildSwiperState(this.guildList);
  @override
  Widget build(BuildContext context) {
    // @TODO add Swiper
    return new Container(
      alignment: Alignment.topLeft,
      margin: new EdgeInsetsDirectional.only(top: 15.0),
      padding: new EdgeInsetsDirectional.only(bottom: 25.0),
      decoration: new BoxDecoration(
          border: new Border(
              bottom: new BorderSide(color: new Color(0xffdbdbdb),
                  width: 1.0,
                  style: BorderStyle.solid)
          )
      ),
      child: new SizedBox.fromSize(
        size: new Size(MediaQuery
            .of(context)
            .size
            .width, 140.0),
        child: new PageView(
          // scrollDirection : Axis.horizontal,
          physics: new AlwaysScrollableScrollPhysics(),
          controller: new PageController(
            viewportFraction: 1.0,
            keepPage: true,
          ),
          children: _getGuideList(context),
        ),
      ),
    );
  }

  List<Widget> _getGuideList(BuildContext context) {
    List guildList = <Widget>[];
    widget.guildList.forEach((item) {
      guildList.add(_getGuideItem(context, item));
    });
    return guildList;
  }

  Widget _getGuideItem(BuildContext context, Map guideItem) {
    final guideName = guideItem['guideName'];
    final guideCover = guideItem['guideCover'];
    return new Container(
      width: 245.0,
      height: 140.0,
      alignment: Alignment.topLeft,
      child: new Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          new CachedNetworkImage(
            placeholder: new DecoratedBox(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage('assets/imgs/hold.png'),
                    fit: BoxFit.cover
                ),
              ),
            ),
            imageUrl: guideCover,
            width: MediaQuery
                .of(context)
                .size
                .width,
            fit: BoxFit.cover,
          ),
          new Positioned(
              bottom: 10.0,
              left: 10.0,
              child: new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      HBCTheme.buildText(
                        text: guideName,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                      ),
                      HBCTheme.buildText(
                          text: '下单支付后可聊天',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
