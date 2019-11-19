import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reader/dao/book_collect_data_manager.dart';
import 'package:flutter_reader/dao/bookinfo_data_manager.dart';
import 'package:flutter_reader/model/book/book_cata_info_model.dart';
import 'package:flutter_reader/model/book/book_info_catalog_model.dart';
import 'package:flutter_reader/model/book/bookinfo_model.dart';
import 'package:flutter_reader/model/home/guess_like_model.dart';
import 'package:flutter_reader/pages/read_book/book_catelog.dart';
import 'package:flutter_reader/pages/read_book/book_content.dart';
import 'package:flutter_reader/tools/custom_notification.dart';
import 'package:flutter_reader/widget/book_hero.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

class BookInfoPage extends StatefulWidget {
  final String channel;
  final String bookId;

  String bookName;
  String bookImage;
  bool isHorizontal;
  bool hasCollect;

  BookInfoPage(
      {this.channel,
        this.bookId,
        this.bookName,
        this.bookImage,
        this.isHorizontal,
        this.hasCollect});

  @override
  _BookInfoPageState createState() {
    return _BookInfoPageState();
  }
}

class _BookInfoPageState extends State<BookInfoPage> {
  BookinfoModel _bookinfoModel;
  BookinfoData _bookinfoData;
  String _bookName;
  String _bookDesc;
  String _bookStatus;
  String _bookReloadImage;
  String _bookBuyType;
  int _bookClicks;
  int _bookWords;
  int _bookSellprice;
  int _bookOriginalprice;
  List<String> _bookTags = ['标签'];
  List<String> _bookScope = [];
  bool _isLoadData = true;

  bool _isLoadCataInfo = true;
  CataInfoModel _cataInfoModel;
  CataInfoData _cataInfoData;
  Current _current;
  Last _last;
  String _bookCataName;
  String _currentCha;
  bool _hasReadBefore;

  bool _isLoadCata = true;
  BookInfoCaModel _bookInfoCaModel;
  List<BookInfoCaData> _bookInfoCaData;
  List<String> _bookCata = [];
  List<String> _bookCataId = [];

  bool _isLoadGuess = true;
  GuessModel _guessModel;
  List<GuessData> _guessData = [];
  List<String> _guessBookId = [];
  List<String> _guessBookName = [];
  List<String> _guessBookImage = [];
  List<String> _guessBookCat = [];
  List<String> _guessBookStatus = [];
  List<String> _guessBookDesc = [];
  List<int> _guessBookClicks = [];

  bool _canBuyWhole = false;
  bool _haveBuyBook = false;

  String _bookBuyData;

  @override
  void initState() {
    loadBookinfo();
    loadBookCataInfo();
    loadBookCatalog();
    loadGuess();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadBookinfo() {
    BookDao.fetchBookinfo(widget.bookId).then((value) {
      print(widget.bookId);
      setState(() {
        _bookinfoModel = value;
        _bookinfoData = value.data;
        _bookName = _bookinfoData.name;
        _bookDesc = _bookinfoData.desc;
        _bookStatus = _bookinfoData.status;
        _bookClicks = _bookinfoData.clicks;
        _bookWords = _bookinfoData.words;
        _bookTags = _bookinfoData.tags;
        _bookReloadImage = _bookinfoData.image;
        _bookScope = _bookinfoData.scope;
        _bookBuyType = _bookinfoData.type;
        if (_bookBuyType == 'whole') {
          _bookSellprice = _bookinfoData.sellPrice;
          _bookOriginalprice = _bookinfoData.originalPrice;
          _canBuyWhole = true;
          if(_bookScope.contains('bought')){
            _haveBuyBook = true;
          }
        }
        if (_bookScope.contains('fav')) {
          widget.hasCollect = true;
        }
        _isLoadData = false;
      });
      print(widget.hasCollect);
    });
  }

  loadBookCataInfo() {
    BookDao.fetchCataInfo(widget.bookId).then((value) {
      setState(() {
        _cataInfoData = value.data;
        _last = _cataInfoData.last;
        _current = _cataInfoData.current;
        if (_current != null) {
          _hasReadBefore = true;
          _currentCha = _cataInfoData.current.id;
        } else {
          _hasReadBefore = false;
        }
        _bookCataName = _last.name;
        _isLoadCataInfo = false;
      });
    });
  }

  loadBookCatalog() {
    BookDao.fetchBookInfoCa(widget.bookId).then((value) {
      setState(() {
        _bookInfoCaModel = value;
        _bookInfoCaData = value.data;
        for (var i = 0; i < _bookInfoCaData.length; i++) {
          _bookCata.add(_bookInfoCaData[i].name);
          _bookCataId.add(_bookInfoCaData[i].id);
        }
        _isLoadCata = false;
      });
    });
  }

  loadGuess() {
    _guessBookImage.clear();
    _guessBookStatus.clear();
    _guessBookClicks.clear();
    _guessBookCat.clear();
    _guessBookDesc.clear();
    _guessBookId.clear();
    _guessBookName.clear();
    BookDao.fetchGuess(widget.channel).then((value) {
      setState(() {
        _guessModel = value;
        _guessData = value.data;
        for (var i = 0; i < _guessData.length; i++) {
          _guessBookId.add(_guessData[i].id);
          _guessBookName.add(_guessData[i].name);
          _guessBookCat.add(_guessData[i].cat);
          _guessBookDesc.add(_guessData[i].desc);
          _guessBookClicks.add(_guessData[i].clicks);
          _guessBookStatus.add(_guessData[i].status);
          _guessBookImage.add(_guessData[i].image);
          _isLoadGuess = false;
        }
      });
    });
  }

  addToBookShelf(String id) {
    BookCollectDao.getForCollect(id).then((value) {
      toast('已经添加到书架');
      setState(() {
        widget.hasCollect = true;
      });
    });
  }

  buyThisBook(){
    BookDao.buyBook(widget.bookId).then((value){
      if(value == true){
        toast('购买成功');
        setState(() {
          _haveBuyBook = true;
        });
      }
      else{
        showOverlayNotification((context) {
          return MessageNotification(
            message: messages[0],
            onReply: () {
              OverlaySupportEntry.of(context).dismiss();
            },
          );
        }, duration: Duration(milliseconds: 3000));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('小说主页'),
        backgroundColor: Color(0xffe53935),
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(1950),
                child: ListView(
                  children: <Widget>[
                    _topWidget(),
                    _briefWidget(),
                    _canBuyWhole ? _suggestBuyWidget() : SizedBox.shrink(),
                    _dictionaryWidget(),
                    _guessYouLike()
                  ],
                ),
              ),
              _bottomReadButton()
            ],
          )),
    );
  }

  _topWidget() {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
        width: ScreenUtil().setWidth(1125),
        height: ScreenUtil().setHeight(600),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(80)),
              width: ScreenUtil().setWidth(400),
              child: widget.isHorizontal == false
                  ? BookHero(
                book: widget.bookImage,
                height: 1.27 * ScreenUtil().setWidth(400),
              )
                  : _isLoadData == true
                  ? SizedBox()
                  : BookHero(
                book: _bookReloadImage,
                height: 1.27 * ScreenUtil().setWidth(400),
              ),
//              child: Image(
//                width: ScreenUtil().setWidth(500),
//                image: AssetImage( widget.isHorizontal == true ?  'bookImage/book3.jpg' : widget.bookImage),
//              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(80)),
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(450),
                    child: Text(
                      _isLoadData == true ? '书名' : _bookName,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(55),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            _isLoadData == true ? '字数' : _bookWords.toString(),
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: ScreenUtil().setSp(48)),
                          ),
                        ),
                        Container(
                          margin:
                          EdgeInsets.only(left: ScreenUtil().setWidth(5)),
                          child: Text(
                            _isLoadData == true ? '状态' : _bookStatus,
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: ScreenUtil().setSp(48)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '阅读量',
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: ScreenUtil().setSp(45)),
                          ),
                        ),
                        Container(
                          margin:
                          EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                          child: Text(
                            _isLoadData == true
                                ? '阅读量'
                                : _bookClicks.toString(),
                            style: TextStyle(
                                color: Color(0xffe53935),
                                fontSize: ScreenUtil().setSp(50)),
                          ),
                        )
                      ],
                    ),
                  ),
//                  InkWell(
//                    onTap: (){
//                      setState(() {
//                        widget.hasCollect = !widget.hasCollect;
//                      });
//                    },
//                    child: Container(
//                      height: ScreenUtil().setHeight(100),
//                      width: ScreenUtil().setWidth(350),
//                      decoration: BoxDecoration(
//                        border: widget.hasCollect == false ? null : Border.all(width: 1,color: Color(0xffe53935)),
//                          color: widget.hasCollect == false ? Color(0xffe53935) : Colors.white,
//                          borderRadius: BorderRadius.all(Radius.circular(5))
//                      ),
//                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
//                      child: Row(
//                        children: <Widget>[
//                          Container(
//                            margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
//                            padding: EdgeInsets.only(top: ScreenUtil().setHeight(5)),
//                            child: widget.hasCollect == false ? Image(
//                              width: ScreenUtil().setWidth(60),
//                              color: Colors.white,
//                              image: AssetImage('images/标签.png'),
//                            ) : Image(
//                              width: ScreenUtil().setWidth(60),
//                              image: AssetImage('images/书架.png'),
//                            ),
//                          ),
//                          Container(
//                            margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
//                            child: widget.hasCollect == false ? Text('加入书架',style: TextStyle(fontSize: ScreenUtil().setSp(50),
//                                color: Colors.white),) : Text('已收藏',style: TextStyle(fontSize: ScreenUtil().setSp(50),
//                                color: Color(0xffe53935)),),
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(150)),
                    child: Row(
                      children: _tagWidget(),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  List<Widget> _tagWidget() {
    List<Widget> list = new List();
    var j = _bookTags.length <= 3 ? _bookTags.length : 3;
    for (var i = 0; i < j; i++) {
      list.add(
        Container(
          margin:
          i == 0 ? null : EdgeInsets.only(left: ScreenUtil().setWidth(40)),
          width: ScreenUtil().setWidth(130),
          decoration: BoxDecoration(
            color: i == 1
                ? Color.fromRGBO(233, 152, 149, 1)
                : i == 2
                ? Color.fromRGBO(157, 152, 240, 1)
                : Color.fromRGBO(236, 177, 154, 1),
            borderRadius: BorderRadius.all(Radius.circular(3)),
          ),
          child: Text(
            _bookTags[i],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return list;
  }

  _briefWidget() {
    return Container(
      height: ScreenUtil().setHeight(230),
      color: Colors.white,
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(20),
          left: ScreenUtil().setWidth(80),
          right: ScreenUtil().setWidth(80)),
      child: Text(
        _isLoadData == true ? '描述' : _bookDesc,
        style: TextStyle(color: Colors.black38),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  _suggestBuyWidget(){
    return _haveBuyBook ?  Container(
      width: ScreenUtil().setWidth(1045),
      height: ScreenUtil().setHeight(200),
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20),
          left: ScreenUtil().setWidth(50),
          right: ScreenUtil().setWidth(50)),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10.0,
              offset: Offset(3.0, 3.0),
            ),
          ],
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xfffdfcfb),
              Color(0xffe2d1c3)
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Center(
        child: Text('您已购买全书  可全文免费阅读',
        style: TextStyle(
          color: Color(0xff536976),
          fontWeight: FontWeight.w600,
          fontSize: ScreenUtil().setSp(45)
        ),),
      ),) : InkWell(
      onTap: (){
        buyThisBook();
      },
      child: Container(
        width: ScreenUtil().setWidth(1045),
        height: ScreenUtil().setHeight(200),
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(20),
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
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(700),
              height: ScreenUtil().setHeight(150),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          width: 1,
                          color: Colors.white54
                      )
                  )
              ),
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(40),top: ScreenUtil().setHeight(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      '现在全本购买仅需${_bookSellprice.toString()}书币',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenUtil().setSp(50)
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                    child: Text(
                      '原价： ${_bookOriginalprice.toString()}书币',
                      style: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.w400,
                          fontSize: ScreenUtil().setSp(45)
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(300),
              child: Center(
                child: Text('立即购买',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
                  ),),
              ),
            )
          ],
        ),),
    );
  }

  _rewardWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
            ),
          ]),
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(80), right: ScreenUtil().setWidth(80)),
      height: ScreenUtil().setHeight(200),
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(120)),
              child: Image(
                width: ScreenUtil().setWidth(120),
                image: AssetImage('images/打赏.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(80),
                  top: ScreenUtil().setHeight(25)),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      '我要打赏',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(60),
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                    child: Text(
                      '小说精彩？点击此处可以打赏作者',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(35)),
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

  _dictionaryWidget() {
    return Container(
      height: ScreenUtil().setHeight(1200),
      color: Colors.white,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(70),
                right: ScreenUtil().setWidth(70)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(150),
                  decoration: BoxDecoration(
                      border: Border(
                          left:
                          BorderSide(width: 3, color: Color(0xffe53935)))),
                  child: Text(
                    '目录',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(50),
                        color: Color(0xffe53935)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(500),
                  child: Text(
                    _isLoadCataInfo == true ? '更新至' : '更新至 ${_bookCataName}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil().setSp(45)),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
            child: _isLoadCata == true
                ? Center(
              child: Text('加载目录...'),
            )
                : Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookContentPage(
                                _bookCataId[0],
                                widget.bookId,
                                widget.hasCollect)));
                  },
                  child: Container(
                    height: ScreenUtil().setHeight(140),
                    child: ListTile(
                      title: Text(_bookCata[0]),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookContentPage(
                                _bookCataId[1],
                                widget.bookId,
                                widget.hasCollect)));
                  },
                  child: Container(
                    height: ScreenUtil().setHeight(140),
                    child: ListTile(
                      title: Text(_bookCata[1]),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookContentPage(
                                _bookCataId[2],
                                widget.bookId,
                                widget.hasCollect)));
                  },
                  child: Container(
                    height: ScreenUtil().setHeight(140),
                    child: ListTile(
                      title: Text(_bookCata[2]),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookContentPage(
                                _bookCataId[3],
                                widget.bookId,
                                widget.hasCollect)));
                  },
                  child: Container(
                    height: ScreenUtil().setHeight(140),
                    child: ListTile(
                      title: Text(_bookCata[3]),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookContentPage(
                                _bookCataId[4],
                                widget.bookId,
                                widget.hasCollect)));
                  },
                  child: Container(
                    height: ScreenUtil().setHeight(140),
                    child: ListTile(
                      title: Text(_bookCata[4]),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookContentPage(
                                _bookCataId[5],
                                widget.bookId,
                                widget.hasCollect)));
                  },
                  child: Container(
                    height: ScreenUtil().setHeight(140),
                    child: ListTile(
                      title: Text(_bookCata[5]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
            width: ScreenUtil().setWidth(1000),
            child: Center(
              child: Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(70)),
                width: ScreenUtil().setWidth(400),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookCatalogPage(
                                widget.bookId, widget.hasCollect)));
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '查看完整目录',
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(45),
                              color: Color(0xffe53935)),
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.chevron_right,
                          color: Color(0xffe53935),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _guessYouLike() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(70),
                right: ScreenUtil().setWidth(70)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(250),
                  decoration: BoxDecoration(
                      border: Border(
                          left:
                          BorderSide(width: 3, color: Color(0xffe53935)))),
                  child: Text(
                    '猜你喜欢',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(50),
                        color: Color(0xffe53935)),
                    textAlign: TextAlign.center,
                  ),
                ),
                InkWell(
                  onTap: () {
                    loadGuess();
                  },
                  child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin:
                            EdgeInsets.only(right: ScreenUtil().setWidth(30)),
                            child: Text(
                              '换一批',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: ScreenUtil().setSp(45)),
                            ),
                          ),
                          Container(
                            child: Image(
                              width: ScreenUtil().setWidth(50),
                              color: Colors.black54,
                              image: AssetImage('images/fl_reload.png'),
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
          _isLoadGuess == true
              ? SizedBox()
              : Container(
              child: Column(
                children: <Widget>[
                  _getMainItem(
                      _guessBookId[0],
                      _guessBookImage[0],
                      _guessBookName[0],
                      '[${_guessBookStatus[0]}]:',
                      _guessBookDesc[0],
                      _guessBookCat[0],
                      _guessBookClicks[0]),
                  _getMainItem(
                      _guessBookId[1],
                      _guessBookImage[1],
                      _guessBookName[1],
                      '[${_guessBookStatus[1]}]:',
                      _guessBookDesc[1],
                      _guessBookCat[1],
                      _guessBookClicks[1]),
                  _getMainItem(
                      _guessBookId[2],
                      _guessBookImage[2],
                      _guessBookName[2],
                      '[${_guessBookStatus[2]}]:',
                      _guessBookDesc[2],
                      _guessBookCat[2],
                      _guessBookClicks[2]),
                  _getMainItem(
                      _guessBookId[3],
                      _guessBookImage[3],
                      _guessBookName[3],
                      '[${_guessBookStatus[3]}]:',
                      _guessBookDesc[3],
                      _guessBookCat[3],
                      _guessBookClicks[3])
                ],
              ))
        ],
      ),
    );
  }

  _getMainItem(String bookId, String imageName, String title, String state,
      String introduce, String type, int readTimes) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (BuildContext context) {
          return BookInfoPage(
            channel: widget.channel,
            bookId: bookId,
            bookName: title,
            bookImage: imageName,
            isHorizontal: false,
            hasCollect: false,
          );
        }));
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
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
              margin: EdgeInsets.fromLTRB(
                  ScreenUtil().setWidth(40),
                  ScreenUtil().setHeight(50),
                  ScreenUtil().setWidth(20),
                  ScreenUtil().setHeight(0)),
              child: Image(
                width: ScreenUtil().setWidth(280),
                height: 1.27 * ScreenUtil().setWidth(280),
                image: NetworkImage(imageName),
                fit: BoxFit.fill,
              ),
            ),
            _rightItem(title, state, introduce, type, readTimes)
          ],
        ),
      ),
    );
  }

  _rightItem(String title, String state, String introduce, String type,
      int readTimes) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(700),
            height: ScreenUtil().setHeight(100),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(50),
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
              width: ScreenUtil().setWidth(700),
              height: ScreenUtil().setHeight(120),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        state,
                        style: TextStyle(
                            color: state == '[连载中]:'
                                ? Colors.lightBlue
                                : Colors.orangeAccent),
                      ),
                    ),
                  ),
                  Container(
                      width: ScreenUtil().setWidth(520),
                      child: Text(
                        introduce,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: ScreenUtil().setSp(40)),
                      ))
                ],
              )),
          _bottom(type, readTimes)
        ],
      ),
    );
  }

  _bottom(String type, int readTimes) {
    return Container(
        width: ScreenUtil().setWidth(700),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(
                  0, ScreenUtil().setHeight(50), ScreenUtil().setWidth(320), 0),
              width: ScreenUtil().setWidth(150),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey, width: 1.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: Text(
                type,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(30), color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(60), 0, 0),
              child: Image(
                width: ScreenUtil().setWidth(50),
                height: ScreenUtil().setHeight(30),
                fit: BoxFit.fill,
                image: AssetImage('images/fl_eye.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(0),
                  ScreenUtil().setHeight(60), ScreenUtil().setWidth(20), 0),
              child: Text(
                readTimes.toString(),
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(35), color: Color(0xffe53935)),
              ),
            )
          ],
        ));
  }

  _bottomReadButton() {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 20.0, // has the effect of softening the shadow
              spreadRadius: 5.0, // has the effect of extending the shadow
              offset: Offset(
                10.0, // horizontal, move right 10
                10.0, // vertical, move down 10
              ),
            )
          ]),
          width: ScreenUtil().setWidth(1125),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: widget.hasCollect == false
                    ? InkWell(
                  onTap: () {
                    addToBookShelf(widget.bookId);
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: ScreenUtil().setWidth(100)),
                          child: Image(
                            width: ScreenUtil().setWidth(100),
                            color: Color(0xffe53935),
                            image: AssetImage('images/fl_symbol.png'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: ScreenUtil().setWidth(40)),
                          child: Text(
                            '加入书架',
                            style: TextStyle(
                                color: Color(0xffe53935),
                                fontSize: ScreenUtil().setSp(50),
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                )
                    : Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(100)),
                        child: Image(
                          width: ScreenUtil().setWidth(100),
                          color: Color(0xffe53935),
                          image: AssetImage('images/fl_symbol.png'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(40)),
                        child: Text(
                          '已在书架',
                          style: TextStyle(
                              color: Color(0xffe53935),
                              fontSize: ScreenUtil().setSp(50),
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    print('开始阅读');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return BookContentPage(
                              _hasReadBefore == true ? _currentCha : _bookCataId[0],
                              widget.bookId,
                              widget.hasCollect);
                        }));
                  },
                  child: Container(
                    height: ScreenUtil().setHeight(236),
                    decoration: BoxDecoration(color: Color(0xffe53935)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin:
                          EdgeInsets.only(left: ScreenUtil().setWidth(100)),
                          child: Image(
                            width: ScreenUtil().setWidth(100),
                            color: Colors.white,
                            image: AssetImage('images/fl_read.png'),
                          ),
                        ),
                        Container(
                          margin:
                          EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                          child: Text(
                            _hasReadBefore == true ? '继续阅读' : '开始阅读',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(50),
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
