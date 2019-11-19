import 'package:flutter/material.dart';
import 'package:flutter_reader/dao/search_data_manager.dart';
import 'package:flutter_reader/model/home/search_result_model.dart';
import 'package:flutter_reader/pages/home/home_page.dart';
import 'package:flutter_reader/pages/read_book/book_introduction.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import '../search_bar.dart';


const kTypes = [
  "channelgroup",
  "gs",
  "plane",
  "train",
  "cruise",
  "district",
  "food",
  "hotel",
  "huodong",
  "shop",
  "sight",
  "ticket",
  "travelgroup"
];

const kSearchUrl = "http://appapi.98nice.cn/api/search/book?name=";
class SearchPage extends StatefulWidget {
  final String channel;
  final bool hideLeft;
  final String searchUrl;
  final String keyword;
  final String hint;

  SearchPage({this.channel,this.hideLeft, this.searchUrl=kSearchUrl, this.keyword, this.hint});

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {

  String name = "四中";

  ScrollController _scrollController = ScrollController();
  String keyword;
  SearchModel searchModel;

  @override
  void initState() {

    if (widget.keyword != null) {
      _onTextChange(widget.keyword);
    }

    saveData();

    // 监听滚动
    _scrollController.addListener((){
      // 滚动到最大位置
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // 加载更多数据
      }
    });
    super.initState();
  }


  saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("name", "etiantian");
  }

  readData () async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final theName = preferences.getString("name").toString();
    setState(() {
      name = theName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(),
          Expanded(
            flex: 1,
            child: MediaQuery.removeViewPadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return _item(index);
                },
                itemCount: searchModel?.data?.length ?? 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onTextChange(text) {
    keyword = text;
    if (text.length == 0) {
      setState(() {
        searchModel = null;
      });
      return;
    }
    String url = widget.searchUrl + text;
    SearchDataManager.fetch(url,text).then((SearchModel model)
      {
        setState(() {
          searchModel = model;
        });
    }).catchError((e){
      print("搜索遇到错误:$e");
    });
  }

  _appBar() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0x66000000),Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
          ),
          child: Container(
            padding: EdgeInsets.only(top: 20),
            height: ScreenUtil().setHeight(300),
            decoration: BoxDecoration(
                color: Colors.white
            ),
            child: SearchBar(
              hideLeft: widget.hideLeft,
              defaultText: widget.keyword,
              hint: widget.hint,
              speakClick: (){
                if (Platform.isIOS) {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return HomePage();
                  }));
                }
              },
              leftButtonClick: (){
                Navigator.pop(context);
              },
              onChanged: _onTextChange,
            ),
          ),
        )
      ],
    );
  }

  _item(int index) {
    if (searchModel == null || searchModel.data == null) return null;
    SearchData item = searchModel.data[index];
    return GestureDetector(
      onTap: (){
        ///点击每一个item跳转
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => BookInfoPage(channel: widget.channel,bookId: item.id,bookImage: item.image,bookName: item.name,isHorizontal: false,hasCollect: false,)
        ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.3,color: Colors.grey)),
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(40),right: ScreenUtil().setWidth(80)),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                new BoxShadow(
                color: Colors.black12,
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: Offset(-2.0, 2.0),
                ),
                ],
                ),
                child: Image.network(item.image,
                  width: ScreenUtil().setWidth(300),
                  height: ScreenUtil().setHeight(400),),
              )
            ),
            Container(
              child: _title(item),
            )
          ],
        ),
      ),
    );
  }


  _title(SearchData item){
    if (item == null) {
      return null;
    }
    List<TextSpan> spans = [];
    spans.addAll(_keywordTextSpans(item.name,keyword));
    return RichText(text: TextSpan(children: spans));
  }


  _keywordTextSpans(String word, String keyword) {
    List<TextSpan>spans = [];
    if (word == null || word.length == 0) return spans;
    List<String> arr = word.split(keyword);
    TextStyle normalStyle = TextStyle(fontSize: 16,color: Colors.black87);
    TextStyle keywordStyle = TextStyle(fontSize: 16,color: Color(0xffe53935));

    for (int i = 0; i < arr.length; i++) {
      if ((i + 1) % 2 == 0) {
        spans.add(TextSpan(text: keyword,style: keywordStyle));
      }
      String val = arr[i];
      if (val != null && val.length > 0) {
        spans.add(TextSpan(text: val,style: normalStyle));
      }
    }
    return spans;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}