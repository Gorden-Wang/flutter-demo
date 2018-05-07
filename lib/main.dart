import 'package:flutter/material.dart';
import 'src/goods/detail/index.dart';
import 'src/goods/detail/footer.dart';
void main() => runApp(new Center(child: new HbcGoodsDetail()));
const Map DATA = {
  "data": {
    "aliasName": "",
    "associateGuideAmount": 3,
    "boardingAddress": "酒店门口/指定地点",
    "boardingTimeStart": "09:30",
    "carTypeDesc": "舒适、豪华",
    "carTypeNum": 2,
    "changeRules": [
      {"refundRate": 100, "servicetimeEnd": 168},
      {"refundRate": 50, "servicetimeEnd": 72, "servicetimeStart": 168},
      {"refundRate": 20, "servicetimeEnd": 24, "servicetimeStart": 72},
      {"refundRate": 0, "servicetimeEnd": 0, "servicetimeStart": 24}
    ],
    "commentCount": 0,
    "comments": [],
    "costDescription": "如您需要司导陪同进入景区，需负担司导门票费用。",
    "couponDesc": "",
    "currency": "JPY",
    "daysCount": 4,
    "depCityId": 217,
    "depCityName": "东京",
    "depCountryId": 60,
    "depCountryName": "日本",
    "expenseDesc": "司导服务、用车",
    "expenseExtDesc": "门票、餐饮、住宿",
    "goodsClass": 1,
    "goodsDesc": "<p>\n\t<br />\n</p>\n<p>\n\t<br />\n</p>",
    "goodsName": "亲子趣时光｜东京亲子中文4日包车游，东京往返（建议6～12岁）",
    "goodsNo": "LT1180880039",
    "goodsPictures": [
      "https://hbcdn.huangbaoche.com/fr-hd/DQ94mg2Plg0!m",
      "https://hbcdn.huangbaoche.com/fr-hd/EzwqThidbg0!m",
      "https://hbcdn.huangbaoche.com/fr-hd/E5qR0sZ-Sg0!m",
      "https://hbcdn.huangbaoche.com/fr-hd/DY8MZjP1tQ0!m",
      "https://hbcdn.huangbaoche.com/fr-hd/HpSYmv4_ig0!m"
    ],
    "goodsThemes": [
      {"themeId": 4, "themeName": "亲子游"},
      {"themeId": 10, "themeName": "主题乐园"},
      {"themeId": 14, "themeName": "城市风光"},
      {"themeId": 17, "themeName": "国家公园"}
    ],
    "goodsType": 7,
    "guideAmount": 1095,
    "guideId": "",
    "guidePrice": 6376,
    "guidePriceLocal": 109412,
    "isAssociateGuide": 1,
    "maxCapOfPerson": 6,
    "overTimePerPrice": 200,
    "perPrice": 1435,
    "poiCount": 14,
    "publishStatus": 1,
    "recommendedReason": {"guideNo": "", "guideRecommendedReason": ""},
    "routeCityDesc": "东京>富士河口湖>东京",
    "routes": [
      {
        "dateNum": "1",
        "endCityId": 217,
        "endCityName": "东京",
        "poaList": [
          {
            "poaClass": 4,
            "poaDesc": "专属导游接您从酒店出发，开启一天行程。",
            "poaName": "东京市区酒店出发",
            "startTime": "09:30",
            "usingTime": "0.5"
          },
          {
            "poaClass": 3,
            "poaDesc": "江户东京博物馆展现出东京每个时期的生活风貌，有实物比例的复制品，也有早期的生活用品，包罗万象，有趣异常。",
            "poaName": "展现东京个时代风貌的江户东京博物馆",
            "pois": [{
              "poiCityId": "217",
              "poiCityName": "东京",
              "poiId": "490750",
              "poiLatitude": 35.676762,
              "poiLongitude": 139.804916,
              "poiName": "江户东京博物馆",
              "poiNameEn": "Edo-Tokyo Museum",
              "poiPic": "https://hbcdn.huangbaoche.com/fr-us/G-QTAXxAVg0!m",
              "poiPicList": [
                "https://hbcdn.huangbaoche.com/fr-us/G-QTAXxAVg0!m",
                "https://hbcdn.huangbaoche.com/poi/1/1/4AD7E5A090F4F4A4CEDF37ED162C98BF_2048X1536.jpg!m",
                "https://hbcdn.huangbaoche.com/poi/1/1/4C46DE4AC54E524CC79EB362829999A4_2048X1356.jpg!m",
                "https://hbcdn.huangbaoche.com/poi/1/1/94839D27C1A31D376B2C1170F30BD7A5_2048X1356.jpg!m",
                "https://hbcdn.huangbaoche.com/poi/1/1/B64267A15C4CA766366794620CDECEBB_2048X1356.jpg!m",
                "https://hbcdn.huangbaoche.com/poi/1/1/D19D37A53BDE6868298E01BE41E420D5_2048X1356.jpg!m",
                "https://hbcdn.huangbaoche.com/poi/1/1/83A9158AE120958A4C29085D95BA1384_1600X1063.jpg!m",
                "https://hbcdn.huangbaoche.com/poi/1/1/81A631BA0FBB8712D7E9C08F283019BF_1600X1063.jpg!m",
                "https://hbcdn.huangbaoche.com/poi/1/1/952E144ABAB810BA3EC951BBBEDB4370_1600X1063.jpg!m",
                "https://hbcdn.huangbaoche.com/poi/1/1/EB3EE2399ACAEB2D46F21348BD36345B_1600X1200.jpg!m",
                "https://hbcdn.huangbaoche.com/poi/1/1/67B16A7AABB77BBCECD4F5FFDA52A734_2048X1356.jpg!m"
              ],
              "poiType": 3
            }
            ],
            "startTime": "10:00",
            "usingTime": "2.5"
          },
          {
            "poaClass": 1,
            "poaDesc": "自理，可咨询导游推荐餐厅。",
            "poaName": "短暂休息，建议您安排午餐",
            "startTime": "12:30",
            "usingTime": "1"
          },
          {
            "poaClass": 4,
            "poaName": "乘坐导游专车前往下一站——科学未来馆",
            "startTime": "13:30",
            "usingTime": "0.5"
          },
          {
            "poaClass": 3,
            "poaDesc": "日本科学未来馆是日本最好的科学类博物馆。理念是与大家共同分享21世纪“新知”，面向所有人开放。 在这里可以有不同的有趣体验，比如进入真实的潜水艇中，或者自己动手制作机器人。",
            "poaName": "科学未来馆，一座汇集日本的智慧与技术、令人大开眼界的设施。",
            "pois": [{
              "poiCityId": "217",
              "poiCityName": "东京",
              "poiId": "490863",
              "poiLatitude": 35.619279450706145,
              "poiLongitude": 139.77673530578613,
              "poiName": "科学未来馆",
              "poiNameEn": "Miraikan",
              "poiPic": "https://hbcdn.huangbaoche.com/poi/20160715/poi_manual/201607151718435807.png!m",
              "poiPicList": [
                "https://hbcdn.huangbaoche.com/poi/20160715/poi_manual/201607151718435807.png!m",
                "https://hbcdn.huangbaoche.com/poi/20160715/poi_manual/201607151718558818.png!m"
              ],
              "poiType": 3
            }
            ],
            "startTime": "14:00",
            "usingTime": "1.5"
          },
          {
            "poaClass": 3,
            "poaDesc": "大人可以在此购物，孩子也可以在这里找到游玩的地方，大人孩子都可以在此找到兴趣所在。",
            "poaName": "游览奇趣多彩城",
            "pois": [{
              "poiCityId": "217",
              "poiCityName": "东京",
              "poiId": "527846",
              "poiLatitude": 35.625183,
              "poiLongitude": 139.780441,
              "poiName": "多彩城",
              "poiNameEn": "",
              "poiPic": "https://hbcdn.huangbaoche.com/fr-hd/FZMQITpdPA0!m",
              "poiPicList": ["https://hbcdn.huangbaoche.com/fr-hd/FZMQITpdPA0!m"
              ],
              "poiType": 2
            }
            ],
            "startTime": "15:30",
            "usingTime": "1"
          },
          {
            "poaClass": 3,
            "poaDesc": "商品折扣令人瞠目结舌，最大折扣到70％，约170间商店及食店，商品琳琅满目。",
            "poaName": "台场维纳斯奥莱，血拼古典购物中心",
            "pois": [{
              "poiCityId": "217",
              "poiCityName": "东京",
              "poiId": "526055",
              "poiLatitude": 35.624873,
              "poiLongitude": 139.779937,
              "poiName": "台场维纳斯城堡奥特莱斯",
              "poiNameEn": "",
              "poiPic": "https://hbcdn.huangbaoche.com/fr-hd/FpYglESfOA0!m",
              "poiPicList": [
                "https://hbcdn.huangbaoche.com/fr-hd/FpYglESfOA0!m",
                "https://hbcdn.huangbaoche.com/poi/20160713/poi_manual/201607131917238295.png!m",
                "https://hbcdn.huangbaoche.com/poi/20160713/poi_manual/201607131917339133.png!m"
              ],
              "poiType": 2
            }
            ],
            "startTime": "16:30",
            "usingTime": "2"
          },
          {
            "poaClass": 4,
            "poaDesc": "自理，请提前预定酒店，或咨询导游推荐酒店。",
            "poaName": "结束一天精彩旅程，导游送您返回东京市区酒店",
            "startTime": "18:30",
            "usingTime": "0.5"
          }
        ],
        "routePoiCount": 4,
        "routePoiDesc": "江户东京博物馆-科学未来馆-多彩城-台场维纳斯城堡奥特莱斯",
        "routeScope": 1,
        "serviceHours": 9.5,
        "serviceKms": 45,
        "startCityId": 217,
        "startCityName": "东京",
        "subStarCityLocation": "35.708853,139.732661"
      },
      {
        "dateNum": "2",
        "endCityId": 4084,
        "endCityName": "富士河口湖",
        "poaList": [
          {
            "poaClass": 4,
            "poaDesc": "专属导游接您从酒店出发，开启一天行程。",
            "poaName": "东京市区酒店出发",
            "startTime": "09:00",
            "usingTime": "2"
          },
          {
            "poaClass": 3,
            "poaDesc": "箱根海盜船有3种，以3只古代战船为模板，坐在船上，尽享被芦之湖的樱花占据全部视线的极致享受。还可以远眺水上鸟居富士山，美丽异常。*乘船线路为元箱根港－桃源台港。乘船费用自理，含午餐时间，午餐自理*",
            "poaName": "乘海盗船尽享被樱花包围的芦之湖景色",
            "pois": [{
              "poiCityId": "3351",
              "poiCityName": "箱根",
              "poiId": "529300",
              "poiLatitude": 35.2339255247591,
              "poiLongitude": 138.9980665134949,
              "poiName": "芦之湖海盗船",
              "poiNameEn": "",
              "poiPic": "https://hbcdn.huangbaoche.com/fr-hd/C4fklNZcFA0!m",
              "poiPicList": ["https://hbcdn.huangbaoche.com/fr-hd/C4fklNZcFA0!m"
              ],
              "poiType": 3
            }
            ],
            "startTime": "11:00",
            "usingTime": "1.5"
          },
          {
            "poaClass": 4,
            "poaName": "乘坐导游专车前往下一站——雕刻之森美术馆",
            "startTime": "12:30",
            "usingTime": "0.5"
          },
          {
            "poaClass": 3,
            "poaDesc": "箱根雕刻森林美术馆是以室外雕刻为主的美术馆，雕塑公园让立体作品良好地融入环境，仿佛站在作品与大自然组成的森林当中。",
            "poaName": "与大自然和谐共处的雕刻之森美术馆",
            "pois": [{
              "poiCityId": "3351",
              "poiCityName": "箱根",
              "poiId": "506019",
              "poiLatitude": 35.244724,
              "poiLongitude": 139.05152899999996,
              "poiName": "雕刻之森美术馆",
              "poiNameEn": "Hakone Open-Air Museum",
              "poiPic": "https://hbcdn.huangbaoche.com/fr-hd/DTz2yALKvg0!m",
              "poiPicList": [
                "https://hbcdn.huangbaoche.com/fr-hd/DTz2yALKvg0!m",
                "https://hbcdn.huangbaoche.com/fr-hd/D-onkyBfIA0!m",
                "https://hbcdn.huangbaoche.com/fr-hd/EGHVVYXwPg0!m"
              ],
              "poiType": 3
            }
            ],
            "startTime": "13:00",
            "usingTime": "2"
          },
          {
            "poaClass": 4,
            "poaName": "乘坐导游专车前往下一站——小王子博物馆",
            "startTime": "15:00",
            "usingTime": "0.5"
          },
          {
            "poaClass": 3,
            "poaDesc": "小王子迷不可错过的景点，仿佛行走在法国街道上，置身于故事中。",
            "poaName": "参观小王子博物馆，置身于温馨的小王子世界中",
            "pois": [{
              "poiCityId": "3351",
              "poiCityName": "箱根",
              "poiId": "506032",
              "poiLatitude": 35.266553,
              "poiLongitude": 139.01328,
              "poiName": "箱根小王子博物馆",
              "poiNameEn": "The Museum of The Little Prince in Hakone",
              "poiPic": "https://hbcdn.huangbaoche.com/poi/137/137/C653FC3D4AF0680B6AE3C9823AF7A9DA_1599X1071.jpg!m",
              "poiPicList": [
                "https://hbcdn.huangbaoche.com/poi/137/137/C653FC3D4AF0680B6AE3C9823AF7A9DA_1599X1071.jpg!m",
                "https://hbcdn.huangbaoche.com/poi/137/137/9A66C5D5A88E8B923C2A813148805734_900X800.jpg!m",
                "https://hbcdn.huangbaoche.com/poi/137/137/8AE3DC9BBF433A40D8BF50DDF3048C4F_900X800.jpg!m",
                "https://hbcdn.huangbaoche.com/poi/137/137/6F65614BEF2D92038F39A653B355E7F1_900X800.jpg!m"
              ],
              "poiType": 3
            }
            ],
            "startTime": "15:30",
            "usingTime": "1"
          },
          {
            "poaClass": 4,
            "poaName": "乘坐导游专车前往——御殿场奥特莱斯",
            "startTime": "16:30",
            "usingTime": "0.5"
          },
          {
            "poaClass": 2,
            "poaDesc": "御殿场奥特莱斯是日本最大的名牌折扣店，坐落于风景优美的自然环境中，可眺望富士山。这里还有哈根达斯的折扣店哦。",
            "poaName": "走进御殿场奥特莱斯，在日本尽享全球折扣",
            "pois": [{
              "poiCityId": "4102",
              "poiCityName": "御殿场市",
              "poiId": "401382",
              "poiLatitude": 35.30732123018899,
              "poiLongitude": 138.9672104923095,
              "poiName": "御殿场奥特莱斯",
              "poiNameEn": "Gotemba Premium Outlets",
              "poiPic": "https://hbcdn.huangbaoche.com/poi/20161117/poi_manual/201611171454552948.jpg!m",
              "poiPicList": [
                "https://hbcdn.huangbaoche.com/poi/20161117/poi_manual/201611171454552948.jpg!m"
              ],
              "poiType": 2
            }
            ],
            "startTime": "17:00",
            "usingTime": "2"
          },
          {
            "poaClass": 4,
            "poaDesc": "自理，请提前预定酒店或由导游代订。",
            "poaName": "结束一天精彩旅程，导游送您返回河口湖酒店",
            "startTime": "19:00",
            "usingTime": "1"
          }
        ],
        "routePoiCount": 4,
        "routePoiDesc": "芦之湖海盗船-雕刻之森美术馆-箱根小王子博物馆-御殿场奥特莱斯",
        "routeScope": 3,
        "serviceHours": 11,
        "serviceKms": 190,
        "startCityId": 217,
        "startCityName": "东京",
        "subStarCityLocation": "35.708853,139.732661"
      },
      {
        "dateNum": "3",
        "endCityId": 217,
        "endCityName": "东京",
        "poaList": [
          {
            "poaClass": 4,
            "poaDesc": "专属导游接您从酒店出发，开启一天精彩行程",
            "poaName": "河口湖酒店出发",
            "startTime": "09:30",
            "usingTime": "0.5"
          },
          {
            "poaClass": 3,
            "poaDesc": "观赏富士山全景的绝佳位置，景色尤其壮观。在浅间神社五重塔后方拍摄富士山是最经典的角度。",
            "poaName": "漫步新仓富士浅间神社，远眺富士山美景",
            "pois": [{
              "poiCityId": "3450",
              "poiCityName": "富士山",
              "poiId": "529233",
              "poiLatitude": 35.50033425735988,
              "poiLongitude": 138.80016446113586,
              "poiName": "新倉富士浅間神社",
              "poiNameEn": "",
              "poiPic": "https://hbcdn.huangbaoche.com/fr-hd/EHuVU0lv2Q0!m",
              "poiPicList": ["https://hbcdn.huangbaoche.com/fr-hd/EHuVU0lv2Q0!m"
              ],
              "poiType": 3
            }
            ],
            "startTime": "10:00",
            "usingTime": "2"
          },
          {
            "poaClass": 4,
            "poaName": "乘坐导游专车前往下一站——河口湖",
            "startTime": "12:00",
            "usingTime": "0.5"
          },
          {
            "poaClass": 3,
            "poaDesc": "作为富士山的拍摄点而闻名，在可以这里拍摄到湖水中的富士山的倒影。在八音盒之森美术馆里展示着来自世界各地的珍贵八音盒，样式各异，好玩有趣。*含午餐时间，午餐自理*",
            "poaName": "游览河口湖，富士五湖之一，参观趣味八音盒之森",
            "pois": [
              {
                "poiCityId": "1008",
                "poiCityName": "山梨县",
                "poiId": "490758",
                "poiLatitude": 35.517095,
                "poiLongitude": 138.751779,
                "poiName": "河口湖",
                "poiNameEn": "Lake Kawaguchi",
                "poiPic": "https://hbcdn.huangbaoche.com/poi/20161117/poi_manual/201611171200041409.jpg!m",
                "poiPicList": [
                  "https://hbcdn.huangbaoche.com/poi/20161117/poi_manual/201611171200041409.jpg!m"
                ],
                "poiType": 3
              },
              {
                "poiCityId": "4084",
                "poiCityName": "富士河口湖",
                "poiId": "404875",
                "poiLatitude": 35.522423,
                "poiLongitude": 138.768661,
                "poiName": "河口湖八音盒之森",
                "poiNameEn": "河口湖オルゴ-ルの森",
                "poiPic": "https://hbcdn.huangbaoche.com/poi/181/181/D3C036E3FC5EAEBC804896EBCA7262F5_980X576.jpg!m",
                "poiPicList": [
                  "https://hbcdn.huangbaoche.com/poi/181/181/D3C036E3FC5EAEBC804896EBCA7262F5_980X576.jpg!m",
                  "https://hbcdn.huangbaoche.com/poi/182/182/C2EBF30074B6FD6B54FCBAFF6632C98F_980X576.jpg!m",
                  "https://hbcdn.huangbaoche.com/poi/184/184/DF68FB7856AFAAE7AF37B45C784CE463_980X576.jpg!m",
                  "https://hbcdn.huangbaoche.com/poi/187/187/68144E7CDDA6BA83DEF465CBF85691A4_980X576.jpg!m",
                  "https://hbcdn.huangbaoche.com/poi/191/191/7595150606E1751519DF629B9125FB07_980X576.jpg!m"
                ],
                "poiType": 5
              }
            ],
            "startTime": "12:30",
            "usingTime": "2"
          },
          {
            "poaClass": 4,
            "poaName": "乘坐导游专车前往下一站——山中湖温泉",
            "startTime": "14:30",
            "usingTime": "0.5"
          },
          {
            "poaClass": 5,
            "poaDesc": "在山中湖温泉，一边在白桦树林中泡汤一边眺望富士山美景。",
            "poaName": "山中湖温泉，给身心一次放松体验（自费体验）",
            "pois": [{
              "poiCityId": "3450",
              "poiCityName": "富士山",
              "poiId": "526919",
              "poiLatitude": 35.43015179999999,
              "poiLongitude": 138.8424913,
              "poiName": "紅富士之湯",
              "poiNameEn": "",
              "poiPic": "https://hbcdn.huangbaoche.com/poi/20160804/poi_manual/201608041229121244.jpg!m",
              "poiPicList": [
                "https://hbcdn.huangbaoche.com/poi/20160804/poi_manual/201608041229121244.jpg!m"
              ],
              "poiType": 5
            }
            ],
            "startTime": "15:00",
            "usingTime": "2"
          },
          {
            "poaClass": 4,
            "poaDesc": "自理，请提前预定酒店，或咨询导游推荐酒店",
            "poaName": "结束一天精彩旅程，导游送您返回东京市区酒店",
            "startTime": "17:00",
            "usingTime": "1.5"
          }
        ],
        "routePoiCount": 4,
        "routePoiDesc": "新倉富士浅間神社-河口湖-河口湖八音盒之森-紅富士之湯",
        "routeScope": 2,
        "serviceHours": 9,
        "serviceKms": 170,
        "startCityId": 4084,
        "startCityName": "富士河口湖",
        "subStarCityLocation": "35.497314,138.755081"
      },
      {
        "dateNum": "4",
        "endCityId": 217,
        "endCityName": "东京",
        "poaList": [
          {
            "poaClass": 4,
            "poaDesc": "专属导游接您与孩子从酒店出发，开启一天奇妙旅程。",
            "poaName": "东京市区酒店出发",
            "startTime": "09:00",
            "usingTime": "0.5"
          },
          {
            "poaClass": 3,
            "poaDesc": "东京最大的传统鱼市和蔬菜水果批发市场，筑地分为场内的交易市场和场外的商店街，集中了各色海鲜店、蔬果店、杂货店等。",
            "poaName": "筑地市场，感受日本的本土生活气息",
            "pois": [{
              "poiCityId": "217",
              "poiCityName": "东京",
              "poiId": "402482",
              "poiLatitude": 35.6704329,
              "poiLongitude": 139.7623274,
              "poiName": "筑地市场",
              "poiNameEn": "Tsukiji fish market",
              "poiPic": "https://hbcdn.huangbaoche.com/fr-hd/D3ojkuhQxQ0!m",
              "poiPicList": [
                "https://hbcdn.huangbaoche.com/fr-hd/D3ojkuhQxQ0!m",
                "https://hbcdn.huangbaoche.com/fr-hd/CDpBJ8RlZg0!m",
                "https://hbcdn.huangbaoche.com/fr-hd/HjkwEtDDsg0!m"
              ],
              "poiType": 1
            }
            ],
            "startTime": "09:30",
            "usingTime": "1.5"
          },
          {
            "poaClass": 4,
            "poaName": "乘坐导游专车前往下一站——东京迪士尼乐园",
            "startTime": "11:00",
            "usingTime": "0.5"
          },
          {
            "poaClass": 3,
            "poaDesc": "东京迪士尼乐园就如同一座梦幻国度，可以游览各个主题展区和游行表演以及夜间璀璨夺目的烟花表演。*含午餐时间，午餐自理*",
            "poaName": "最富童趣的东京迪士尼乐园",
            "pois": [{
              "poiCityId": "4107",
              "poiCityName": "千叶市",
              "poiId": "490730",
              "poiLatitude": 35.6328964,
              "poiLongitude": 139.88039430000003,
              "poiName": "迪士尼乐园",
              "poiNameEn": "Tokyo Disney Resort",
              "poiPic": "https://hbcdn.huangbaoche.com/poi/20161107/poi_manual/201611071503326131.jpg!m",
              "poiPicList": [
                "https://hbcdn.huangbaoche.com/poi/20161107/poi_manual/201611071503326131.jpg!m",
                "https://hbcdn.huangbaoche.com/poi/20161107/poi_manual/201611071503470368.jpg!m"
              ],
              "poiType": 3
            }
            ],
            "startTime": "11:30",
            "usingTime": "6"
          },
          {
            "poaClass": 4,
            "poaDesc": "自理，请提前预定酒店，或咨询导游推荐酒店。导游将帮您选择好就近的晚餐餐厅，步行10分钟内",
            "poaName": "结束一天精彩旅程，导游送您返回东京市区酒店",
            "startTime": "17:30",
            "usingTime": "0.5"
          }
        ],
        "routePoiCount": 2,
        "routePoiDesc": "筑地市场-迪士尼乐园",
        "routeScope": 1,
        "serviceHours": 9,
        "serviceKms": 50,
        "startCityId": 217,
        "startCityName": "东京",
        "subStarCityLocation": "35.708853,139.732661"
      }
    ],
    "salePoints": "在井之头恩赐公园泛舟，乐享别样樱花之后到宫崎骏先生亲造的动画世界里，做一个幸福的的孩子；看台场海滨公园看“迷你自由女神像”；最后去森美术馆俯瞰东京美丽夜景。",
    "starCityLocation": "35.708853,139.732661",
    "totalDistance": 455,
    "transactionVolumes": 0
  },
  "status": 200
};

class HbcGoodsDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '别样樱花 | 井之头恩赐公园+三鹰吉卜力美术馆+台场自由女神像+森美术馆 中文1日包车游，东京往返',
      theme: new ThemeData(
          primaryColor: Colors.white
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('别样樱花 | 井之头恩赐公园+三鹰吉卜力美术馆+台场自由女神像+森美术馆 中文1日包车游，东京往返'),
        ),
        body: new HbcGoodsIndex(DATA),
          bottomNavigationBar : new HbcGoodFooter()
      ),
      // debugShowMaterialGrid:true,
      // showPerformanceOverlay:true
    );
  }
}
