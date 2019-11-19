import 'dart:async';
import 'dart:math';

import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reader/dao/book_collect_data_manager.dart';
import 'package:flutter_reader/model/book/book_collect_model.dart';
import 'package:flutter_reader/model/book/bookshelf_model.dart';
import 'package:flutter_reader/pages/book_shelf/bookshelf_page.dart';
import 'package:flutter_reader/pages/category/category_page.dart';
import 'package:flutter_reader/pages/read_book/book_introduction.dart';
import 'package:flutter_reader/tools/dot_type.dart';
import 'package:flutter_reader/tools/point_loader.dart';
import 'package:flutter_reader/widget/book_hero.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class bookShelfDetailPage extends StatefulWidget {
  final bool _isEditing ;

  final Stream shouldTriggerChange;

  bookShelfDetailPage(this._isEditing,this.shouldTriggerChange);


  @override
  _bookShelfDetailPageState createState() {
    return _bookShelfDetailPageState();
  }
}

class _bookShelfDetailPageState extends State<bookShelfDetailPage>  {

  bool _hasBook = true;
  bool _isLoadingBook = true;
  BookShelfModel _bookShelfModel;
  List<BookShelfData> _bookShelfData = [];
  List<String> _bookId = [];
  List<String> _bookName = [];
  List<String> _bookImage = [];

  List<bool> someBooleanValue = [];

  List<String> toDelete = [];

  StreamSubscription streamSubscription;


  @override
  void initState() {
    loadBook();
    streamSubscription = widget.shouldTriggerChange.listen((_) => reload());
    super.initState();
  }

  @override
  didUpdateWidget(bookShelfDetailPage old) {
    super.didUpdateWidget(old);
    // in case the stream instance changed, subscribe to the new one
    if (widget.shouldTriggerChange != old.shouldTriggerChange) {
      streamSubscription.cancel();
      streamSubscription = widget.shouldTriggerChange.listen((_) => loadBook());
    }
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList("toDelete", toDelete);
  }

  loadBook(){
    print('load');
    _isLoadingBook = true;
    _bookId.clear();
    _bookName.clear();
    _bookImage.clear();
    BookCollectDao.fetchBookShelf().then((value){
      if(value.data == null){
        setState(() {
          _hasBook = false;
        });
      }
      else{
        setState(() {
          _bookShelfModel = value;
          _bookShelfData = value.data;
          for(int i =0 ; i < _bookShelfData.length;i++){
            _bookId.add(_bookShelfData[i].id);
            _bookName.add(_bookShelfData[i].name);
            _bookImage.add(_bookShelfData[i].image);
          }
          _hasBook = true;
        });
      }
      _isLoadingBook = false;
    });
  }

  reload(){
    print('load');
    for(int i = 0 ;i<toDelete.length; i++){
      someBooleanValue.removeAt(int.parse(toDelete[i]));
    }
    toDelete = [];
    saveData();
    _isLoadingBook = true;
    _bookId.clear();
    _bookName.clear();
    _bookImage.clear();
    BookCollectDao.fetchBookShelf().then((value){
      if(value.data == null){
        setState(() {
          _hasBook = false;
        });
      }
      else{
        setState(() {
          _bookShelfModel = value;
          _bookShelfData = value.data;
          for(int i =0 ; i < _bookShelfData.length;i++){
            _bookId.add(_bookShelfData[i].id);
            _bookName.add(_bookShelfData[i].name);
            _bookImage.add(_bookShelfData[i].image);
          }
          _hasBook = true;
        });
      }
      _isLoadingBook = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _hasBook == false ? Container(
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
                            onPressed: (){
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
      ) :
      _isLoadingBook == true ? Container(
        height: ScreenUtil().setHeight(1800),
        width: ScreenUtil().setWidth(1125),
        child: Center(
          child: ColorLoader4(
            dotOneColor: Colors.pink,
            dotTwoColor: Colors.amber,
            dotThreeColor: Colors.deepOrange,
            dotType: DotType.square,
            duration: Duration(seconds: 2),
          )
        ),
      ) : SingleChildScrollView(
    child: Container(
    child: GridView.builder(
    shrinkWrap: true,
    itemCount: _bookShelfData.length,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.symmetric(horizontal: 0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 0,
    crossAxisSpacing: 0,
    childAspectRatio: 0.65,
    ),
    itemBuilder: (context,index){
    return _subItem(_bookId[index], _bookImage[index], _bookName[index], index);
    },
    ),
    ),
    ),
    );
  }

  _subItem(String bookId, String image, String title, int index){
    someBooleanValue.add(false);
    return widget._isEditing ? Container(
          margin: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
          width: ScreenUtil().setWidth(310),
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setHeight(400),
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        new BoxShadow(
                          color: Colors.black54,
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                          offset: Offset(-2.0, 2.0),
                        ),
                      ],
                    ),
                    child: Image(
                      image: NetworkImage(image),
                    ),
                  ),
                  Container(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    width: ScreenUtil().setWidth(315),
                    height: ScreenUtil().setHeight(400),
                    child: Center(
                      child: CircularCheckBox(
                        inactiveColor: Colors.white,
                          value: someBooleanValue[index],
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          onChanged: (bool x) {
                            setState(() {
                              someBooleanValue[index] = !someBooleanValue[index];
                            });
                            if(someBooleanValue[index] == true){
                              toDelete.add(index.toString());
                            }
                            else
                            {
                              toDelete.removeAt(index);
                            }
                            saveData();
                          }
                      ),
                    ),
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(35)),
                  child:Text(
                      title
                  )
              )
            ],
          ),
        ) : Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
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
                      return BookInfoPage(channel: '1',bookId: bookId,bookName: title,bookImage: image,isHorizontal: false,hasCollect: false,);
                    }
                ));
              }
          ),
          Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(35)),
              child:Text(
                  title
              )
          )
        ],
      ),
    );
  }

}