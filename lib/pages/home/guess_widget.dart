import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuessWidget extends StatelessWidget {
  GuessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setHeight(1175),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _subItem('bookImage/book12.jpg', '卖婚'),
                _subItem('bookImage/book13.jpg', '求调教'),
                _subItem('bookImage/book14.jpg', '亿万老公太危险')
              ],
            ),
            Row(
              children: <Widget>[
                _subItem('bookImage/book15.jpg', '鬼也要爱'),
                _subItem('bookImage/book16.jpg', '夜班鬼敲门'),
                _subItem('bookImage/book17.jpg', '总裁大人甜掉牙')
              ],
            )
          ],
        ),
      ),
    );
  }

  _subItem(String image, String title){
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(50)),
      width: ScreenUtil().setWidth(310),
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(400),
            margin: EdgeInsets.only(top: 7),
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
            child: Image(
              width: ScreenUtil().setWidth(310),
              height: ScreenUtil().setHeight(400),
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(35)),
              child:Text(
                  title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(

                ),
              )
          )
        ],
      ),
    );
  }
}
