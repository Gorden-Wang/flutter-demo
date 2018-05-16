import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


const String IM_IMG = 'https://fr-static.huangbaoche.com/20180305/icon-note.9d3c78e1ccb4dd1b.png';
const String PHONE_IMG = 'https://fr-static.huangbaoche.com/20180305/icon-phone.9c532d6a8f4c450a.png';


class HbcGoodFooter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(top: 10.0, bottom: 20.0,right: 20.0),
      decoration: new BoxDecoration(
          color : Colors.white,
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color : new Color.fromARGB(20, 0, 0, 0),
            offset: Offset(0.0, -3.0),
              blurRadius : 3.0,
          )
        ]
      ),
      child: new Row(
        children: <Widget>[
          new Container(
            width: 90.0,
            height: 30.0,
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(
                      width: 1.0,
                      color: new Color(0xffdbdbdb),
                    )
                )
            ),
            child: new GestureDetector(
              onTap: (){
                _launchURL('sms:18510249866');
              },
              child: new Image.network(
                IM_IMG,
              ),
            )
          ),
          new GestureDetector(
            onTap: (){
              _launchURL('tel:110');
            },
            child: new Container(
              width: 90.0,
              height: 30.0,
              child: new Image.network(
                PHONE_IMG,
              ),
            ),
          ),
          new Expanded(
            child: new RaisedButton(
              color: new Color(0xffffce00),
              textColor: Colors.white,
              splashColor: new Color(0xffffc000),
              onPressed: () =>
              {
              },
              child: new Container(
                child: new Row(
                  children: <Widget>[
                    new Text(
                        '￥486',
                      style: new TextStyle(
                        fontSize: 20.0
                      ),
                    ),
                    new Expanded(
                      child: new Container(
                        margin: new EdgeInsets.only(left: 5.0,top : 4.0),
                        child: new Text(
                          '起/人 (选择日期)',
                          style: new TextStyle(
                              fontSize: 10.0
                          ),
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<Null> _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


}
