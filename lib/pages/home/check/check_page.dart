import 'package:flutter/material.dart';
import 'package:flutter_reader/dao/check_data_manager.dart';
import 'package:flutter_reader/model/check/check_config_model.dart';
import 'package:flutter_reader/pages/home/recharge/protocol_dialog.dart';
import 'package:flutter_reader/tools/color_loader.dart';
import 'package:flutter_reader/tools/rich_alert.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';

class CheckPage extends StatefulWidget {
  CheckPage({Key key}) : super(key: key);

  @override
  _CheckPageState createState() {
    return _CheckPageState();
  }
}

class _CheckPageState extends State<CheckPage> {
  bool _isLoadingConfig = true;

  CheckConfigModel _configModel;
  CheckConfigData _checkConfigData;

  int coin = 0;
  int gift = 0;
  int next = 0;
  int current = 0;

  bool canCheck = false;
  bool todayCheck = false;


  //progress是反的
  var progressNow = 7;
  var now = DateTime.now();
  @override
  void initState() {
    loadConfig();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadConfig(){
    CheckDao.fetchCheckConfig().then((value){
      setState(() {

        coin = value.data.coin;
        gift = value.data.gift;
        next = value.data.daily.next;
        current = value.data.daily.current;
        todayCheck = value.data.daily.today;

        _isLoadingConfig = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _isLoadingConfig ?Container(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(1000)),
            child: Column(
              children: <Widget>[
                ColorLoader(
                  color1: Colors.redAccent,
                  color2: Colors.green,
                  color3: Colors.amber,
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
                  child: Text(
                      '正在为您生成签到页...'
                  ),
                )
              ],
            ),
          ),
        ),
      ) : Container(
        child: Stack(
          children: <Widget>[
            _topBackWidget(),
            _checkInWidget(),
            _showAssetsWidget()
          ],
        ),
      ),
    );
  }

  _topBackWidget(){
    return Container(
      color: Color(0xffe53935),
      height: ScreenUtil().setHeight(700),
      width: ScreenUtil().setWidth(1125),
      child: Container(
        alignment: AlignmentDirectional.topCenter,
        child: InkWell(
          onTap: _backToHome,
          child: Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(109)),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios,
                    color: Colors.white,),
                  onPressed: null,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                  child:  Text('返回',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(65),
                        fontWeight: FontWeight.w600
                    ),),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(720),top: ScreenUtil().setHeight(10)),
                  child: InkWell(
                    onTap: _pressProblem,
                    child: Image(
                      width: ScreenUtil().setWidth(70),
                      height: ScreenUtil().setHeight(90),
                      image: AssetImage('images/fl_question.png'),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      )
    );
  }

  _checkInWidget(){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 20.0,
            ),
          ]
      ),
      margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(40),
          ScreenUtil().setHeight(300),
          ScreenUtil().setWidth(40),
          0),
      height: ScreenUtil().setHeight(1500),
      width: ScreenUtil().setWidth(1100),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(50), ScreenUtil().setHeight(80), 0, 0),
                    child: Text('每日签到',style: TextStyle(
                      fontSize: ScreenUtil().setSp(120),
                      fontWeight: FontWeight.w500
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(350),
                        ScreenUtil().setHeight(70), 0, 0),
                    child: Image(
                      height: ScreenUtil().setHeight(100),
                      width: ScreenUtil().setWidth(100),
                      image: AssetImage('images/fl_check2.png'),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(450)),
              child: Text(
                '打卡越多奖励越多',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(60),
                  color: Colors.black26
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(40), ScreenUtil().setWidth(760), 0),
              child: Text('星期'+_changeToChinese(now.weekday),
              style: TextStyle(
                fontSize: ScreenUtil().setSp(60),
                color: Colors.black54
              ),),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(10), ScreenUtil().setWidth(740), 0),
              child: Text(now.year.toString()+'.'+now.month.toString(),
              style: TextStyle(
                fontSize: ScreenUtil().setSp(55),
                color: Colors.black54
              ),),
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(60)),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        child: Text(now.day.toString(),
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(300),
                              fontWeight: FontWeight.w700,
                              color: Colors.black54
                          ),),
                      ),
                      Container(
                        child: Text('连续签到天数',style: TextStyle(
                          color: Colors.black54,
                          fontSize: ScreenUtil().setSp(45)
                        ),),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(100)),
                    child: Image(
                      width: ScreenUtil().setWidth(500),
                      height: ScreenUtil().setHeight(400),
                      image: AssetImage('images/checkPageImage.jpg'),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(150)),
                    child: Text(
                      (current + 1).toString(),
                      style: TextStyle(
                          fontFamily: 'QFonts',
                          fontSize: ScreenUtil().setSp(80),
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(241, 222, 100, 1)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(200)),
                    child: Text(
                      (current + 3).toString(),
                      style: TextStyle(
                          fontFamily: 'QFonts',
                          fontSize: ScreenUtil().setSp(80),
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(241, 222, 100, 1)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(200)),
                    child: Text(
                      (current + 5).toString(),
                      style: TextStyle(
                          fontFamily: 'QFonts',
                          fontSize: ScreenUtil().setSp(80),
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(241, 222, 100, 1)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(150)),
                    child: Image(
                      height: ScreenUtil().setHeight(100),
                      width: ScreenUtil().setWidth(80),
                      image: AssetImage('images/fl_gift2.png'),),
                  ),
                ],
              ),
            ),
            Container(
              margin:EdgeInsets.only(top: ScreenUtil().setHeight(20)),
              child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [progressNow].map<Widget>((i) {
                      return Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: IntervalProgressBar(
                              direction: IntervalProgressDirection.horizontal,
                              max: 7,
                              progress: i,
                              intervalSize: 2,
                              size: Size(300, 10),
                              highlightColor: Colors.black26,
                              defaultColor: Color(0xffe53935),
                              intervalColor: Colors.transparent,
                              intervalHighlightColor: Colors.transparent,
                              reverse: true,
                              radius: 5));
                    }).toList()),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(280)),
                    child: Text(
                      (current + 2).toString(),
                      style: TextStyle(
                        fontFamily: 'QFonts',
                        fontSize: ScreenUtil().setSp(80),
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(241, 222, 100, 1)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(200)),
                    child: Text(
                      (current + 4).toString(),
                      style: TextStyle(
                          fontFamily: 'QFonts',
                          fontSize: ScreenUtil().setSp(80),
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(241, 222, 100, 1)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(200)),
                    child: Text(
                      (current + 6).toString(),
                      style: TextStyle(
                          fontFamily: 'QFonts',
                          fontSize: ScreenUtil().setSp(80),
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(241, 222, 100, 1)
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                color: Color(0xffe53935),
                textColor: Colors.white,
                child: Container(
                  width: ScreenUtil().setWidth(500),
                  child: Center(
                    child: Text(todayCheck ? '花 ${next} 书币补签' : '每日签到'),
                  ),
                ),
                onPressed: (){
                  _pressCheckIn();
                },
              ),
            )
          ],
        )
      ),
    );
  }

  _showAssetsWidget(){
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(1900)),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Text('当前可用',style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                  fontSize: ScreenUtil().setSp(60)
                ),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(230)),
                    child: Image(
                      width: ScreenUtil().setWidth(100),
                      height: ScreenUtil().setHeight(100),
                      image: AssetImage('images/fl_coin.png'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
                    height: ScreenUtil().setHeight(200),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(_isLoadingConfig == true ? '正在计算' : coin.toString(),
                            style: TextStyle(color: Colors.black54,
                                fontSize: _isLoadingConfig == true ? ScreenUtil().setSp(40) : ScreenUtil().setSp(60),
                                fontWeight: FontWeight.w500),),
                          padding: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
                          child: Text('书币',
                              style: TextStyle(color: Colors.black54,
                                  fontSize: ScreenUtil().setSp(40))),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(150),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                width: 1,
                                color: Colors.black26
                            )
                        )
                    ),
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(120)),
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(80)),
                    child: Image(
                      width: ScreenUtil().setWidth(100),
                      height: ScreenUtil().setHeight(100),
                      image: AssetImage('images/fl_bucket.png'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
                    height: ScreenUtil().setHeight(200),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(_isLoadingConfig == true ? '正在计算' : gift.toString(),
                            style: TextStyle(color: Colors.black54,
                                fontSize: _isLoadingConfig == true ? ScreenUtil().setSp(40) : ScreenUtil().setSp(60),
                                fontWeight: FontWeight.w500),),
                          padding: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
                          child: Text('书券',
                              style: TextStyle(color: Colors.black54,
                                  fontSize: ScreenUtil().setSp(40))),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _backToHome(){
    Navigator.pop(context);
  }

  //progress是反的
  _pressCheckIn(){
    CheckDao.getToCheck().then((value){
      setState(() {
        if(value.success == true){
            progressNow -= 1;
            if(progressNow == -1){
              progressNow = 7;
            }
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return RichAlertDialog( //uses the custom alert dialog
                    alertTitle: richTitle("签到成功"),
                    alertSubtitle: richSubtitle("恭喜赢得书币"),
                    alertType: RichAlertType.SUCCESS,
                  );
                }
            );
        }
        else{
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return RichAlertDialog( //uses the custom alert dialog
                  alertTitle: richTitle("签到失败"),
                  alertSubtitle: richSubtitle("书币不足"),
                  alertType: RichAlertType.WARNING,
                );
              }
          );
        }
      });
    });
  }

  _pressProblem(){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return ProtocolDialog(
            title: '签到规则说明',
            dialogText: '(一) 新用户登录豪华礼包\n\n1、新用户每日首次登录书城，可获得新用户签到福利，共计7次。\n\n(二) 每日签到\n\n1、签到周期为自然月，每个自然月总计可签到次数为当月实际天数,每月1号清零。\n2、可补签，每个自然月补签不限次数。补签消耗书币详情：第1次消耗10书币，第二次消耗20书币，第三次消耗30书币，第四次消耗50书币，第五次及以上消耗60书币',
          );
        }
    );
  }

  _changeToChinese(int weekdate) {
    String dateCN;
    switch (weekdate) {
      case 1:
        {
          dateCN = '一';
        }
        break;
      case 2:
        {
          dateCN = '二';
        }
        break;
      case 3:
        {
          dateCN = '三';
        }
        break;
      case 4:
        {
          dateCN = '四';
        }
        break;
      case 5:
        {
          dateCN = '五';
        }
        break;
      case 6:
        {
          dateCN = '六';
        }
        break;
      case 7:
        {
          dateCN = '日';
        }
        break;
    }
    return dateCN;
  }
}