import 'package:flutter/material.dart';
import 'package:flutter_reader/pages/read_book/book_introduction.dart';
import 'package:flutter_reader/widget/book_hero.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuessWidget extends StatefulWidget {
  final String _channel;

   final List<String> _bookId;
   final List<String> _imageList;
   final List<String> _titleList;

   GuessWidget(this._channel,this._bookId,this._imageList, this._titleList);


  @override
  _GuessWidgetState createState() {
    return _GuessWidgetState();
  }
}

class _GuessWidgetState extends State<GuessWidget> {

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
      height: ScreenUtil().setHeight(1175),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(20),right: ScreenUtil().setWidth(20)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18))
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
              child: Row(
                children: <Widget>[
                  _subItem(widget._bookId[0],widget._imageList[0], widget._titleList[0]),
                  _subItem(widget._bookId[1],widget._imageList[1], widget._titleList[1]),
                  _subItem(widget._bookId[2],widget._imageList[2], widget._titleList[2])
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
              child: Row(
                children: <Widget>[
                  _subItem(widget._bookId[3],widget._imageList[3], widget._titleList[3]),
                  _subItem(widget._bookId[4],widget._imageList[4], widget._titleList[4]),
                  _subItem(widget._bookId[5],widget._imageList[5], widget._titleList[5])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _subItem(String id, String image, String title){
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
                  return BookInfoPage(channel:widget._channel,bookId: id,bookName: title,bookImage: image,isHorizontal: false,hasCollect: false,);
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
                style: TextStyle(

                ),
              )
          )
        ],
      ),
    );
  }
}
