import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reader/pages/read_book/book_introduction.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewBookWidget extends StatefulWidget {
  final String _channel;

  final List<String> _newBookId;
  final List<String> _newName;
  final List<String> _newImage;
  final List<String> _newCat;
  final List<String> _newDesc;
  final List<String> _newStatus;
  final List<int> _newClicks;

  NewBookWidget(this._channel,this._newBookId,this._newName, this._newImage, this._newCat, this._newDesc, this._newStatus, this._newClicks);

  @override
  _NewBookWidgetState createState() {
    return _NewBookWidgetState();
  }
}

class _NewBookWidgetState extends State<NewBookWidget> {
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
        height: ScreenUtil().setHeight(1250),
        child: Container(
            child: Column(
              children: <Widget>[
                _getMainItem(widget._newBookId[0],widget._newImage[0], widget._newName[0],'[${widget._newStatus[0]}]:', widget._newDesc[0],widget._newCat[0],widget._newClicks[0]),
                _getMainItem(widget._newBookId[1],widget._newImage[1], widget._newName[1],'[${widget._newStatus[1]}]:', widget._newDesc[1],widget._newCat[1],widget._newClicks[1]),
                _getMainItem(widget._newBookId[2],widget._newImage[2], widget._newName[2],'[${widget._newStatus[2]}]:', widget._newDesc[2],widget._newCat[2],widget._newClicks[2])
              ],
            )
        )
    );
  }
  _getMainItem(String bookId, String imageName, String title, String state, String introduce, String type, int readTimes){
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (BuildContext context){
              return BookInfoPage(channel:widget._channel,bookId: bookId,bookName: title,bookImage: imageName,isHorizontal: false,hasCollect: false,);
            }
        ));
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
                height: ScreenUtil().setHeight(350),
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

  _rightItem(String title, String state, String introduce, String type, int readTimes){
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(700),
            height: ScreenUtil().setHeight(100),
            child:  Text(
              title,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(50),
                  fontWeight: FontWeight.w500
              ),),
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
                            color: state == '[连载中]:' ? Colors.lightBlue : Colors.orangeAccent
                        ),
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
                            fontSize: ScreenUtil().setSp(40)
                        ),
                      )
                  )
                ],
              )
          ),
          _bottom(type, readTimes)
        ],
      ),
    );
  }

  _bottom(String type, int readTimes){
    return Container(
      width: ScreenUtil().setWidth(650),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(50), ScreenUtil().setWidth(320), 0),
              width: ScreenUtil().setWidth(150),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                      style: BorderStyle.solid
                  ),
                  borderRadius:BorderRadius.all(Radius.circular(5.0))
              ),
              child: Text(
                type,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(30),
                    color: Colors.grey
                ),
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
                    child: Image(
                      width: ScreenUtil().setWidth(50),
                      height: ScreenUtil().setHeight(30),
                      fit: BoxFit.fill,
                      image: AssetImage('images/fl_eye.png'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), ScreenUtil().setHeight(60), 0, 0),
                    child: Text(
                      readTimes.toString(),
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(35),
                          color: Color(0xffe53935)
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}