import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProtocolDialog extends Dialog {
  var title;
  var dialogText;

  ProtocolDialog({Key key, @required this.title, @required this.dialogText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.fromLTRB(
      ScreenUtil().setWidth(40), 
          ScreenUtil().setHeight(300),
          ScreenUtil().setWidth(40), 
          ScreenUtil().setHeight(350)),
      child: Material(
        //弹窗外部分半透明
        type: MaterialType.transparency,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(40),
                    ScreenUtil().setHeight(100),
                    ScreenUtil().setWidth(40),
                    0),
                child: Text(title,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(60),
                  fontWeight: FontWeight.w500
                ),),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(50),
                    ScreenUtil().setHeight(60),
                    ScreenUtil().setWidth(50),
                    ScreenUtil().setHeight(60)),
                child: Text(
                  dialogText,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(50),
                    height: 1.8
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
