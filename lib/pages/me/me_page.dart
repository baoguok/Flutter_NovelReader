
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_reader/pages/home/check/check_page.dart';
import 'package:flutter_reader/pages/home/recharge/recharge_page.dart';
import 'package:flutter_reader/pages/me/consumption_page.dart';
import 'package:flutter_reader/pages/me/exchange_page.dart';
import 'package:flutter_reader/pages/me/feedback_page.dart';
import 'package:flutter_reader/pages/me/recharge_recording_page.dart';
import 'package:flutter_reader/pages/me/vip_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromRGBO(240, 240, 240, 1),
        body: MediaQuery.removePadding(context: context,
            removeTop: true,
            child: Container(
          child: ListView(
            children: <Widget>[
              _topLabBar(),
              _topList(),
              _middleList(),
              _bottomList()
            ],
          ),
        )));
  }

  Widget _topLabBar(){
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(1000),
      child: Container(
        child: Column(
          children: <Widget>[
            _iconAndCheck(),
            _coinAndTicket(),
            _advertise(),
          ],
        ),
      ),
    );
  }

  Widget _iconAndCheck(){
    return Container(
      child:Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(150),
            left: ScreenUtil().setWidth(60)),
            child: ClipOval(
            child:Image(
              width: ScreenUtil().setWidth(200),
              image: AssetImage('images/userIcon.jpeg'),
            ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
            child: Column(
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
            ),
          ),
          InkWell(
            onTap: (){
              haveCheck = true;
              setState(() {
                haveCheck = true;
              });
            },
            child: Container(
              width: ScreenUtil().setWidth(250),
              height: ScreenUtil().setHeight(100),
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(340),
              top: ScreenUtil().setHeight(150)),
              decoration: BoxDecoration(
                border: Border.all(width: 1,
                color: haveCheck == true ? Colors.black12 : Colors.redAccent),
                borderRadius: BorderRadius.all(Radius.circular(18)),
                  color: haveCheck == true ? Colors.white : Colors.redAccent
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
          )
        ],
      ),
    );
  }

  Widget _coinAndTicket(){
    return Container(
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
                    child: Text('410',
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
                    child: Text('770',
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
        height: ScreenUtil().setHeight(300),
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(70),
            left: ScreenUtil().setWidth(40),
            right: ScreenUtil().setWidth(40)),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(3.0, 3.0),),
            ],
            color: Colors.black87,
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
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
                    child: Text('暂未开通',style: TextStyle(
                        color: Colors.white60,fontSize: ScreenUtil().setSp(35)
                    ),
                      textAlign: TextAlign.left,),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(160)),
              child: Text('开通vip畅销全站资源',
                style: TextStyle(color: Color.fromRGBO(245, 226, 221, 1)),),
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
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
                      color: Colors.redAccent,
                      width: ScreenUtil().setWidth(110),
                      image: AssetImage('images/我签到.png'),
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
                      color: Colors.redAccent,
                      width: ScreenUtil().setWidth(110),
                      image: AssetImage('images/记录.png'),
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
                      color: Colors.redAccent,
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
                      color: Colors.redAccent,
                      width: ScreenUtil().setWidth(110),
                      image: AssetImage('images/兑换.png'),
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
      height: ScreenUtil().setHeight(304),
        child: Column(
          children: <Widget>[
            _ListLine(false, 'images/充值.png', '书币充值', _jumpToRecharge),
            _ListLine(true, 'images/皇冠.png', '开通会员', _jumpToVipPage)
          ],
        )
    );
  }
  
  _middleList(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      height: ScreenUtil().setHeight(609),
      child: Column(
        children: <Widget>[
          _ListLine(false, 'images/我签到.png', '签到有礼', _jumpToCheckPage),
          _ListLine(false, 'images/记录.png', '充值记录', _jumpToRechargeRecordPage),
          _ListLine(false, 'images/钱.png', '消费记录', _jumpToConsumptionPage),
          _ListLine(true, 'images/兑换.png', '兑换专区', _jumpToExchangePage),
        ],
      ),
    );
  }

  _bottomList(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      height: ScreenUtil().setHeight(304),
      child: Column(
        children: <Widget>[
          _ListLine(false, 'images/手机我.png', '绑定手机', _jumpToRecharge),
          _ListLine(true, 'images/_意见反馈.png', '意见反馈', _jumpToFeedbackPage),
        ],
      ),
    );
  }

  Widget _ListLine(bool isBottom, String image, String title,
       GestureTapCallback jumpFunc){
    return InkWell(
      onTap: jumpFunc,
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(20),
                  left: ScreenUtil().setWidth(40)),
              child: Image(
                width: ScreenUtil().setWidth(80),
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
                      image: AssetImage('images/箭头.png'),
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
      builder: (context) => RechargeRecordingPage()
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