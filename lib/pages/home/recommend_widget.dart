import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendWidget extends StatelessWidget {
  RecommendWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      height: ScreenUtil().setHeight(600),
      child: Row(
        children: <Widget>[
             _subItem('bookImage/book4.jpg', '欢爱一生'),
             _subItem('bookImage/book5.jpg', '星途璀璨'),
             _subItem('bookImage/book6.jpg', '一世倾情'),
        ],
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
            title
          )
          )
        ],
      ),
    );
  }
}
