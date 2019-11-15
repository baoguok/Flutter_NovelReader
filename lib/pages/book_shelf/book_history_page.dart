import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reader/dao/book_collect_data_manager.dart';
import 'package:flutter_reader/dao/bookinfo_data_manager.dart';
import 'package:flutter_reader/model/book/book_history_model.dart';
import 'package:flutter_reader/pages/category/category_page.dart';
import 'package:flutter_reader/pages/read_book/book_content.dart';
import 'package:flutter_reader/tools/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookHistoryPage extends StatefulWidget {
  BookHistoryPage({Key key}) : super(key: key);

  @override
  _BookHistoryPageState createState() {
    return _BookHistoryPageState();
  }
}

class _BookHistoryPageState extends State<BookHistoryPage> {

  bool _isLoading = true;
  bool _hasBook = true;
  BookHistoryModel _bookHistoryModel;
  List<BookHistoryData> _bookHistoryData;
  List<String> _bookId = [];
  List<String> _bookName = [];
  List<String> _bookImage = [];
  List<String> _bookStatus = [];
  List<String> _bookChapter = [];
  List<String> _bookProgress = [];

  Color color1 = HexColor("b74093");
  Color color2 = HexColor("#b74093");

  @override
  void initState() {
    loadBook();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadBook() {
    _bookId.clear();
    _bookName.clear();
    _bookImage.clear();
    _bookStatus.clear();
    _bookChapter.clear();
    _bookProgress.clear();
    BookCollectDao.fetchBookHistory().then((value) {
      setState(() {
        _bookHistoryModel = value;
        _bookHistoryData = value.data;
        if (_bookHistoryData.length == 0) {
          _hasBook = false;
        }
        else {
          for (int i = 0; i < _bookHistoryData.length; i++) {
            _bookId.add(_bookHistoryData[i].id);
            _bookName.add(_bookHistoryData[i].name);
            _bookImage.add(_bookHistoryData[i].image);
            _bookStatus.add(_bookHistoryData[i].status);
            _bookChapter.add(_bookHistoryData[i].chapter);
            _bookProgress.add(_bookHistoryData[i].progress);
          }
        }
        _isLoading = false;
      });
    });
  }

  checkHasCollect(String id,int index){
    BookDao.fetchBookinfo(id).then((value){
      bool hasCollect = value.data.scope.length == 0 ? false : true;
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => BookContentPage(_bookChapter[index],_bookId[index],hasCollect)
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _isLoading ? Container(
      width: ScreenUtil().setWidth(1125),
      height: ScreenUtil().setHeight(1800),
      child: Center(
        child: Text('正在加载阅读记录...'),
      ),
    ) : _hasBook == false ? Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(200)),
        child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(0)),
                    child: Image(
                      height: ScreenUtil().setHeight(400),
                      width: ScreenUtil().setWidth(350),
                      image: AssetImage('images/fl_nobook.png'),
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder:
                                        (context) => CategoryPage()
                                )
                            );
                          },
                          color: Color(0xffe53935),
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
    ) : Container(
      height: ScreenUtil().setHeight(1800),
      child: ListView.builder(
        itemCount: _bookHistoryData.length,
        itemBuilder: (context, index) {
          return _getMainItem(
              _bookId[index], _bookName[index], _bookImage[index],
              _bookStatus[index], _bookChapter[index], _bookProgress[index], index);
        },
      ),
    );
  }

  _getMainItem(String bookId, String bookName, String bookImage,
      String bookStatus, String bookCha, String bookProgress, int index) {
    return InkWell(
      onTap: () {
        print('1');
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
                height: 1.27*ScreenUtil().setWidth(280),
                image: NetworkImage(bookImage),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                    width: ScreenUtil().setWidth(700),
                    height: ScreenUtil().setHeight(100),
                    child:  Text(
                      bookName,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(50),
                          fontWeight: FontWeight.w500
                      ),),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(700),
                    child: Text(
                      '阅读至  ${bookProgress}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil().setSp(40)
                      ),
                    ),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(180),
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
                    child: SizedBox(
                      child: RaisedButton(
                        padding: EdgeInsets.all(0),
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18.0)),
                            ),
                        onPressed: (){
                         checkHasCollect(_bookId[index], index);
                        },
                        textColor: Colors.white,
                        child: Container(
                          width: ScreenUtil().setWidth(700),
                          height: ScreenUtil().setHeight(180),
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xffeb3349),
                                  Color(0xfff45c43)
                                ],
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(18.0))
                          ),
                          padding: EdgeInsets.all(0),
                          child:  Container(
                            child: Center(
                              child: Text(
                                  '继续阅读',
                                  style: TextStyle(fontSize: ScreenUtil().setSp(40))
                              ),
                            ),
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