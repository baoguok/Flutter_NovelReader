import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RecommendWidget extends StatefulWidget {

  final List<String> _imageList;
  final List<String> _titleList;

  RecommendWidget(this._imageList, this._titleList);


  @override
  _RecommendWidgetState createState() {
    return _RecommendWidgetState();
  }
}

class _RecommendWidgetState extends State<RecommendWidget> {
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
    return Container(
      decoration: BoxDecoration(
          color: Colors.white
      ),
      height: ScreenUtil().setHeight(600),
      child: Row(
        children: <Widget>[
          _subItem(widget._imageList[0], widget._titleList[0]),
          _subItem(widget._imageList[1], widget._titleList[1]),
          _subItem(widget._imageList[2], widget._titleList[2]),
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
              image: NetworkImage(image),
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