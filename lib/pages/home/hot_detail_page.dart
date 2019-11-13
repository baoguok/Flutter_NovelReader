import 'package:flutter/material.dart';
import 'package:flutter_reader/dao/home_data_manager.dart';
import 'package:flutter_reader/model/home/hot_detail_model.dart';
import 'package:flutter_reader/pages/read_book/book_introduction.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotDetailPage extends StatefulWidget {
  final String channel;
  final String type;

  const HotDetailPage({Key key, this.channel,this.type}) : super(key: key);

  @override
  _HotDetailPageState createState() {
    return _HotDetailPageState();
  }
}

class _HotDetailPageState extends State<HotDetailPage> {
  bool _isLoadData = true;
  HotDetailModel _hotDetailModel;
  List<HotDetailData> _hotDetailData;
  List<String> _bookId = [];
  List<String> _bookName = [];
  List<String> _bookCat = [];
  List<String> _bookImage = [];
  List<String> _bookDesc = [];
  List<String> _bookStatus = [];
  List<int> _bookClicks = [];
  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadData(){
    _bookId.clear();
    _bookName.clear();
    _bookDesc.clear();
    _bookStatus.clear();
    _bookCat.clear();
    _bookImage.clear();
    _bookClicks.clear();
    HomeDao.fetchHotDetail(widget.channel, widget.type).then((value){
      _hotDetailModel = value;
      _hotDetailData = value.data;
      setState(() {
        for(var i = 0; i < _hotDetailData.length; i++){
          _bookId.add(_hotDetailData[i].id);
          _bookName.add(_hotDetailData[i].name);
          _bookImage.add(_hotDetailData[i].image);
          _bookCat.add(_hotDetailData[i].cat);
          _bookClicks.add(_hotDetailData[i].clicks);
          _bookStatus.add(_hotDetailData[i].status);
          _bookDesc.add(_hotDetailData[i].desc);
        }
        _isLoadData = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('热门专区'),
      ),
      body: _isLoadData == true ? Center(
        child: Text('加载中'),
      ) : Container(
        child: ListView.builder(
          itemCount: _hotDetailData.length,
          itemBuilder: (context,index){
            return _getMainItem(_bookId[index], _bookImage[index], _bookName[index], _bookStatus[index], _bookDesc[index], _bookCat[index], _bookClicks[index]);
          },
        ),
      ),
    );
  }

  _getMainItem(String bookId, String imageName, String title, String state, String introduce, String type, int readTimes){
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (BuildContext context){
              return BookInfoPage(channel:widget.channel,bookId: bookId,bookName: title,bookImage: imageName,isHorizontal: false,hasCollect: false,);
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
                width: ScreenUtil().setWidth(280),
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
                        '[${state}]:',
                        style: TextStyle(
                            color: state == '[连载中]:' ? Colors.lightBlue : Colors.orangeAccent
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(4),left: ScreenUtil().setWidth(10)),
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
        child: Row(
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
              margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(60), 0, 0),
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
        )
    );
  }
}