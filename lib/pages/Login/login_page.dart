import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reader/tools/global_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/// 墨水瓶（`InkWell`）可用时使用的字体样式。
final TextStyle _availableStyle = TextStyle(
  fontSize: 16.0,
  color: Color(0xffe53935),
);

/// 墨水瓶（`InkWell`）不可用时使用的样式。
final TextStyle _unavailableStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.black26,
);

class LoginPage extends StatefulWidget {

  /// 倒计时的秒数，默认60秒。
  final int countdown;
  /// 用户点击时的回调函数。
  final Function onTapCallback;
  /// 是否可以获取验证码，默认为`false`。
  final bool available;

  LoginPage({
    this.countdown: 5,
    this.onTapCallback,
    this.available: true,
  });



  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  /// 倒计时的计时器。
  Timer _timer;
  /// 当前倒计时的秒数。
  int _seconds;
  /// 当前墨水瓶（`InkWell`）的字体样式。
  TextStyle inkWellStyle = _availableStyle;
  /// 当前墨水瓶（`InkWell`）的文本。
  String _verifyStr = '获取验证码';

  @override
  void initState() {
    super.initState();
    _seconds = widget.countdown;
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    // 计时器（`Timer`）组件的定期（`periodic`）构造函数，创建一个新的重复计时器。
    _timer = Timer.periodic(
        Duration(seconds: 1),
            (timer) {
          if (_seconds == 0) {
            _cancelTimer();
            _seconds = widget.countdown;
            inkWellStyle = _availableStyle;
            setState(() {});
            return;
          }
          _seconds--;
          _verifyStr = '已发送$_seconds'+'s';
          setState(() {});
          if (_seconds == 0) {
            _verifyStr = '重新发送';
          }
        });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    // 计时器（`Timer`）组件的取消（`cancel`）方法，取消计时器。
    _timer?.cancel();
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
        body: Column(
          children: <Widget>[
            _topBar(),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(300)),
              child: Center(
                child: Text('爱看',
                    style: TextStyle(
                        fontFamily: 'QFonts',
                        fontWeight: FontWeight.w400,
                        fontSize: ScreenUtil().setSp(140),
                        color: Color(0xffe53935)
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(60),
              right: ScreenUtil().setWidth(60),top: ScreenUtil().setHeight(80)),
              child: TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: '手机号码',
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(60),
                      right: ScreenUtil().setWidth(60),top: ScreenUtil().setHeight(80)),
                  child: TextField(
                    controller: _codeController,
                    decoration: InputDecoration(
                      hintText: '短信验证码',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(120), left: ScreenUtil().setWidth(800)),
                  child: widget.available ?
                  InkWell(
                    child: Text(
                      '  $_verifyStr  ',
                      style: inkWellStyle,
                    ),
                    onTap: (_seconds == widget.countdown) ? () {
                      print('点击');
                      _startTimer();
                      inkWellStyle = _unavailableStyle;
                      _verifyStr = '已发送$_seconds'+'s';
                      setState(() {});
                    } : (){
                      ///倒计时未结束
                      print('${_seconds}-------${widget.countdown}');
                    },
                  )
                      : InkWell(
                    child: Text(
                      '  获取验证码  ',
                      style: _unavailableStyle,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(150)),
              child: SizedBox(
                width: ScreenUtil().setWidth(1000),
                height: ScreenUtil().setHeight(150),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30),
                      side: BorderSide(color: Colors.red)
                  ),
                  onPressed: (){
                    ///登录成功
                    _hasLogin.goLogin();
                    Navigator.pop(context);
                  },
                  color: Color(0xffe53935),
                  child: Text('登录',
                  style: TextStyle(color: Colors.white,
                  fontSize: ScreenUtil().setSp(55)),),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(400)),
              child: Text('——  其他登录方式  ——',
              style: TextStyle(
                color: Colors.black38,
                fontSize: ScreenUtil().setSp(45)
              ),),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(120)),
              child: Column(
                children: <Widget>[
                  Image(
                    width: ScreenUtil().setWidth(150),
                    image: AssetImage('images/fl_WeChatLog.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
                    child: Text('微信登录',style: TextStyle(
                      fontSize: ScreenUtil().setSp(45)
                    ),),
                  )
                ],
              ),
            )
          ],
        )
    );
  }

  _topBar(){
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: ScreenUtil().setWidth(150),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: ScreenUtil().setWidth(40)),
            child: InkWell(
              onTap: (){


              },
              child: Text('注册',
                style: TextStyle(fontSize: ScreenUtil().setSp(55),
                    fontWeight: FontWeight.w500),),
            ),
          )
        ],
      ),
    );
  }
}
