import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reader/dao/book_rank_data_manager.dart';
import 'package:flutter_reader/model/rank/book_rank_detail_model.dart';
import 'package:flutter_reader/model/rank/book_rank_model.dart';
import 'package:flutter_reader/pages/read_book/book_introduction.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RankPage extends StatefulWidget {
  final String channel;

  const RankPage({Key key, this.channel}) : super(key: key);

  @override
  _RankPageState createState() {
    return _RankPageState();
  }
}

class _RankPageState extends State<RankPage> {

  bool _isLoadRankDetail = true;

  String _selectedChannel = '1';

  String _selected = '本周畅销';
  int _selectedId = 1;
  List<String> _sub = <String>['本周畅销','全年畅销','好文热搜','精品短片','经典完结'];
  Map _rankMap = new Map<String,int>();
  RankConfigModel _rankConfigModel;
  List<RankConfigData> _rankConfigData;
  List<int> _rankTypeInt = [];
  List<String> _rankTypeName = [];

  RankDetailModel _rankDetailModel;
  List<RankDetailData> _rankDetailData;
  List<String> _bookId = [];
  List<String> _bookName = [];
  List<String> _bookCat = [];
  List<String> _bookImage = [];
  List<String> _bookDesc = [];
  List<String> _bookStatus = [];
  List<int> _bookClicks = [];


  int currentSex;

  @override
  void initState() {
    loadRankConfig();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

  }

  loadRankConfig(){
    _rankTypeInt.clear();
    _rankTypeName.clear();
    _rankMap.clear();
    BookRankDao.fetchRankConfig().then((value){
      setState(() {
        _rankConfigModel = value;
        _rankConfigData = value.data;
        for(var i = 0;i < _rankConfigData.length;i++){
          _rankTypeInt.add(_rankConfigData[i].k);
          _rankTypeName.add(_rankConfigData[i].v);
          _rankMap[_rankConfigData[i].v] = _rankConfigData[i].k;
        }
        _sub = _rankTypeName;
        _selected = _rankTypeName[0];
        _selectedId = _rankMap[_selected];
        loadRankDetail(_selectedChannel);
      });
    });
  }

  loadRankDetail(String channel){
    _isLoadRankDetail = true;
    setState(() {
      _isLoadRankDetail = true;
    });
    _bookId.clear();
    _bookName.clear();
    _bookDesc.clear();
    _bookStatus.clear();
    _bookCat.clear();
    _bookImage.clear();
    _bookClicks.clear();
    BookRankDao.fetchRankDetail(channel, _selectedId,1).then((value){
      setState(() {
        _rankDetailModel = value;
        _rankDetailData = value.data;
        for(var i = 0; i < _rankDetailData.length; i++){
          _bookId.add(_rankDetailData[i].id);
          _bookName.add(_rankDetailData[i].name);
          _bookImage.add(_rankDetailData[i].image);
          _bookCat.add(_rankDetailData[i].cat);
          _bookClicks.add(_rankDetailData[i].clicks);
          _bookStatus.add(_rankDetailData[i].status);
          _bookDesc.add(_rankDetailData[i].desc);
        }
        _isLoadRankDetail = false;
      });
    });
  }


  Iterable<Widget> get rankCategory sync*{
    for (String choiceSub in _sub){
      yield Padding(
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(10),top: ScreenUtil().setHeight(40)),
        child: ChoiceChip(
          backgroundColor: Colors.black26,
          selectedColor: Color(0xffe53935),
          label: Text(choiceSub),
          labelStyle: TextStyle(),
          materialTapTargetSize: MaterialTapTargetSize.padded,
          onSelected: (bool value){
            setState(() {
              _selected = choiceSub;
              _selectedId = _rankMap[_selected];
              loadRankDetail(_selectedChannel);
            });
          },
          selected: _selected == choiceSub,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('排行榜'),
        backgroundColor: Color(0xffe53935),
      ),
      body: Container(
        width: ScreenUtil().setWidth(1125),
        decoration: BoxDecoration(
          border: Border(right: BorderSide(
            width: 1,
            color: Colors.black12
          ))
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(30),right: ScreenUtil().setWidth(30)),
              decoration: BoxDecoration(
                  border: Border(right: BorderSide(
                      width: 1,
                      color: Colors.black12
                  ))
              ),
              child: Column(
                  children: rankCategory.toList()
              ),
            ),
            Column(
              children: <Widget>[
                _topBar(),
                _bookList()
              ],
            )
          ],
        )
      ),
    );
  }

  _topBar(){
    return Container(
      height: ScreenUtil().setHeight(100),
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      child: CupertinoSegmentedControl(
        onValueChanged: (value){
          setState(() {
            currentSex = value;
            currentSex == 0 ? _selectedChannel = '1' : _selectedChannel = '2';
            loadRankDetail(_selectedChannel);
          });
        },
        groupValue: currentSex,
        children: {
          0:Container(
            width: ScreenUtil().setWidth(200),
            child: Text('男生',
            textAlign: TextAlign.center,),
          ),
          1:Container(
            child: Text('女生'),
          )
        },
      )
      );
  }

  _bookList(){
    return _isLoadRankDetail == true ? Container(
      width: ScreenUtil().setWidth(805),
      child: Text('正在加载...'),
    ) : Container(
        width: ScreenUtil().setWidth(805),
        height: ScreenUtil().setHeight(1950),
        child: ListView.builder(
            itemCount: _bookId.length + 1,
            itemBuilder: (context,index){
                return _getMainItem(
                    _bookId[index],
                    _bookImage[index],
                    _bookName[index],
                    _bookStatus[index],
                    _bookDesc[index],
                    _bookCat[index],
                    _bookClicks[index]);
            })
    );
  }

  _getMainItem(String bookId,String imageName, String title, String state, String introduce, String type, int readTimes){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => BookInfoPage(channel: widget.channel,bookId: bookId,bookName: title,bookImage:imageName ,isHorizontal: false,hasCollect: false,)
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
                  ScreenUtil().setWidth(0),
                  ScreenUtil().setHeight(0)),
              child: Image(
                width: ScreenUtil().setWidth(230),
                height: ScreenUtil().setHeight(300),
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
      width: ScreenUtil().setWidth(510),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(60),right: ScreenUtil().setWidth(100)),
            width: ScreenUtil().setWidth(420),
            height: ScreenUtil().setHeight(100),
            child:  Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w500
              ),),
          ),
          Container(
              width: ScreenUtil().setWidth(500),
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
                            color: state == '连载中' ? Colors.lightBlue : Colors.orangeAccent,
                          fontSize: ScreenUtil().setSp(35)
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(35)),
                      width: ScreenUtil().setWidth(350),
                      height: ScreenUtil().setHeight(100),
                      child: Text(
                        introduce,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: ScreenUtil().setSp(33)
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
      margin: EdgeInsets.only(right: ScreenUtil().setWidth(40),bottom: ScreenUtil().setHeight(10)),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(20), ScreenUtil().setWidth(160), 0),
              width: ScreenUtil().setWidth(130),
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
                    fontSize: ScreenUtil().setSp(25),
                    color: Colors.grey
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(20), 0, 0),
              child: Image(
                width: ScreenUtil().setWidth(50),
                height: ScreenUtil().setHeight(30),
                fit: BoxFit.fill,
                image: AssetImage('images/fl_eye.png'),
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(100),
              margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setHeight(20), 0, 0),
              child: Text(
                readTimes.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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