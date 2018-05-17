import 'package:flutter/material.dart';

class HbcGoodOrderTipsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle,
          _buildInnerRow('费用包含', '司导服务、用车'),
          _buildInnerRow('费用不含', '门票、餐饮、住宿'),
          _buildInnerRow(
              '超时费用', '如果超出当天行程安排的服务时长，需要额外支付给司导超时费用：¥200/小时（不满1小时按1小时计算）'),
          _getBuildInnerRules,
          _buildInnerRow('费用说明', '如您需要司导陪同进入景区，需负担司导门票费用。',true),
        ],
      ),
    );
  }

  Container get _getBuildInnerRules {
    return Container(
//      margin: EdgeInsets.only(bottom: 20.0),
      child : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin : EdgeInsets.only(right : 15.0),
            child: Text(
              '退订规则',
              style: TextStyle(
                color: Color(0xff7f7f7f),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _getBuildRuleText('预订成功', 1),
                _getBuildRuleText('可免费取消订单', 0),

                _getBuildRuleText('服务前7天', 1),
                _getBuildRuleText('取消订单，扣取50%订单金额', 0),

                _getBuildRuleText('服务前3天', 1),
                _getBuildRuleText('取消订单，扣取80%订单金额', 0),

                _getBuildRuleText('服务前24小时', 1),
                _getBuildRuleText('取消订单，扣取100%订单金额', 0),

                _getBuildRuleText('服务开始', 1),
                _getBuildRuleText('取消订单，扣取100%订单金额', 0),

                _getBuildRuleText('服务结束', 1),

              ],
            ),
          )
        ],
      )
    );
//    return
  }

  Container _getBuildRuleText(String str, int color) {
    int colorhax;
    if (color == 0) { //dark
      colorhax = 0xff151515;
    } else {
      colorhax = 0xff7f7f7f;
    }
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Text(
        str,
        style: TextStyle(
            color: Color(colorhax),
            fontSize: 13.0
        ),
      ),
    );
  }

  Container _buildInnerRow(String title, String inner,[bool isShow]) {
    return Container(
      padding: EdgeInsets.only(top: isShow == true ? 10.0 : 0.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xff00ccc),
            width: isShow==true ? 1.0 : 0.0,
            style: BorderStyle.solid

          )
        )
      ),
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 15.0),
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xff7f7f7f),
              ),
            ),
          ),

          Expanded(
            child: Text(
              inner,
              style: TextStyle(
                  color: Color(0xff151515)
              ),
            ),
          )
        ],
      ),
    );
  }

  Container get _buildTitle {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: Text(
        '预定必读',
        style: TextStyle(
            color: Color(0xff151515),
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            fontFamily: 'PingFang SC'
        ),
      ),
    );
  }


}
