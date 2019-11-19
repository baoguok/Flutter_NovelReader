import 'package:flutter/material.dart';
import 'package:flutter_reader/dao/home_data_manager.dart';
import 'package:flutter_reader/model/home/HotModel.dart';
import 'package:flutter_reader/model/promotion/promotion_config_model.dart';
import 'package:flutter_reader/model/promotion/promotion_data_model.dart';
import 'package:flutter_reader/pages/read_book/book_introduction.dart';
import 'package:flutter_reader/tools/dot_type.dart';
import 'package:flutter_reader/tools/point_loader.dart';
import 'package:flutter_reader/widget/book_hero.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromotionPage extends StatefulWidget {
  final String channel;

  const PromotionPage({Key key, this.channel}) : super(key: key);


  @override
  _PromotionPageState createState() {
    return _PromotionPageState();
  }
}

class _PromotionPageState extends State<PromotionPage> {

  bool _isLoadingConfig = true;
  ProConfigModel _proConfigModel;
  List<ProConfigData> _proConfigData = [];

  bool _isLoadingBook1 = true;
  bool _isLoadingBook2 = true;
  bool _isLoadingBook3 = true;

  List<ProDataK1> _dataList1 = [];
  List<ProDataK2> _dataList2 = [];
  List<ProDataK3> _dataList3 = [];

  List<String> _bookId1 = [];
  List<String> _bookId2 = [];
  List<String> _bookId3 = [];

  List<String> _bookImage1 = [];
  List<String> _bookImage2 = [];
  List<String> _bookImage3 = [];

  List<String> _bookTitle1 = [];
  List<String> _bookTitle2 = [];
  List<String> _bookTitle3 = [];

  List<int> _oldPrice1 = [];
  List<int> _oldPrice2 = [];
  List<int> _oldPrice3 = [];

  List<int> _nowPrice1 = [];
  List<int> _nowPrice2 = [];
  List<int> _nowPrice3 = [];



  @override
  void initState() {
    loadConfig();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadConfig(){
    HomeDao.fetchPromotionConfig().then((value){
      setState(() {
        _proConfigModel = value;
        _proConfigData = value.data;
        _isLoadingConfig = false;
        loadBook();
      });
    });
  }

  loadBook(){
    HomeDao.fetchPromotionBook(int.parse(widget.channel)).then((value){
      setState(() {
        _dataList1 = value.data.k1;
        _dataList2 = value.data.k2;
        _dataList3 = value.data.k3;
        for(int i = 0; i< _dataList1.length;i++){
          _bookId1.add(_dataList1[i].id);
          _bookImage1.add(_dataList1[i].image);
          _bookTitle1.add(_dataList1[i].name);
          _oldPrice1.add(_dataList1[i].originalPrice);
          _nowPrice1.add(_dataList1[i].sellPrice);
        }
        _isLoadingBook1 = false;
        for(int i = 0; i< _dataList2.length;i++){
          _bookId2.add(_dataList2[i].id);
          _bookImage2.add(_dataList2[i].image);
          _bookTitle2.add(_dataList2[i].name);
          _oldPrice2.add(_dataList2[i].originalPrice);
          _nowPrice2.add(_dataList2[i].sellPrice);
        }
        _isLoadingBook2 = false;
        for(int i = 0; i< _dataList3.length;i++){
          _bookId3.add(_dataList3[i].id);
          _bookImage3.add(_dataList3[i].image);
          _bookTitle3.add(_dataList3[i].name);
          _oldPrice3.add(_dataList3[i].originalPrice);
          _nowPrice3.add(_dataList3[i].sellPrice);
        }
        _isLoadingBook3 = false;
      });
    });
  }

  Widget _bookBar1() {
    return _getBookBar(_bookId1, _bookImage1, _bookTitle1, _oldPrice1, _nowPrice1);
}

  Widget _bookBar2() {
    return _getBookBar(_bookId2, _bookImage2, _bookTitle2, _oldPrice2, _nowPrice2);
  }

  Widget _bookBar3() {
    return _getBookBar(_bookId3, _bookImage3, _bookTitle3, _oldPrice3, _nowPrice3);
  }

  Widget _bookLoading(){
    return Container(
      width: ScreenUtil().setWidth(1125),
      height: ScreenUtil().setHeight(600),
      child: Center(
        child: ColorLoader4(
          dotOneColor: Colors.pink,
          dotTwoColor: Colors.amber,
          dotThreeColor: Colors.deepOrange,
          dotType: DotType.square,
          duration: Duration(seconds: 2),
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('特价专区'),
        backgroundColor: Color(0xffe53935),
      ),
      body: _isLoadingConfig ? Container(
        width: ScreenUtil().setWidth(1125),
        height: ScreenUtil().setHeight(1800),
        child: Center(
          child: ColorLoader4(
            dotOneColor: Colors.pink,
            dotTwoColor: Colors.amber,
            dotThreeColor: Colors.deepOrange,
            dotType: DotType.square,
            duration: Duration(seconds: 2),
          )
        ),
      ) : Container(
        child: ListView(
          children: <Widget>[
            _getTitleBar(_proConfigData[0].v),
            _isLoadingBook1 ? _bookLoading() : _proConfigData[0].k == 'k1' ? _bookBar1() : _proConfigData[0].k == 'k2' ? _bookBar2() : _bookBar3(),
            _getTitleBar(_proConfigData[1].v),
            _isLoadingBook2 ? _bookLoading() :_proConfigData[1].k == 'k1' ? _bookBar1() : _proConfigData[1].k == 'k2' ? _bookBar2() : _bookBar3(),
            _getTitleBar(_proConfigData[2].v),
            _isLoadingBook3 ? _bookLoading() :_proConfigData[2].k == 'k1' ? _bookBar1() : _proConfigData[2].k == 'k2' ? _bookBar2() : _bookBar3(),
          ],
        ),
      ),
    );
  }
  
  _getTitleBar(String barName){
    return Container(
      width: ScreenUtil().setWidth(1125),
      height: ScreenUtil().setHeight(130),
      child: Container(
        child: Row (
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
              child: Image(
                image: AssetImage('images/fl_sale.png'),
                width: ScreenUtil().setWidth(80),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(80)),
              child: Text(
                barName,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(50)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _getBookBar(List bookId, List bookImage, List bookTitle, List oldPrice, List nowPrice){
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(20),right: ScreenUtil().setWidth(20)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18))
      ),
      height: ScreenUtil().setHeight(660),
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
        child: Row(
          children: <Widget>[
            _subItem(bookId[0],bookImage[0], bookTitle[0], oldPrice[0], nowPrice[0]),
            _subItem(bookId[1],bookImage[1], bookTitle[1], oldPrice[1], nowPrice[1]),
            _subItem(bookId[2],bookImage[2], bookTitle[2], oldPrice[2], nowPrice[2]),
          ],
        ),
      ),
    );
  }

  _subItem(String bookId, String image, String title, int oldPrice, int nowPrice){
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
      width: ScreenUtil().setWidth(310),
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      child: Column(
        children: <Widget>[
          BookHero(
              book: image,
              height: ScreenUtil().setHeight(400),
              callback: (){
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context){
                      return BookInfoPage(channel: widget.channel,bookId: bookId,bookName: title,bookImage: image,isHorizontal: false,hasCollect: false,);
                    }
                ));
              }
          ),
          Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(35)),
              child:Text(
                  title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    '${nowPrice.toString()}书币',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(33),
                      color: Colors.red
                    ),
                  ),
                ),
                Text(
                  '${oldPrice.toString()}币',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.black38,
                    fontSize: ScreenUtil().setSp(30)
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}