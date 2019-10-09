import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotWidget extends StatelessWidget {
  HotWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setHeight(750),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _mainItem(context ,'bookImage/book1.jpg', '恐怖直播','恐怖的直播到底会发生什么惊奇故事'),
          Column(
            children: <Widget>[
              _subItem(context, 'adImages/4.jpg', '军装下的温柔', '军装之下有着怎样动人又美好的故事'),
              _subItem(context, 'adImages/5.jpg', '爱是痛情是恶', '爱恨交织错杂的故事')
            ],
          )
        ],
      ),
    );
  }

  Widget _mainItem(BuildContext context, String image, String title, String subTitle){
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(500),
            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60), ScreenUtil().setHeight(20), 7, 0),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: ScreenUtil().setSp(45)
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60), ScreenUtil().setHeight(20), 7, 0),
            width: ScreenUtil().setWidth(500),
            child: Text(
              subTitle,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color.fromRGBO(100, 100, 100, 1),
                fontSize: ScreenUtil().setSp(35)
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(500),
            margin: EdgeInsets.only(top: 7),
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.black54,
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: Offset(-2.0, 2.0),
                ),
              ],
            ),
            child: Image(
              width: ScreenUtil().setWidth(400),
              height: ScreenUtil().setHeight(600),
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }

  Widget _subItem(BuildContext context, String image,String mainTitle, String subTitle){
    return Container(
    margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
            ),
            width: ScreenUtil().setWidth(530),
            child: Text(
              mainTitle,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: ScreenUtil().setSp(40),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(10), 0, ScreenUtil().setHeight(10)),
            decoration: BoxDecoration(
            ),
            width: ScreenUtil().setWidth(530),
            child: Text(
              subTitle,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color.fromRGBO(100, 100, 100, 1),
                fontSize: ScreenUtil().setSp(35),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(60)),
            child: Image(
              width: ScreenUtil().setWidth(500),
              height: ScreenUtil().setHeight(200),
              image: AssetImage(image),
            ),
          )
        ],
      ),
    );
  }
}
