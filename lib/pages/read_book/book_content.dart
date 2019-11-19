import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reader/dao/book_collect_data_manager.dart';
import 'package:flutter_reader/dao/book_read_data_manager.dart';
import 'package:flutter_reader/model/book/book_content_model.dart';
import 'package:flutter_reader/pages/read_book/book_catelog.dart';
import 'package:flutter_reader/tools/color_loader.dart';
import 'package:flutter_reader/tools/colors.dart';
import 'package:flutter_reader/tools/size.dart';
import 'package:flutter_reader/widget/Bubbles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html/parser.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BookContentPage extends StatefulWidget {

  final String _chaId;
  final String _bookId;

  bool _onBookShelf;

  BookContentPage(this._chaId,this._bookId,this._onBookShelf);

  @override
  _BookContentPageState createState() {
    return _BookContentPageState();
  }
}

class _BookContentPageState extends State<BookContentPage> {

  BookContentModel _bookContentModel;
  BookContentData _bookContentData;
  String _bookContentUrl;
  String _chaName;
  String _nextCha;
  String _preCha;


  String _title = '第一章：瑞雪';
  String _content = '11';
  double _textSize = 18.0;


  ///是否正在加载
  bool _isLoading = true;
  ///动画时间
  int _duration = 200;

  ///夜间模式
  bool _isNightModel = false;

  ///夜间模式按钮大小
  static final double _sImagePadding = ScreenUtil().setWidth(80);
  double _imagePadding = _sImagePadding;
  ///加入书架按钮
  static final double _addBookshelfWidth = ScreenUtil().setWidth(375);
  double _addBookshelfPadding = _addBookshelfWidth;
  ///顶部导航栏高度
  double _topHeight = 0;
  ///底部导航栏
  double _bottomHeight = 0;


  bool _canBuy = true;

  @override
  void initState() {
    print('chaId：${widget._chaId}');
    print('bookId:${widget._bookId}');
    loadContent(widget._chaId);
    print(widget._chaId);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadContent(String id){
    _isLoading = true;
    BookReadDao.fetchBookContent(id).then((value){
      setState(() {
        _bookContentModel = value;
        _bookContentData = _bookContentModel.data;
        _chaName = _bookContentData.name;
        _nextCha = _bookContentData.next;
        _preCha = _bookContentData.pre;
        if(_bookContentData.visible == 'U100004')
          {
            _canBuy = false;
            _isLoading = false;
          }
        else
          {
            _bookContentUrl = _bookContentData.url;
            loadFromUrl();
          }
      });
    });
  }

  loadFromUrl(){
    BookReadDao.fetchDataFromUrl(_bookContentUrl).then((value){
      setState(() {
        _content = value.replaceAll('<br />', '\n');
        _isLoading = false;
      });
    });
  }

  addToBookShelf(String id){
    BookCollectDao.getForCollect(id).then((value){
      toast('已经添加到书架');
      setState(() {
        widget._onBookShelf = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _isLoading ? Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Bubbles(),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(1100)),
                child: Column(
                  children: <Widget>[
                    ColorLoader(
                      color1: Colors.redAccent,
                      color2: Colors.green,
                      color3: Colors.amber,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
                      child: Text('请稍等，精彩内容马上呈现',
                        style: TextStyle(fontSize: ScreenUtil().setSp(55)),),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ) : Scaffold(
      backgroundColor: _isNightModel ? Colors.black : Colors.white,
      body: Container(
        child: GestureDetector(
          onTap: (){
            setState(() {

              _imagePadding == 0
                  ? _imagePadding = _sImagePadding
                  : _imagePadding = 0;

              _addBookshelfPadding == 0
                  ? _addBookshelfPadding = _addBookshelfWidth
                  : _addBookshelfPadding = 0;

              _topHeight == ScreenUtil().setHeight(269)
                  ? _topHeight = 0
                  : _topHeight = ScreenUtil().setHeight(269);

              _bottomHeight == ScreenUtil().setHeight(300)
                  ? _bottomHeight = 0
                  : _bottomHeight = ScreenUtil().setHeight(300);
            });
          },
          child:Stack(
            children: <Widget>[
              _bookBgWidget(),
              _canBuy ? ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        right: ScreenUtil().setWidth(60),
                        left: ScreenUtil().setWidth(80)),
                    width: ScreenUtil().setWidth(900),
                    child: Text(
                      _content,
                      style: TextStyle(
                          letterSpacing: 1.5,
                          height: 1.8,
                          fontSize: _textSize,
                          color: _isNightModel ? Colors.grey : Colors.black
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(60),
                        right: ScreenUtil().setWidth(60)),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: MaterialButton(
                            child: Container(
                              child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      _preCha == '' ? toast('已经是第一章了') : loadContent(_preCha);
                                    });
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                          Icons.chevron_left,
                                          color: _isNightModel ? Colors.white : Color(0xffe53935)
                                      ),
                                      Text(
                                        '上一章',
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(50),
                                            color: _isNightModel ? Colors.white : Color(0xffe53935)
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: MaterialButton(
                            child: Container(
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => BookCatalogPage(widget._bookId,widget._onBookShelf)
                                  ));
                                },
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
                                      child: Icon(
                                          Icons.menu,
                                          color: _isNightModel ? Colors.white : Color(0xffe53935)
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                                      child: Text(
                                        '目录',
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(50),
                                            color: _isNightModel ? Colors.white : Color(0xffe53935)
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: MaterialButton(
                            child: Container(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    _nextCha == '' ? toast('已经是最后一章了') : loadContent(_nextCha);
                                  });
                                },
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      '下一章',
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(50),
                                          color: _isNightModel ? Colors.white : Color(0xffe53935)
                                      ),
                                    ),
                                    Icon(
                                        Icons.chevron_right,
                                        color: _isNightModel ? Colors.white : Color(0xffe53935)
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ) : Container(
                  width: ScreenUtil().setWidth(1045),
                  height: ScreenUtil().setHeight(300),
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(800),
                      left: ScreenUtil().setWidth(40),
                      right: ScreenUtil().setWidth(40)),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 10.0,
                          offset: Offset(3.0, 3.0),),
                      ],
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xffb31217),
                          Color(0xffe52d27)
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                child: Center(
                  child: Text('-  书币不足 请充值后阅读  -',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(50),
                    color: Colors.white
                  ),),
                ),
              ),
              _settingWidget(),
              widget._onBookShelf ? Container()
                  : Positioned(
                top: ScreenUtil().setHeight(400),
                right: 0,
                child: Container(
                  width: _addBookshelfWidth,
                  child: AnimatedPadding(
                    padding: EdgeInsets.fromLTRB(_addBookshelfPadding, 0, 0, 0),
                    duration: Duration(milliseconds: _duration),
                    child: GestureDetector(
                      onTap: (){
                        addToBookShelf(widget._bookId);
                      },
                      child: Container(
                        width: _addBookshelfWidth,
                        height: ScreenUtil().setHeight(150),
                        padding: EdgeInsets.only(left: ScreenUtil().setWidth(40),
                        top: ScreenUtil().setHeight(40),
                        bottom: ScreenUtil().setHeight(40),),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(234, 95, 89, 0.8),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(50),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                              child:Text('加入书架',
                              style: TextStyle(color: Colors.white,
                              fontSize: ScreenUtil().setSp(50)),)
                        )
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  ///设置控件
  _settingWidget(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _settingTopBar(),
          Expanded(child: SizedBox()),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(80)),
            width: _sImagePadding * 2,
            height: _sImagePadding * 2,
            child: AnimatedPadding(
              duration: Duration(milliseconds: _duration),
              padding: EdgeInsets.fromLTRB(_imagePadding, _imagePadding, _imagePadding, _imagePadding),
              child: InkWell(
                onTap: (){
                  setState(() {
                    _isNightModel = !_isNightModel;
                  });
                },
                child: ClipOval(
                  child: Container(
                    child:Image(
                      image: AssetImage(_isNightModel ? 'images/白天.png' : 'images/fl_night.png'),
                      width: ScreenUtil().setWidth(120),
                    ),
                  )
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _settingBottomBar()
        ],
      ),
    );
  }

  _settingTopBar(){
    return AnimatedContainer(
      height: _topHeight,
      duration: Duration(milliseconds: _duration),
      color: Color.fromRGBO(234, 95, 89, 0.8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child:Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            ScreenUtil().setWidth(40), ScreenUtil().setHeight(80), ScreenUtil().setWidth(40), 0),
                        child: Image(
                          width: ScreenUtil().setWidth(80),
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          image: AssetImage('images/fl_left.png'),
                        )
                    ),
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(650),
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
                  child: Text(
                    _chaName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(55),
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
            child: InkWell(
              onTap: (){
                ///跳转至目录页
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => BookCatalogPage(widget._bookId,widget._onBookShelf)
                ));
              },
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                    child: Text('目录',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(55),
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                      ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: ScreenUtil().setWidth(60)),
                    child: Image(
                      width: ScreenUtil().setWidth(70),
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      image: AssetImage('images/fl_catalog.png',
                      ),
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
  
  _settingBottomBar(){
    return AnimatedContainer(
      height: _bottomHeight,
      duration: Duration(milliseconds: _duration),
      color: Color.fromRGBO(234, 95, 89, 0.8),
      child: _bottomHeight != ScreenUtil().setHeight(300) ?
      null : Container(
          child: AnimatedContainer(
            duration: Duration(milliseconds: _duration),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(100)),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: ScreenUtil().setWidth(60)),
                          child: Text(
                            "字号",
                            style: TextStyle(

                                color: MyColors.MyWhite,
                                fontSize: ScreenUtil().setSp(60)),
                          ),
                        ),
                      Container(
                        margin: EdgeInsets.only(left: ScreenUtil().setWidth(60)),
                        child: Image.asset(
                          "images/字号变小.png",
                          color: MyColors.MyWhite,
                          width: ScreenUtil().setWidth(60),
                          height: ScreenUtil().setHeight(60),
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(650),
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            valueIndicatorColor: MyColors.textPrimaryColor,
                            inactiveTrackColor: MyColors.MyWhite,
                            activeTrackColor: MyColors.textPrimaryColor,
                            activeTickMarkColor: Colors.transparent,
                            inactiveTickMarkColor: Colors.transparent,
                            trackHeight: 5,
                            thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 8),
                          ),
                          child: Slider(
                            value: _textSize,
                            label: "字号：$_textSize",
                            divisions: 20,
                            min: 10,
                            max: 30,
                            onChanged: (double value) {
                              setState(() {
                                _textSize = value;
                              });
                            },
                            onChangeEnd: (value) {
                              _spSetTextSizeValue(value);
                            },
                          ),
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          "images/字号变大.png",
                          color: MyColors.MyWhite,
                          width: ScreenUtil().setWidth(70),
                          height: ScreenUtil().setHeight(70),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(

                  ),
                )
              ],
            ),
          )
      ),
    );
  }

  ///设置控件隐藏
  void hideSettingWidget(){

  }

  _spSetTextSizeValue(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('textSizeValue', value);
  }

  _bookBgWidget(){
    return !_isNightModel ? Container(
      child: Image(
        fit: BoxFit.fill,
        width: ScreenUtil().setWidth(1125),
        height: ScreenUtil().setHeight(2436),
        image: AssetImage('images/read_bg.png'),
      ),
    ) : Container(
      child: null,
    );
  }

}