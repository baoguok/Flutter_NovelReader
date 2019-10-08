import 'package:flutter/material.dart';
import 'package:flutter_reader/pages/home/recharge/Radio_Widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RechargePage extends StatefulWidget {
  RechargePage({Key key}) : super(key: key);

  @override
  _RechargePageState createState() {
    return _RechargePageState();
  }
}

class _RechargePageState extends State<RechargePage> {
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
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: <Widget>[
            _coinWidget(),
            _chooseWidget()
          ],
        ),
      ),
    );
  }

  _coinWidget(){
    return Container(
      decoration: BoxDecoration(
          color: Colors.redAccent,
      ),
      margin: EdgeInsets.fromLTRB(
          0,
          0,
          0,
          ScreenUtil().setHeight(40)),
      height: ScreenUtil().setHeight(600),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(130)),
            child: Stack(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios,
                  color: Colors.white,),
                  onPressed: _backToHome,
                ),
                Container(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
                  child: Center(
                    child: Text('充值中心',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(65),
                          fontWeight: FontWeight.w600
                      ),),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(60)),
                  child: Image(
                    image: AssetImage('images/64-金币.png'),
                    width: ScreenUtil().setWidth(100),
                    height: ScreenUtil().setHeight(100),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                  child: Text('当前余额：   ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(60)
                    ),),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
                  child: Text('410      书币',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(60)
                    ),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _chooseWidget(){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(40),
          ScreenUtil().setHeight(500),
          ScreenUtil().setWidth(40),
          0),
      height: ScreenUtil().setHeight(800),
      width: ScreenUtil().setWidth(1100),
      child: Container(
        child: CustomRadioButton(
          hight: ScreenUtil().setHeight(200),
          buttonColor: Colors.white,
          buttonLables: [
            '1',
            '2',
            '3',
            '4'
          ],
          buttonValues: [
            '1',
            '2',
            '3',
            '4'
          ],
          radioButtonValue: (value) => print(value),
          selectedColor: Colors.redAccent,
        ),
      ),
    );
  }

  _backToHome(){
    Navigator.pop(context);
  }

  _smallPriceItem(int price){
    var coinNumber = price*1000;
    return InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(30),
            ScreenUtil().setHeight(50),
            ScreenUtil().setWidth(30),
            ScreenUtil().setHeight(50)
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.redAccent
          ),
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        height: ScreenUtil().setHeight(250),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
              child: Text(
                price.toString()+'元',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(60),
                  color: Colors.redAccent
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
              child: Text(
                coinNumber.toString()+'书币',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(40),
                  color: Colors.redAccent
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}