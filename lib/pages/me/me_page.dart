
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_reader/pages/Login/login_page.dart';
import 'package:flutter_reader/pages/home/check/check_page.dart';
import 'package:flutter_reader/pages/home/recharge/recharge_page.dart';
import 'package:flutter_reader/pages/me/consumption_page.dart';
import 'package:flutter_reader/pages/me/exchange_page.dart';
import 'package:flutter_reader/pages/me/feedback_page.dart';
import 'package:flutter_reader/pages/me/recharge_recording_page.dart';
import 'package:flutter_reader/pages/me/vip_page.dart';
import 'package:flutter_reader/tools/global_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MePage extends StatefulWidget {
  MePage({Key key}) : super(key: key);

  @override
  _MePageState createState() {
    return _MePageState();
  }
}

class _MePageState extends State<MePage> {

  bool haveCheck = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final _hasLogin = Provider.of<GlobalModel>(context);

    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromRGBO(240, 240, 240, 1),
        body: MediaQuery.removePadding(context: context,
            removeTop: true,
            child: Container(
          child: ListView(
            children: <Widget>[
              _topLabBar(_hasLogin),
              _topList(),
              _middleList(),
              _bottomList()
            ],
          ),
        )));
  }

  Widget _topLabBar(GlobalModel hasLogin){
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(1050),
      child: Container(
        child: Column(
          children: <Widget>[
            _iconAndCheck(hasLogin),
            _coinAndTicket(hasLogin),
            _advertise(),
          ],
        ),
      ),
    );
  }

  Widget _iconAndCheck(GlobalModel hasLogin){
    return Container(
      height: ScreenUtil().setHeight(400),
      child:Row(
        children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => LoginPage()
              ));
            },
            child: Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(150),
                  left: ScreenUtil().setWidth(60)),
              child: ClipOval(
                child:Image(
                  width: ScreenUtil().setWidth(200),
                  image: hasLogin.value == true ? AssetImage('images/userIcon.jpeg') : AssetImage('images/fl_user.png'),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => LoginPage()
              ));
            },
            child: Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
              child: hasLogin.value == true ? Column(
                children: <Widget>[
                  Container(
                    margin:EdgeInsets.only(top: ScreenUtil().setHeight(150)),
                    child: Text('Sonder',style: TextStyle(fontWeight: FontWeight.w500,
                        fontSize: ScreenUtil().setSp(60)),),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(180),
                    height: ScreenUtil().setHeight(60),
                    decoration: BoxDecoration(color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                    child: Image(
                      width: ScreenUtil().setWidth(100),
                      image: AssetImage('images/VIP.png'),
                    ),
                  )
                ],
              ) : Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(140)),
                child: Text('登录/注册',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(55)
                  ),),
              ),
            ),
          ),
          hasLogin.value == true ? InkWell(
            onTap: (){
              haveCheck = true;
              setState(() {
                haveCheck = true;
              });
            },
            child: Container(
              width: ScreenUtil().setWidth(250),
              height: ScreenUtil().setHeight(100),
              margin: EdgeInsets.only(left: hasLogin.value == true ? ScreenUtil().setWidth(300) : ScreenUtil().setWidth(240),
                  top: ScreenUtil().setHeight(150)),
              decoration: BoxDecoration(
                  border: Border.all(width: 1,
                      color: haveCheck == true ? Colors.black12 : Color(0xffe53935)),
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  color: haveCheck == true ? Colors.white : Color(0xffe53935)
              ),
              child: Container(
                child: Center(
                  child: Text(
                    haveCheck == true ? '已签到' : '签到',
                    style: TextStyle(
                      color: haveCheck == true? Colors.black87 : Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ) : Container(

          )
        ],
      ),
    );
  }

  Widget _coinAndTicket(GlobalModel hasLogin){
    return Container(
      height: ScreenUtil().setHeight(150),
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(70)),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  border:Border(
                      right: BorderSide(
                          width: 1,
                          color: Colors.black12
                      )
                  )
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(hasLogin.value == true ? '410' : '0',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(60),
                          fontWeight: FontWeight.w500
                      ),),
                  ),
                  Container(
                    child: Text(
                      '书币',
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: ScreenUtil().setSp(40)
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(hasLogin.value == true ? '770' : '0',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(60),
                          fontWeight: FontWeight.w500
                      ),),
                  ),
                  Container(
                    child: Text(
                      '书券',
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: ScreenUtil().setSp(40)
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _advertise(){
    return InkWell(
      onTap: _jumpToVipPage,
      child: Container(
        width: ScreenUtil().setWidth(1045),
        height: ScreenUtil().setHeight(300),
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(70),
            left: ScreenUtil().setWidth(40),
            right: ScreenUtil().setWidth(40)),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(3.0, 3.0),),
            ],
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xffb31217),
                Color(0xffe52d27)
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child:Row(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(270),
              height: ScreenUtil().setHeight(150),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          width: 1,
                          color: Colors.white60
                      )
                  )
              ),
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(15),
                  top: ScreenUtil().setHeight(10)),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text('开通爱看VIP',
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: ScreenUtil().setSp(40))),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                    bottom: ScreenUtil().setHeight(10)),
                    child: Text('暂未开通',style: TextStyle(
                        color: Colors.white60,fontSize: ScreenUtil().setSp(35)
                    ),
                      textAlign: TextAlign.left,),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(50)),
              child: Text('开通vip畅销全站资源',
                style: TextStyle(color: Color.fromRGBO(245, 226, 221, 1),
                fontWeight: FontWeight.w500,
                letterSpacing: 2),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(50)),
              child: Image(
                width: ScreenUtil().setWidth(180),
                image: AssetImage('images/backImage2.png'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _func(){
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image(
                      color: Color(0xffe53935),
                      width: ScreenUtil().setWidth(110),
                      image: AssetImage('images/fl_check.png'),
                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                      child: Text('签到有礼'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image(
                      color: Color(0xffe53935),
                      width: ScreenUtil().setWidth(110),
                      image: AssetImage('images/fl_recorder.png'),
                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                      child: Text('充值记录'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image(
                      color: Color(0xffe53935),
                      width: ScreenUtil().setWidth(110),
                      image: AssetImage('images/记录-01.png'),
                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                      child: Text('消费记录'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image(
                      color: Color(0xffe53935),
                      width: ScreenUtil().setWidth(110),
                      image: AssetImage('images/fl_change.png'),
                    ),
                  ),
                  Container(
                    child: Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                      child: Text('兑换专区'),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _topList(){
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      height: ScreenUtil().setHeight(300),
        child: Column(
          children: <Widget>[
            _ListLine(false, 'images/fl_recharge.png', '书币充值', _jumpToRecharge),
            _ListLine(true, 'images/fl_king.png', '开通会员', _jumpToVipPage)
          ],
        )
    );
  }
  
  _middleList(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      height: ScreenUtil().setHeight(600),
      child: Column(
        children: <Widget>[
          _ListLine(false, 'images/fl_check.png', '签到有礼', _jumpToCheckPage),
          _ListLine(false, 'images/fl_recorder.png', '充值记录', _jumpToRechargeRecordPage),
          _ListLine(false, 'images/fl_money.png', '消费记录', _jumpToConsumptionPage),
          _ListLine(true, 'images/fl_change.png', '兑换专区', _jumpToExchangePage),
        ],
      ),
    );
  }

  _bottomList(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      height: ScreenUtil().setHeight(300),
      child: Column(
        children: <Widget>[
          _ListLine(false, 'images/fl_phone.png', '绑定手机', _jumpToRecharge),
          _ListLine(true, 'images/fl_review.png', '意见反馈', _jumpToFeedbackPage),
        ],
      ),
    );
  }

  Widget _ListLine(bool isBottom, String image, String title,
       GestureTapCallback jumpFunc){
    return InkWell(
      onTap: jumpFunc,
      child: Container(
        height: ScreenUtil().setHeight(150),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(20),
                  left: ScreenUtil().setWidth(40)),
              child: Image(
                width: ScreenUtil().setWidth(80),
                height: ScreenUtil().setHeight(100),
                image: AssetImage(image),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(50),
                  left: ScreenUtil().setWidth(50)),
              width: ScreenUtil().setWidth(950),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color: isBottom == true ? Colors.white : Colors.black12
                      )
                  )
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
                    child: Text(title,
                      style: TextStyle(fontSize: ScreenUtil().setSp(50),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(650),
                        bottom: ScreenUtil().setHeight(30)),
                    child: Image(
                      width: ScreenUtil().setWidth(80),
                      height: ScreenUtil().setHeight(50),
                      image: AssetImage('images/fl_arrow.png'),
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

  _jumpToRecharge(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => RechargePage()
    ));
  }

  _jumpToVipPage(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => VipPage()
    ));
  }

  _jumpToRechargeRecordPage(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => RechargeRecordPage()
    ));
  }

  _jumpToFeedbackPage(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => FeedbackPage()
    ));
  }

  _jumpToConsumptionPage(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => ConsumptionPage()
    ));
  }

  _jumpToCheckPage(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => CheckPage()
    ));
  }

  _jumpToExchangePage(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => ExchangePage()
    ));
  }
}