import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewBookWidget extends StatelessWidget {
  NewBookWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      height: ScreenUtil().setHeight(1250),
      child: Container(
        child: Column(
          children: <Widget>[
            _getMainItem('bookImage/book7.jpg', '情花开','[连载中]:', '郎骑竹马来，绕床弄青梅故事里面没有青梅，只有失散七年的竹马与竹马。再次相遇，可就不能让缘分就这么悄无声息的溜走，一定要','都市娱乐',4785),
            _getMainItem('bookImage/book8.jpg', '爱的彼方','[已完结]:', '你承诺要给我一个没有狂风暴雨的世界但我更希望站到你身和你一同担负起这个国家穿越时空','都市娱乐',7854),
            _getMainItem('bookImage/book9.jpg', '无尽沉沦','[已完结]:', '地球的表面出现了九个巨坑，有人从其中挖出了一口石棺，里面躺着九具衣冠整洁的干尸。一棺九尸，开启了人类最黑暗的末日纪元。红颜薄命，英雄气短。','都市娱乐',5789)
          ],
        )
      )
    );
  }

  _getMainItem(String imageName, String title, String state, String introduce, String type, int readTimes){
    return Container(
      child: Row(
        children: <Widget>[
         Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
        new BoxShadow(
        color: Colors.black26,
        blurRadius: 5.0,
        spreadRadius: 1.0,
        offset: Offset(-2.0, 2.0),
      ),
      ],
    ),
           margin: EdgeInsets.fromLTRB(
               ScreenUtil().setWidth(40),
               ScreenUtil().setHeight(50),
               ScreenUtil().setWidth(20),
               ScreenUtil().setHeight(0)),
           child: Image(
             width: ScreenUtil().setWidth(280),
             height: ScreenUtil().setHeight(350),
             image: AssetImage(imageName),
             fit: BoxFit.fill,
           ),
         ),
          _rightItem(title, state, introduce, type, readTimes)
        ],
      ),
    );
  }

  _rightItem(String title, String state, String introduce, String type, int readTimes){
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(700),
            height: ScreenUtil().setHeight(100),
            child:  Text(
                title,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(50),
              fontWeight: FontWeight.w500
            ),),
          ),
          Container(
            width: ScreenUtil().setWidth(700),
            height: ScreenUtil().setHeight(120),
            child: Row(
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      state,
                      style: TextStyle(
                          color: state == '[连载中]:' ? Colors.lightBlue : Colors.orangeAccent
                      ),
                    ),
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(520),
                  child: Text(
                      introduce,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: ScreenUtil().setSp(40)
                      ),
                )
                )
              ],
            )
          ),
          _bottom(type, readTimes)
        ],
      ),
    );
  }

  _bottom(String type, int readTimes){
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(50), ScreenUtil().setWidth(320), 0),
            width: ScreenUtil().setWidth(150),
      decoration: BoxDecoration(
          border: Border.all(
          color: Colors.grey,
          width: 1.0,
          style: BorderStyle.solid
      ),
      borderRadius:BorderRadius.all(Radius.circular(5.0))
      ),
            child: Text(
              type,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(30),
                color: Colors.grey
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(60), 0, 0),
            child: Image(
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(30),
              fit: BoxFit.fill,
              image: AssetImage('images/浏览眼睛@2x.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), ScreenUtil().setHeight(60), 0, 0),
            child: Text(
                readTimes.toString(),
              style: TextStyle(
                fontSize: ScreenUtil().setSp(35),
                color: Colors.redAccent
              ),
            ),
          )
        ],
      )
    );
  }
}
