import 'package:flutter/material.dart';
import 'package:flutter_reader/pages/read_book/book_introduction.dart';
import 'package:flutter_reader/widget/book_hero.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RecommendWidget extends StatefulWidget {

  final String _channel;
  final List<String> _bookId;
  final List<String> _imageList;
  final List<String> _titleList;

  RecommendWidget(this._channel,this._bookId,this._imageList, this._titleList);


  @override
  _RecommendWidgetState createState() {
    return _RecommendWidgetState();
  }
}

class _RecommendWidgetState extends State<RecommendWidget> {
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
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(20),right: ScreenUtil().setWidth(20)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18))
      ),
      height: ScreenUtil().setHeight(600),
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
        child: Row(
          children: <Widget>[
            _subItem(widget._bookId[0],widget._imageList[0], widget._titleList[0]),
            _subItem(widget._bookId[1],widget._imageList[1], widget._titleList[1]),
            _subItem(widget._bookId[2],widget._imageList[2], widget._titleList[2]),
          ],
        ),
      ),
    );
  }
  _subItem(String bookId, String image, String title){
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
                      return BookInfoPage(channel: widget._channel,bookId: bookId,bookName: title,bookImage: image,isHorizontal: false,hasCollect: false,);
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