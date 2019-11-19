import 'dart:convert';
import 'package:flutter_reader/dao/home_data_manager.dart';
import 'package:flutter_reader/model/home/HotModel.dart';
import 'package:flutter_reader/model/home/NewModel.dart';
import 'package:flutter_reader/model/home/guess_like_model.dart';
import 'package:flutter_reader/model/home/home_banner_model.dart';
import 'package:flutter_reader/model/home/recommend_model.dart';
import 'package:flutter_reader/pages/home/search/search_page.dart';
import 'package:flutter_reader/pages/read_book/book_introduction.dart';
import 'package:flutter_reader/tools/dot_type.dart';
import 'package:flutter_reader/tools/point_loader.dart';
import 'package:http/http.dart' as http;

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


  bool _isLoadingBanner = true;
  HomePageBannerModel _bannerModel;
  List _bannerImageExample = ["https://book-98nice.oss-cn-hangzhou.aliyuncs.com/XDYQ00/3AC256EE6C59096047A25AD75FBB1512/poster.jpg",];
  List _bannerImageLoad = [];
  List<String> _bannerBookId = [];
  List<bannerData> _bannerData = [];

  bool _isLoadingHot = true;
  HotModel _hotModel;
  HotData _hotData;
  String _hotType = '';
  List<Shortcut> _shortcut = [];
  List<String> _hotImage = [];
  List<String> _hotTitle = [];
  List<String> _hotSubTitle = [];
  List<String> _hotBookid = [];

  bool _isLoadingRecommend = true;
  RecommendModel _recommendModel;
  List<RecommendData> _recommendData = [];
  List<String> _recommendImage = [];
  List<String> _recommendTitle = [];
  List<String> _recommendBookId = [];

  bool _isLoadingNew = true;
  NewModel _newModel;
  List<NewData> _newData = [];
  List<String> _newName = [];
  List<String> _newImage = [];
  List<String> _newCat = [];
  List<String> _newDesc = [];
  List<String> _newStatus = [];
  List<int> _newClicks =[];
  List<String> _newBookId = [];

  bool _isLoadingGuess = true;
  GuessModel _guessModel;
  List<GuessData> _guessData = [];
  List<String> _guessImage = [];
  List<String> _guessTitle = [];
  List<String> _guessBookId = [];

  bool _isLoadingConnect = true;
  App _connectModel;
  String _connectTime;
  String _connectQQ;
  String _connectName;
  String _connectImage;

  TabController _controller;
  String channel = '1';
  List _tabs = ['男生', '女生', '精选'];

  double appBarAlpha = 0;

  bool _loading = false;

  Future<Null> _handleRefesh() async {}

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    loadBannerData();
    loadHotData();
    loadGuessData();
    loadNewData();
    loadRecommendData();
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
///加载 轮播图 数据
  loadBannerData(){
    _bannerImageLoad.clear();
    _bannerBookId.clear();
    HomeDao.fetchBanner(channel).then((value){
      setState(() {
        _bannerModel = value;
        _bannerData = _bannerModel.data;
        var i;
        for(i=0;i<_bannerData.length;i++){
          _bannerImageLoad.add(_bannerData[i].image);
          _bannerBookId.add(_bannerData[i].id);
        }
        _isLoadingBanner = false;
      });
    });
  }

  ///加载 热门专区 联系我们 数据
  loadHotData(){
    _hotImage.clear();
    _hotTitle.clear();
    _hotSubTitle.clear();
    _hotBookid.clear();
    _hotType = '';
    HomeDao.fetchHot(channel).then((value){
      _hotModel = value;
      _hotData = value.data;
      _shortcut = _hotData.shortcut;

      _connectModel = _hotData.app;
      _connectTime = _connectModel.time;
      _connectQQ = _connectModel.qq;
      _connectName = _connectModel.name;
      _connectImage = _connectModel.image;

      _hotType = _shortcut[0].listType;

      for(var i = 0 ;i < _shortcut.length; i++){
        _hotImage.add(_shortcut[i].image);
        _hotTitle.add(_shortcut[i].name);
        _hotSubTitle.add(_shortcut[i].hint);
        _hotBookid.add(_shortcut[i].bookId);
      }
      _isLoadingHot =false;
    });
  }

  ///加载 主编推荐 数据
  loadRecommendData(){
    _recommendImage.clear();
    _recommendTitle.clear();
    _recommendBookId.clear();
    HomeDao.fetchRecommend(channel).then((value){
        _recommendModel = value;
        _recommendData = _recommendModel.data;
        for(var i = 0; i < _recommendData.length; i++){
          _recommendImage.add(_recommendData[i].image);
          _recommendTitle.add(_recommendData[i].name);
          _recommendBookId.add(_recommendData[i].id);
        }
        _isLoadingRecommend = false;
    });
  }
  ///加载新书推荐
  loadNewData(){
    _newName.clear();
    _newImage.clear();
    _newCat.clear();
    _newDesc.clear();
    _newStatus.clear();
    _newClicks.clear();
    _newBookId.clear();
    HomeDao.fetchNew(channel).then((value){
      _newModel = value;
      _newData = value.data;
      for(var i = 0; i < _newData.length; i++){
        _newName.add(_newData[i].name);
        _newImage.add(_newData[i].image);
        _newCat.add(_newData[i].cat);
        _newDesc.add(_newData[i].desc);
        _newStatus.add(_newData[i].status);
        _newClicks.add(_newData[i].clicks);
        _newBookId.add(_newData[i].id);
      }
      _isLoadingNew = false;
    });
  }

  ///加载 猜你喜欢 数据
  loadGuessData(){
    _guessImage.clear();
    _guessTitle.clear();
    _guessBookId.clear();
    HomeDao.fetchGuess(channel).then((value){
      setState(() {
        _guessModel = value;
        _guessData = _guessModel.data;
        for(var i = 0; i < _guessData.length; i++){
          _guessImage.add(_guessData[i].image);
          _guessTitle.add(_guessData[i].name);
          _guessBookId.add(_guessData[i].id);
        }
        _isLoadingGuess = false;
      });
    });
  }


  @override
  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;
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
                              child: _listView(topPadding)),
                        )),
                    _appBar(topPadding)
                  ],
                ),
              )
    );
  }

  _listView(double topPad) {
    return ListView(
      children: <Widget>[
        _topPadding(topPad),
        _getCategory,
        _banner,
        Padding(
          padding: EdgeInsets.fromLTRB(7, 10, 7, 4),
          child: FuncWidget(channel: channel,),
        ),
        _getIcon('images/fl_hot.png', '热门专区'),
        _isLoadingHot == true ? Container(
          width: ScreenUtil().setWidth(1125),
          height: ScreenUtil().setHeight(750),
          margin: EdgeInsets.only(left: ScreenUtil().setWidth(20),right: ScreenUtil().setWidth(20)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(18))
          ),
          child: ColorLoader4(
            dotOneColor: Colors.pink,
            dotTwoColor: Colors.amber,
            dotThreeColor: Colors.deepOrange,
            dotType: DotType.square,
            duration: Duration(seconds: 2),
          ),
        ) : HotWidget(channel,_hotType,_hotBookid,_hotImage,_hotTitle,_hotSubTitle),
        _getIcon('images/fl_recommend.png', '主编推荐'),
        _isLoadingRecommend == true ? Container(
          width: ScreenUtil().setWidth(1125),
          height: ScreenUtil().setHeight(600),
          margin: EdgeInsets.only(left: ScreenUtil().setWidth(20),right: ScreenUtil().setWidth(20)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(18))
          ),
          child: ColorLoader4(
            dotOneColor: Colors.pink,
            dotTwoColor: Colors.amber,
            dotThreeColor: Colors.deepOrange,
            dotType: DotType.square,
            duration: Duration(seconds: 2),
          )
        ) : RecommendWidget(channel,_recommendBookId,_recommendImage,_recommendTitle),
        _getIcon('images/fl_new.png', '新书抢先'),
        _isLoadingNew == true ? Container(
          width: ScreenUtil().setWidth(1125),
          height: ScreenUtil().setHeight(1250),
          margin: EdgeInsets.only(left: ScreenUtil().setWidth(20),right: ScreenUtil().setWidth(20)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(18))
          ),
          child: ColorLoader4(
            dotOneColor: Colors.pink,
            dotTwoColor: Colors.amber,
            dotThreeColor: Colors.deepOrange,
            dotType: DotType.square,
            duration: Duration(seconds: 2),
          ),
        ) : NewBookWidget(channel,_newBookId, _newName, _newImage, _newCat, _newDesc, _newStatus, _newClicks),
        _getOtherIcon('images/fl_like.png', '猜你喜欢', 'images/fl_loadOther.png', '换一批'),
        _isLoadingGuess == true ? Container(
          width: ScreenUtil().setWidth(1125),
          height: ScreenUtil().setHeight(1175),
          margin: EdgeInsets.only(left: ScreenUtil().setWidth(20),right: ScreenUtil().setWidth(20)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(18))
          ),
          child: ColorLoader4(
            dotOneColor: Colors.pink,
            dotTwoColor: Colors.amber,
            dotThreeColor: Colors.deepOrange,
            dotType: DotType.square,
            duration: Duration(seconds: 2),
          )
        ) : GuessWidget(channel,_guessBookId, _guessImage, _guessTitle),
        _getIcon('images/fl_connect1.png', '联系我们'),
        _isLoadingHot == true ? SizedBox() : ConnectWidget(_connectTime, _connectQQ, _connectName, _connectImage)
      ],
    );
  }


  _appBar(double topPad) {
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
            padding: EdgeInsets.only(top: 5 + topPad),
              decoration: BoxDecoration(
                  color: Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255)
              ),
              child: SearchBar(
                searchBarType: appBarAlpha > 0.2 ? SearchBarType.homeLight :
                SearchBarType.home,
                inputBoxClick: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => SearchPage(channel: channel,)
                  ));
                },
                speakClick: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => SearchPage(channel: channel,)
                  ));
                },
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

   _topPadding(double topPad){
    return Container(
      height: 40 + topPad,
      color: Color(0xffe53935),
    );
  }

  Widget get _getCategory{
    return Container(
        decoration: BoxDecoration(
            color: Color(0xffe53935)
        ),
        child:
        TabBar(
            controller: _controller,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                    width: 7,
                    color: Colors.white
                )),
            tabs: _tabs.map((e) => Tab(text: e)).toList(),
          onTap: (val){
                switch (val){
                  case 0:{
                    channel = '1';
                    break;
                  }
                  case 1:{
                    channel = '2';
                    break;
                  }
                  case 2:{
                    channel = '2';
                  }
                }

                _isLoadingHot = true;
                _isLoadingNew = true;
                _isLoadingGuess = true;
                _isLoadingRecommend = true;
                _isLoadingBanner = true;
                _isLoadingConnect = true;

                loadBannerData();
                loadHotData();
                loadRecommendData();
                loadNewData();
                loadGuessData();
          },
        ));
  }

  Widget get _banner {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
      height: ScreenUtil().setHeight(400),
      child: Swiper(
          itemCount: _isLoadingBanner == true ? _bannerImageExample.length : _bannerImageLoad.length,
          autoplay: true,
          pagination: SwiperPagination(),
          viewportFraction: 0.8,
          scale: 0.9,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => BookInfoPage(channel: channel,bookId: _bannerBookId[index], hasCollect: false,isHorizontal: true,)
                ));
              },
              child: Container(                     // 用Container实现图片圆角的效果
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(_isLoadingBanner == true ? _bannerImageExample[index] : _bannerImageLoad[index]),
                      fit: BoxFit.fill
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
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
            child: InkWell(
              onTap: (){
                loadGuessData();
              },
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(600)),
                    child: Text(
                      rightTitle,
                      style: TextStyle(
                          color: Color(0xffe53935),
                          fontSize: ScreenUtil().setSp(40)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 7),
                    child: Image(
                      width: ScreenUtil().setWidth(32),
                      height: ScreenUtil().setWidth(32),
                      image: AssetImage(rightIcon),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


}

