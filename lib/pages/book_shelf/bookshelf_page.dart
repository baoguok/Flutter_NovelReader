import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reader/dao/book_collect_data_manager.dart';
import 'package:flutter_reader/pages/book_shelf/book_history_page.dart';
import 'package:flutter_reader/pages/book_shelf/book_shelf_detail_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookshelfPage extends StatefulWidget {

  BookshelfPage({Key key}) : super(key: key);

  @override
  _BookshelfPageState createState() {
    return _BookshelfPageState();
  }
}
/*当使用vsync: this的时候，State对象必须with SingleTickerProviderStateMixin或
TickerProviderStateMixin；TickerProviderStateMixin适用于多AnimationController的情
况。
*/
class _BookshelfPageState extends State<BookshelfPage> with
    TickerProviderStateMixin{
  TabController _controller;
  List _tabs = ['我的书架','阅读足迹'];
  bool _isEditing = false;
  bool _hideButton = false;

  final changeNotifier = new StreamController.broadcast();

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    changeNotifier.close();
    super.dispose();
  }


  deleteBook () async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> toDelete = preferences.getStringList("toDelete");
    print(toDelete);
    if(toDelete == null){
      setState(() {
        _isEditing = false;
      });
    }
    else {
      BookCollectDao.deleteBook(toDelete).then((value) {
        setState(() {
        toDelete.clear();
        print(toDelete);
        preferences.setStringList("toDelete", []);
        changeNotifier.sink.add(null);
          _isEditing = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe53935),
        title: Text(
            '书架'
        ),
        actions: <Widget>[
          _hideButton ? SizedBox() : FlatButton(
            textColor: Colors.white,
            onPressed: (){
              setState(() {
                if (_isEditing == true){
                  deleteBook();
                }
                else{
                  _isEditing = true;
                }
              });
            },
            child: Text(_isEditing ? '删除' : '管理',
              style: TextStyle(fontSize: ScreenUtil().setSp(45)),),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          )
        ],
      ),
      body:
      Column(
        children: <Widget>[
          Container(
              color: Colors.white,
              width: ScreenUtil().setWidth(1125),
              height: ScreenUtil().setHeight(150),
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(0)),
              child: TabBar(
                onTap: (index){
                  if(index == 0){
                    setState(() {
                      _hideButton = false;
                    });
                  }
                  else{
                    setState(() {
                      _hideButton = true;
                    });
                  }
                },
                controller: _controller,
                labelColor: Color(0xffe53935),
                unselectedLabelColor: Colors.grey,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3,
                    color: Color(0xffe53935)
                  )
                ),
                tabs: _tabs.map((e) => Tab(text: e)).toList(),
              ),
            ),
          Flexible(
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                bookShelfDetailPage(_isEditing,changeNotifier.stream),
                BookHistoryPage()
              ],
            ),
          )
        ],
      ),
    );
  }
}



