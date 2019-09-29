import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MePage extends StatelessWidget {
  MePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
        appBar: AppBar(
          title: Text('我的'),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              _topBar(),
              _topList(),
            _middleList(),
            _bottomList(),
            ],
          ),
        ));
  }

  Widget _topBar() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.redAccent,
          image: DecorationImage(
              image: AssetImage('images/back1.jpeg'), fit: BoxFit.fitWidth),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(20),
          ScreenUtil().setHeight(20),
          ScreenUtil().setWidth(20),
          ScreenUtil().setHeight(10)),
      width: ScreenUtil().setWidth(1105),
      height: ScreenUtil().setHeight(510),
      child: Row(
        children: <Widget>[_leftWidget(), _rightWidget()],
      ),
    );
  }

  Widget _leftWidget() {
    return Container(
        margin: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(80), ScreenUtil().setHeight(60), 0, 0),
        child: Container(
          child: Column(
            children: <Widget>[
              ClipOval(
                child: Image(
                  image: AssetImage('images/userIcon.jpeg'),
                  width: ScreenUtil().setWidth(200),
                  height: ScreenUtil().setHeight(200),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                      child: Image(
                        image: AssetImage('images/64-金币.png'),
                        width: ScreenUtil().setWidth(60),
                        height: ScreenUtil().setHeight(70),
                      ),
                    ),
                    Text(
                      '书币：50',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(50), color: Colors.black54,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ),
              Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                        child: Image(
                          image: AssetImage('images/优惠券 (1).png'),
                          width: ScreenUtil().setWidth(60),
                          height: ScreenUtil().setHeight(70),
                        ),
                      ),
                      Text(
                        '书券：50',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(50), color: Colors.black54,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ));
  }

  Widget _rightWidget() {
    return Container(
      margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(380), ScreenUtil().setHeight(100), 0, 0),
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Sonder',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(100), color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(110)),
            child: Container(
              height: ScreenUtil().setHeight(100),
              decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: FlatButton.icon(
                color: Colors.white,
                icon: Icon(
                  Icons.assignment_turned_in,
                  color: Colors.pinkAccent,
                ),
                label: (Text(
                  '签到',
                  style: TextStyle(color: Colors.pinkAccent),
                )),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.0)),
                onPressed: () {
                  print('签到');
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _myListTitle(String iconImage, String title) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
      width: ScreenUtil().setWidth(990),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1,color: Colors.black12)
        )
      ),
        child: Container(height: 50.0, child: ListTile(
          title: Text(title,
          style: TextStyle(
            fontWeight: FontWeight.w400
          ),),
          trailing: Icon(Icons.arrow_forward_ios),
        )));
  }

  Widget _topList() {
    return Container(
      width: ScreenUtil().setWidth(700),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),
                    ScreenUtil().setWidth(20), 0, 0),
                width: ScreenUtil().setWidth(64),
                child: Image(
                  width: ScreenUtil().setWidth(64),
                  image: AssetImage('images/我的充值2@2x.png'),
                ),
              ),
              _myListTitle('images/我的充值2@2x.png', '书币充值'),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),
                    ScreenUtil().setWidth(20), 0, 0),
                width: ScreenUtil().setWidth(64),
                child: Image(
                  width: ScreenUtil().setWidth(64),
                  image: AssetImage('images/我的VIP会员@2x.png'),
                ),
              ),
              _myListTitle('images/我的VIP会员@2x.png', '开通vip')
            ],
          ),
        ],
      ),
    );
  }

  Widget _middleList(){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white
      ),
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),
                    ScreenUtil().setWidth(20), 0, 0),
                width: ScreenUtil().setWidth(64),
                child: Image(
                  width: ScreenUtil().setWidth(64),
                  image: AssetImage('images/我的签到@2x.png'),
                ),
              ),
              _myListTitle('images/我的签到@2x.png', '签到有礼'),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),
                    ScreenUtil().setWidth(20), 0, 0),
                width: ScreenUtil().setWidth(64),
                child: Image(
                  width: ScreenUtil().setWidth(64),
                  image: AssetImage('images/我的充值@2x.png'),
                ),
              ),
              _myListTitle('images/我的充值@2x.png', '充值记录')
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),
                    ScreenUtil().setWidth(20), 0, 0),
                width: ScreenUtil().setWidth(64),
                child: Image(
                  width: ScreenUtil().setWidth(64),
                  image: AssetImage('images/我的消费@2x.png'),
                ),
              ),
              _myListTitle('images/我的消费@2x.png', '消费记录')
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),
                    ScreenUtil().setWidth(20), 0, 0),
                width: ScreenUtil().setWidth(64),
                child: Image(
                  width: ScreenUtil().setWidth(64),
                  image: AssetImage('images/我的积分兑换产品@2x.png'),
                ),
              ),
              _myListTitle('images/我的积分兑换产品@2x.png', '兑换专区')
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomList(){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white
      ),
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),
                    ScreenUtil().setWidth(20), 0, 0),
                width: ScreenUtil().setWidth(64),
                child: Image(
                  width: ScreenUtil().setWidth(64),
                  image: AssetImage('images/手机.png'),
                ),
              ),
              _myListTitle('images/手机.png', '绑定手机'),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60),
                    ScreenUtil().setWidth(20), 0, 0),
                width: ScreenUtil().setWidth(64),
                child: Image(
                  width: ScreenUtil().setWidth(64),
                  image: AssetImage('images/聊天.png'),
                ),
              ),
              _myListTitle('images/聊天.png', '意见反馈')
            ],
          ),
        ],
      ),
    );
  }
}
