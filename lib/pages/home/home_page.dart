import 'package:flutter/material.dart';
import 'package:flutter_reader/pages/home/connect_widget.dart';
import 'package:flutter_reader/pages/home/func_widget.dart';
import 'package:flutter_reader/pages/home/guess_widget.dart';
import 'package:flutter_reader/pages/home/hot_widget.dart';
import 'package:flutter_reader/pages/home/recommend_widget.dart';
import 'package:flutter_reader/pages/home/search_bar.dart';
import 'package:flutter_reader/widget/loading_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'newbook_widget.dart';


const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '都市言情、武侠修真、';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  final List _bannerList = [
    'adImages/1.jpg',
    'adImages/2.jpg',
    'adImages/3.jpg'
  ];
  TabController _controller;
  List _tabs = ['男生', '女生', '精选'];

  double appBarAlpha = 0;

  bool _loading = false;

  Future<Null> _handleRefesh() async {}

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        body: LoadingContainer(
          isLoading: _loading,
          child: Stack(
            children: <Widget>[
              MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: RefreshIndicator(
                    onRefresh: _handleRefesh,
                    child: NotificationListener(
                        onNotification: (scrollNotification) {
                          if (scrollNotification is ScrollUpdateNotification &&
                              scrollNotification.depth == 0) {
                            _onScroll(scrollNotification.metrics.pixels);
                          }
                        },
                        child: _listView),
                  )),
              _appBar
            ],
          ),
        ));
  }

  Widget get _listView {
    return ListView(
      children: <Widget>[
        _topPadding,
        _getCategory,
        _banner,
        Padding(
          padding: EdgeInsets.fromLTRB(7, 10, 7, 4),
          child: FuncWidget(),
        ),
        _getIcon('images/热门@2x.png', '热门专区'),
        HotWidget(),
        _getIcon('images/推荐@2x.png', '主编推荐'),
        RecommendWidget(),
        _getIcon('images/31_新品@2x.png', '新书抢先'),
        NewBookWidget(),
        _getOtherIcon('images/喜欢@2x.png', '猜你喜欢', 'images/换一批红@2x.png', '换一批'),
        GuessWidget(),
        _getIcon('images/联系 (1).png', '联系我们'),
        ConnectWidget()
      ],
    );
  }

  Widget get _topPadding{
    return Container(
      height: ScreenUtil().setHeight(230),
      decoration: BoxDecoration(
        color: Colors.redAccent
      ),
      child: Container(

      ),
    );
  }

  Widget get _appBar {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                //AppBar渐变遮罩
                colors: [Color(0x66000000), Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
          ),
          child: Container(
              padding: EdgeInsets.fromLTRB(0, 44, 0, 0),
              height: 80,
              decoration: BoxDecoration(
                  color: Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255)
              ),
              child: SearchBar(
                searchBarType: appBarAlpha > 0.2 ? SearchBarType.homeLight :
                SearchBarType.home,
                inputBoxClick: _jumpToSearch,
                speakClick: _jumpToSearch,
                defaultText: SEARCH_BAR_DEFAULT_TEXT,
                leftButtonClick: (){
                },
              )
          ),
        ),
        Container(
          height: appBarAlpha > 0.2 ? 0.5 : 0,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]
          ),
        )
      ],
    );
  }

  Widget get _getCategory{
    return Container(
      decoration: BoxDecoration(
        color: Colors.redAccent
      ),
        child:
        TabBar(
        controller: _controller,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white,
        indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
        width: 3,
        color: Colors.white
    )),
    tabs: _tabs.map((e) => Tab(text: e)).toList()
    ));
  }

  Widget get _banner {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
      height: ScreenUtil().setHeight(400),
      child: Swiper(
          itemCount: _bannerList.length,
          autoplay: true,
          pagination: SwiperPagination(),
          viewportFraction: 0.8,
          scale: 0.9,
          itemBuilder: (BuildContext context, int index) {
            return Container(                     // 用Container实现图片圆角的效果
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_bannerList[index]),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            );
          }
      ),
    );
  }

  _getIcon(String iconImage, String title) {
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

  _getOtherIcon(String leftIcon, String leftTitle, String rightIcon,
      String rightTitle) {
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
              onTap: () {
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


  _jumpToSearch(){}
}

