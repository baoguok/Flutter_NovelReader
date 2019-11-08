

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RechargeRecordingPage extends StatelessWidget {
  RechargeRecordingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe53935),
        title: Text('充值记录'),
      ),
      body: Container(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(650)),
            child: Column(
              children: <Widget>[
                Image(
                  width: ScreenUtil().setWidth(800),
                  height: ScreenUtil().setHeight(400),
                  image: AssetImage('images/暂无数据、@2x.png'),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(65),top: ScreenUtil().setHeight(40)),
                  child: Text(
                    '暂无数据',
                    style: TextStyle(fontSize: ScreenUtil().setSp(55)),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
