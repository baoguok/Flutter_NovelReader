import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectWidget extends StatelessWidget {
  ConnectWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(100),
            ScreenUtil().setHeight(70), 0, 0),
        child: Row(
          children: <Widget>[
            _getLeftItem(),
            _getRightItem()
          ],
        ),
      ),
    );
  }

  _getLeftItem(){
    return Container(
      height: ScreenUtil().setHeight(500),
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(450),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(70)),
                  child: Image(
                      image: AssetImage('images/联系.png'),
                      width: ScreenUtil().setWidth(55),
                      height: ScreenUtil().setWidth(55),
                    ),
                ),
                Container(
                  width: ScreenUtil().setWidth(ScreenUtil().setWidth(700)),
                  margin: EdgeInsets.fromLTRB(7, ScreenUtil().setHeight(70), 0, 0),
                  child: Text('联系方式:',
                  style: TextStyle(
                    color: Colors.grey
                  ),),
                )
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(450),
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Text(
              'WeChat: kanxiaoshuo101',
              style: TextStyle(
                color: Colors.greenAccent
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
            width: ScreenUtil().setWidth(450),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 0),
                  child: Image(
                    image: AssetImage('images/时间.png'),
                    width: ScreenUtil().setWidth(55),
                    height: ScreenUtil().setWidth(55),
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(ScreenUtil().setWidth(700)),
                  margin: EdgeInsets.only(left: 7),
                  child: Text('营业时间:',
                    style: TextStyle(
                        color: Colors.grey
                    ),),
                )
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(450),
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Text(
              '周一～周五',
              style: TextStyle(
                  color: Colors.greenAccent
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(450),
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Text(
              '9:00~18:00',
              style: TextStyle(
                  color: Colors.greenAccent
              ),
            ),
          )
        ],
      ),
    );
  }

  _getRightItem(){
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(80)),
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
                '客服二维码',
            style: TextStyle(
              color: Colors.grey
            )),
          ),
          Container(
            child: Image(
              image: AssetImage('images/客服二维码.JPG'),
            ),
          )
        ],
      ),
    );
  }
}
