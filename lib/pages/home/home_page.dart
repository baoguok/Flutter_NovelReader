import 'package:flutter/material.dart';
import 'package:flutter_reader/pages/home/connect_widget.dart';
import 'package:flutter_reader/pages/home/func_widget.dart';
import 'package:flutter_reader/pages/home/guess_widget.dart';
import 'package:flutter_reader/pages/home/hot_widget.dart';
import 'package:flutter_reader/pages/home/newbook_widget.dart';
import 'package:flutter_reader/pages/home/recommend_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  final List _bannerList = ['adImages/1.jpg','adImages/2.jpg','adImages/3.jpg'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
            '首页'
        ),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: NotificationListener(
                  child: _listView,
                )
            )
          ],
        ),
      ),
    );
  }

  Widget get _listView{
    return ListView(
      children: <Widget>[
        _banner,
        Padding(
            padding: EdgeInsets.fromLTRB(7, 10, 7, 4),
          child: FuncWidget(),
        ),
        _getIcon('images/热门@2x.png','热门专区'),
        HotWidget(),
        _getIcon('images/推荐@2x.png', '主编推荐'),
        RecommendWidget(),
        _getIcon('images/31_新品@2x.png', '新书抢先'),
        NewBookWidget(),
        _getOtherIcon('images/喜欢@2x.png', '猜你喜欢', 'images/换一批红@2x.png','换一批'),
        GuessWidget(),
        _getIcon('images/联系 (1).png', '联系我们'),
        ConnectWidget()
      ],
    );
  }

  Widget get _banner{
    return Container(
      height: ScreenUtil().setHeight(500),
      child: Swiper(
        itemCount: _bannerList.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: (){print('点击了轮播图');},
            child: Image(
              image: AssetImage(_bannerList[index]),
              fit: BoxFit.fill,
            ),
          );
        },
        pagination: SwiperPagination(),
      ),
    );
  }

   _getIcon(String iconImage, String title){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 7, 0, 7),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 7),
            child: Image(
              width: ScreenUtil().setWidth(48),
              height: ScreenUtil().setWidth(48),
              image: AssetImage(iconImage),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 7),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: ScreenUtil().setSp(55)
              ),
            ),
          )
        ],
      ),
    );
  }

  _getOtherIcon(String leftIcon, String leftTitle, String rightIcon, String rightTitle){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 7, 0, 7),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 7),
            child: Image(
              width: ScreenUtil().setWidth(48),
              height: ScreenUtil().setWidth(48),
              image: AssetImage(leftIcon),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 7),
            child: Text(
                leftTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(55)
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(600)),
            child: Text(
              rightTitle,
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: ScreenUtil().setSp(40)
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 7),
            child: InkWell(
              onTap: (){
                print('换一批');
              },
              child: Image(
                width: ScreenUtil().setWidth(32),
                height: ScreenUtil().setWidth(32),
                image: AssetImage(rightIcon),
              ),
            ),
          )
        ],
      ),
    );
  }
}
