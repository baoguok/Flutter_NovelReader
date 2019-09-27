import 'package:flutter/material.dart';
import 'package:flutter_reader/pages/category/category_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class bookShelfDetailPage extends StatefulWidget {
  final String alertMessage;

  const bookShelfDetailPage({Key key, this.alertMessage}) : super(key: key);

  @override
  _bookShelfDetailPageState createState() {
    return _bookShelfDetailPageState();
  }
}

class _bookShelfDetailPageState extends State<bookShelfDetailPage> {
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
    return Scaffold(
      body:
        Container(
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(200)),
          child: Center(
            child: Column(
           children: <Widget>[
             Padding(
               padding: EdgeInsets.only(left: ScreenUtil().setWidth(0)),
               child: Image(
                 height: ScreenUtil().setHeight(400),
                 width: ScreenUtil().setWidth(350),
                 image: AssetImage('images/暂无书籍@2x.png'),
               )
             ),
             Padding(
               padding: EdgeInsets.fromLTRB(
                   0,
                   ScreenUtil().setHeight(15),
                   0, 
                   ScreenUtil().setHeight(10)),
               child: Text(
                 '暂无书籍',
                 style: TextStyle(
                   fontSize: ScreenUtil().setSp(50),
                   color: Colors.black54
                 ),
               ),
             ),
             Container(
               margin: EdgeInsets.fromLTRB(
                   ScreenUtil().setWidth(25),
                   ScreenUtil().setHeight(100),
                   0,
                   ScreenUtil().setHeight(0)
               ),
               child: SizedBox(
                 width: ScreenUtil().setWidth(500),
                 height: ScreenUtil().setHeight(130),
                 child: RaisedButton(
                   onPressed: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder:
                         (context) => CategoryPage()
                       )
                     );
                   },
                   color: Colors.redAccent,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20)
                   ),
                   textColor: Colors.white,
                   child: Text(
                     '去书城看看',
                     style: TextStyle(
                       fontSize: ScreenUtil().setSp(50),
                     ),
                   ),
                 )
               )
             )
           ],
          )
        )
    ),
    );
  }
}