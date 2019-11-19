import 'package:flutter/material.dart';
import 'package:flutter_reader/dao/me_data_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(100)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  width: 1,
                                  color: Colors.black12
                              )
                          )
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(40)),
                            child: Text(userCoin.toString(),
                              style: TextStyle(fontSize: ScreenUtil().setSp(90),
                                  color: Colors.orangeAccent),),
                          ),
                          Text('我的书币')
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(40)),
                          child: Text(userCoupon.toString(),
                            style: TextStyle(fontSize: ScreenUtil().setSp(90),
                                color: Color(0xffe53935)),),
                        ),
                        Text('我的书券')
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
                    width: ScreenUtil().setWidth(1000),
                    image: AssetImage('images/会员兑换@2x.png'),
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
                    width: ScreenUtil().setWidth(1000),
                    image: AssetImage('images/书券兑换@2x.png'),
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

