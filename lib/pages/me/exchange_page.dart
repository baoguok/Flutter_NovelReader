import 'package:flutter/material.dart';
import 'package:flutter_reader/dao/me_data_manager.dart';
import 'package:flutter_reader/tools/custom_notification.dart';
import 'package:flutter_reader/tools/dot_type.dart';
import 'package:flutter_reader/tools/point_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

class ExchangePage extends StatefulWidget {
  ExchangePage({Key key}) : super(key: key);

  @override
  _ExchangePageState createState() {
    return _ExchangePageState();
  }
}

class _ExchangePageState extends State<ExchangePage> {

  bool _isLoadingConfig = true;
  int userCoin;
  int userCoupon;
  int needCoin;
  int needCoupon;

  @override
  void initState() {
    loadConfig();
    super.initState();
  }

  loadConfig(){
    MeDao.fetchExchangeConfig().then((value){
      setState(() {
        userCoin = value.data.coin;
        userCoupon = value.data.gift;
        needCoin = value.data.ctg;
        needCoupon = value.data.gtv;
        
        _isLoadingConfig = false;
      });
    });
  }

  exchangeGift(){
    MeDao.exchange('gift').then((value){
      setState(() {
        if(value['success'] == true){
          toast('兑换成功！');
          setState(() {
            userCoin = value['data']['coin'];
            userCoupon = value['data']['gift'];
          });
        }
        else
          {
            showOverlayNotification((context) {
              return MessageNotification(
                message: messages[0],
                onReply: () {
                  OverlaySupportEntry.of(context).dismiss();
                },
              );
            }, duration: Duration(milliseconds: 3000));
          }
      });
    });
  }

  exchangeVIP(){
    MeDao.exchange('vip').then((value){
      setState(() {
        if(value['success'] == true){
          toast('兑换成功！');
          setState(() {
            userCoin = value['data']['coin'];
            userCoupon = value['data']['gift'];
          });
        }
        else
        {
          showOverlayNotification((context) {
            return MessageNotification(
              message: messages1[0],
              onReply: () {
                OverlaySupportEntry.of(context).dismiss();
              },
            );
          }, duration: Duration(milliseconds: 3000));
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('兑换专区'),
        backgroundColor: Color(0xffe53935),
      ),
      body: _isLoadingConfig ? Container(
        height: ScreenUtil().setHeight(1800),
        width: ScreenUtil().setWidth(1125),
        child: Container(
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(800)),
          child: ColorLoader4(
            dotOneColor: Colors.pink,
            dotTwoColor: Colors.amber,
            dotThreeColor: Colors.deepOrange,
            dotType: DotType.square,
            duration: Duration(seconds: 2),
          ),
        ),
      ) : Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(100),
                  right: ScreenUtil().setWidth(60),left: ScreenUtil().setWidth(60)),
              height: ScreenUtil().setHeight(300),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10.0,
                      offset: Offset(3.0, 3.0),),
                  ],
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xfffdfcfb),
                      Color(0xffe2d1c3)
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: ScreenUtil().setHeight(190),
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  width: 1,
                                  color: Colors.white54
                              )
                          )
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(15)),
                            child: Text(userCoin.toString(),
                              style: TextStyle(fontSize: ScreenUtil().setSp(90),
                                  color: Color(0xff868f96)),),
                          ),
                          Text('我的书币',
                              style: TextStyle(
                                  color: Color(0xff868f96),
                                  fontSize: ScreenUtil().setSp(45)
                              ))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: ScreenUtil().setHeight(190),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(15)),
                            child: Text(userCoupon.toString(),
                              style: TextStyle(fontSize: ScreenUtil().setSp(90),
                                  color: Color(0xff596164)),),
                          ),
                          Text('我的书券',
                            style: TextStyle(
                                color: Color(0xff596164),
                                fontSize: ScreenUtil().setSp(45)
                            ),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(70)),
              child: Stack(
                children: <Widget>[
                  Image(
                    width: ScreenUtil().setWidth(1025),
                    image: AssetImage('images/exchangeVIP.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(550),
                        top: ScreenUtil().setHeight(60)),
                    child: Column(
                      children: <Widget>[
                        Text('需要${needCoupon.toString()}书券'),
                        Container(
                          child:  ButtonTheme(
                            minWidth: ScreenUtil().setWidth(350),
                            height: ScreenUtil().setHeight(100),
                            child: RaisedButton(
                                color: Color(0xffe53935),
                                child: Text("立即兑换",
                                  style: TextStyle(color: Colors.white),),
                                onPressed: (){
                                  exchangeVIP();
                                },
                                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(70)),
              child: Stack(
                children: <Widget>[
                  Image(
                    width: ScreenUtil().setWidth(1025),
                    image: AssetImage('images/exchangeCoupon.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(550),
                        top: ScreenUtil().setHeight(60)),
                    child: Column(
                      children: <Widget>[
                        Text('需要${needCoin.toString()}书币'),
                        Container(
                          child:  ButtonTheme(
                            minWidth: ScreenUtil().setWidth(350),
                            height: ScreenUtil().setHeight(100),
                            child: RaisedButton(
                                color: Colors.orangeAccent,
                                child: Text("立即兑换",
                                  style: TextStyle(color: Colors.white),),
                                onPressed: (){
                                  exchangeGift();
                                },
                                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

