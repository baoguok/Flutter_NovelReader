import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VipPage extends StatelessWidget {
  VipPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(1125),
              height: ScreenUtil().setHeight(2436),
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage('images/fl_vipBG.jpg'),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child:Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(100),left: ScreenUtil().setWidth(40)),
                      height: ScreenUtil().setHeight(100),
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(1100),left: ScreenUtil().setWidth(110)),
                    child: InkWell(
                      onTap: (){
                        ///开通会员
                      },
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Image(
                            fit: BoxFit.fill,
                            width: ScreenUtil().setWidth(900),
                            height: ScreenUtil().setHeight(300),
                            image: AssetImage('images/fl_vip.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(100),left: ScreenUtil().setWidth(110)),
                    child: InkWell(
                      onTap: (){
                        ///开通会员
                      },
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Image(
                            fit: BoxFit.fill,
                            width: ScreenUtil().setWidth(900),
                            height: ScreenUtil().setHeight(300),
                            image: AssetImage('images/fl_vip.png'),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
