import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MePage extends StatelessWidget {
  MePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('我的'),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
          child: Row(
            children: <Widget>[_topBar()],
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
          ScreenUtil().setWidth(10),
          ScreenUtil().setHeight(15),
          ScreenUtil().setWidth(10),
          ScreenUtil().setHeight(10)),
      width: ScreenUtil().setWidth(1105),
      height: ScreenUtil().setHeight(500),
      child: Row(
        children: <Widget>[_leftWidget(), _rightWidget()],
      ),
    );
  }

  Widget _leftWidget() {
    return Container(
        margin: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(150), ScreenUtil().setHeight(60), 0, 0),
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
                child: Text(
                  '书币：50',
                  style: TextStyle(fontSize: ScreenUtil().setSp(50),
                  color: Colors.black54),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
                child: Text(
                  '书券：50',
                  style: TextStyle(fontSize: ScreenUtil().setSp(50),
                  color: Colors.black54),
                ),
              )
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
                fontSize: ScreenUtil().setSp(100),
                color: Colors.white
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(110)),
            child: Container(
              height: ScreenUtil().setHeight(100),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: FlatButton.icon(
                color: Colors.white,
                icon: Icon(Icons.assignment_turned_in,color: Colors.pinkAccent,),
                label: (
                    Text('签到',
                    style: TextStyle(
                      color: Colors.pinkAccent
                    ),)
                ),
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
                onPressed: (){
                  print('签到');
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
