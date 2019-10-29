import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuessWidget extends StatefulWidget {

   final List<String> _imageList;
   final List<String> _titleList;

   GuessWidget(this._imageList, this._titleList);


  @override
  _GuessWidgetState createState() {
    return _GuessWidgetState();
  }
}

class _GuessWidgetState extends State<GuessWidget> {

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
      height: ScreenUtil().setHeight(1175),
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _subItem(widget._imageList[0], widget._titleList[0]),
                _subItem(widget._imageList[1], widget._titleList[1]),
                _subItem(widget._imageList[2], widget._titleList[2])
              ],
            ),
            Row(
              children: <Widget>[
                _subItem(widget._imageList[3], widget._titleList[3]),
                _subItem(widget._imageList[4], widget._titleList[4]),
                _subItem(widget._imageList[5], widget._titleList[5])
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
              image: NetworkImage(image),
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
