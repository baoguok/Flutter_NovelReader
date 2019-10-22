

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reader/pages/read_book/book_catelog.dart';
import 'package:flutter_reader/pages/read_book/book_content.dart';
import 'package:flutter_reader/widget/book_hero.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BookInfoPage extends StatefulWidget {

  String bookName;
  String bookImage;
  bool isHorizontal;
  bool hasCollect;
  BookInfoPage({this.bookName,this.bookImage,this.isHorizontal,this.hasCollect});

  @override
  _BookInfoPageState createState() {
    return _BookInfoPageState();
  }
}

class _BookInfoPageState extends State<BookInfoPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('小说主页'),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(1900),
                child: ListView(
                  children: <Widget>[
                    _topWidget(),
                    _briefWidget(),
                    _dictionaryWidget(),
                    _guessYouLike()
                  ],
                ),
              ),
              _bottomReadButton()
            ],
          )
      ),
    );
  }

  _topWidget(){
    return Container(
      color: Colors.white,
        padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
        width: ScreenUtil().setWidth(1125),
        height: ScreenUtil().setHeight(600),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(80)),
              width: ScreenUtil().setWidth(400),
child: BookHero(
  book: widget.bookImage,
  height: ScreenUtil().setHeight(650),
),
//              child: Image(
//                width: ScreenUtil().setWidth(500),
//                image: AssetImage( widget.isHorizontal == true ?  'bookImage/book3.jpg' : widget.bookImage),
//              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(80)),
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(widget.bookName,style: TextStyle(
                        fontSize: ScreenUtil().setSp(55),
                        fontWeight: FontWeight.w600
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text('392822',style: TextStyle(
                              color: Colors.black26,
                              fontSize: ScreenUtil().setSp(48)
                          ),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
                          child: Text('已完结',style: TextStyle(
                              color: Colors.black26,
                              fontSize: ScreenUtil().setSp(48)
                          ),),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text('阅读量',style: TextStyle(
                              color: Colors.black26,
                              fontSize: ScreenUtil().setSp(45)
                          ),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                          child: Text('7686',style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: ScreenUtil().setSp(50)
                          ),),
                        )
                      ],
                    ),
                  ),
//                  InkWell(
//                    onTap: (){
//                      setState(() {
//                        widget.hasCollect = !widget.hasCollect;
//                      });
//                    },
//                    child: Container(
//                      height: ScreenUtil().setHeight(100),
//                      width: ScreenUtil().setWidth(350),
//                      decoration: BoxDecoration(
//                        border: widget.hasCollect == false ? null : Border.all(width: 1,color: Colors.redAccent),
//                          color: widget.hasCollect == false ? Colors.redAccent : Colors.white,
//                          borderRadius: BorderRadius.all(Radius.circular(5))
//                      ),
//                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
//                      child: Row(
//                        children: <Widget>[
//                          Container(
//                            margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
//                            padding: EdgeInsets.only(top: ScreenUtil().setHeight(5)),
//                            child: widget.hasCollect == false ? Image(
//                              width: ScreenUtil().setWidth(60),
//                              color: Colors.white,
//                              image: AssetImage('images/标签.png'),
//                            ) : Image(
//                              width: ScreenUtil().setWidth(60),
//                              image: AssetImage('images/书架.png'),
//                            ),
//                          ),
//                          Container(
//                            margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
//                            child: widget.hasCollect == false ? Text('加入书架',style: TextStyle(fontSize: ScreenUtil().setSp(50),
//                                color: Colors.white),) : Text('已收藏',style: TextStyle(fontSize: ScreenUtil().setSp(50),
//                                color: Colors.redAccent),),
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(150)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(130),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(233, 152, 149, 1),
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                          ),
                          child: Text('两性',style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                          width: ScreenUtil().setWidth(130),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(157, 151, 240, 1),
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                          ),
                          child: Text('美女',style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                          width: ScreenUtil().setWidth(130),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(236, 179, 158, 1),
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                          ),
                          child: Text('爽文',style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }


  _briefWidget(){
    return Container(
      height: ScreenUtil().setHeight(230),
      color: Colors.white,
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(20), left: ScreenUtil().setWidth(80),right: ScreenUtil().setWidth(80)),
      child: Text(
        '一个少女正朝那未被遮掩的窗口处走来，竟见这个少女眉若远山，眼若秋水，琼鼻樱唇，精致白皙的脸上淌着一丝隽秀清丽之色，身材亭亭玉立，玲珑有致，绝对是超一流的清纯美女。',
        style: TextStyle(
          color: Colors.black38
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  _rewardWidget(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
          color: Colors.black26,
      blurRadius: 5.0,
    ),
    ]
      ),
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(80),
        right: ScreenUtil().setWidth(80)),
        height: ScreenUtil().setHeight(200),
        child: Container(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(120)),
                child: Image(
                  width: ScreenUtil().setWidth(120),
                  image: AssetImage('images/打赏.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(80),
                top: ScreenUtil().setHeight(25)),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '我要打赏',
                        style: TextStyle(color: Colors.white,
                        fontSize: ScreenUtil().setSp(60),
                        fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                      child: Text(
                        '小说精彩？点击此处可以打赏作者',style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(35)
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

  _dictionaryWidget(){
    return Container(
      height: ScreenUtil().setHeight(1040),
      color: Colors.white,
      margin:EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(70),
                right: ScreenUtil().setWidth(70)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(150),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 3,
                        color: Colors.redAccent
                      )
                    )
                  ),
                  child: Text('目录',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(50),
                    color: Colors.redAccent
                  ),
                  textAlign: TextAlign.center,),
                ),
                Container(
                  child: Text('更新至第247章 大结局下',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenUtil().setSp(45)
                  ),),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
            child: Column(
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(120),
                  child: ListTile(
                    title: Text('第1章 XXXX'),
                  ),
                ),
                Container(
                  height: ScreenUtil().setHeight(120),
                  child: ListTile(
                    title: Text('第2章  XXXXX'),
                  ),
                ),
                Container(
                  height: ScreenUtil().setHeight(120),
                  child: ListTile(
                    title: Text('第3章  XXXXXX'),
                  ),
                ),
                Container(
                  height: ScreenUtil().setHeight(120),
                  child: ListTile(
                    title: Text('第4章  XXXXX'),
                  ),
                ),
                Container(
                  height: ScreenUtil().setHeight(120),
                  child: ListTile(
                    title: Text('第5章  XXXXX'),
                  ),
                ),
                Container(
                  height: ScreenUtil().setHeight(120),
                  child: ListTile(
                    title: Text('第6章  XXXXX'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
            width: ScreenUtil().setWidth(1000),
            child: Center(
              child: Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(70)),
                width: ScreenUtil().setWidth(400),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => BookCatelogPage()
                    ));
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text('查看完整目录',
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(45),
                              color: Colors.redAccent
                          ),),
                      ),
                      Container(
                        child: Icon(
                          Icons.chevron_right,
                          color: Colors.redAccent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _guessYouLike(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      child:Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(70),
                right: ScreenUtil().setWidth(70)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(250),
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              width: 3,
                              color: Colors.redAccent
                          )
                      )
                  ),
                  child: Text('猜你喜欢',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(50),
                        color: Colors.redAccent
                    ),
                    textAlign: TextAlign.center,),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: ScreenUtil().setWidth(30)),
                        child: Text('换一批',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: ScreenUtil().setSp(45)
                        ),),
                      ),
                      Container(
                        child: Image(
                          width: ScreenUtil().setWidth(50),
                          color: Colors.black54,
                          image: AssetImage('images/刷新.png'),
                        ),
                      )
                    ],
                  )
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                _getMainItem('bookImage/book7.jpg', '情花开','[连载中]:', '郎骑竹马来，绕床弄青梅故事里面没有青梅，只有失散七年的竹马与竹马。再次相遇，可就不能让缘分就这么悄无声息的溜走，一定要','都市娱乐',4785),
                _getMainItem('bookImage/book8.jpg', '爱的彼方','[已完结]:', '你承诺要给我一个没有狂风暴雨的世界但我更希望站到你身和你一同担负起这个国家穿越时空','都市娱乐',7854),
                _getMainItem('bookImage/book9.jpg', '无尽沉沦','[已完结]:', '地球的表面出现了九个巨坑，有人从其中挖出了一口石棺，里面躺着九具衣冠整洁的干尸。一棺九尸，开启了人类最黑暗的末日纪元。红颜薄命，英雄气短。','都市娱乐',5789),
                _getMainItem('bookImage/book10.jpg', '难忘情缘','[已完结]:', '地球的表面出现了九个巨坑，有人从其中挖出了一口石棺，里面躺着九具衣冠整洁的干尸。一棺九尸，开启了人类最黑暗的末日纪元。红颜薄命，英雄气短。','都市娱乐',5789)
              ],
            )
          )
        ],
      ),
    );
  }

  _getMainItem(String imageName, String title, String state, String introduce, String type, int readTimes){
    return Container(
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
              image: AssetImage(imageName),
              fit: BoxFit.fill,
            ),
          ),
          _rightItem(title, state, introduce, type, readTimes)
        ],
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
                image: AssetImage('images/浏览眼睛@2x.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), ScreenUtil().setHeight(60), 0, 0),
              child: Text(
                readTimes.toString(),
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(35),
                    color: Colors.redAccent
                ),
              ),
            )
          ],
        )
    );
  }
  
  _bottomReadButton(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20.0, // has the effect of softening the shadow
            spreadRadius: 5.0, // has the effect of extending the shadow
            offset: Offset(
              10.0, // horizontal, move right 10
              10.0, // vertical, move down 10
            ),
          )
        ]
      ),
      width: ScreenUtil().setWidth(1125),
      height: ScreenUtil().setHeight(236),
      child: Row(
        children: <Widget>[
          Expanded(
          flex: 1,
            child: Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(100)),
                    child: Image(
                      width: ScreenUtil().setWidth(100),
                      color: Colors.redAccent,
                      image: AssetImage('images/标签.png'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                    child: Text('加入书架',style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: ScreenUtil().setSp(50),
                      fontWeight: FontWeight.w500
                    ),),
                  )
                ],
              ),
            ),
        ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: (){
                print('开始阅读');
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return BookContentPage();
                    }
                ));
              },
              child: Container(
                height: ScreenUtil().setHeight(236),
                decoration: BoxDecoration(
                    color: Colors.redAccent
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: ScreenUtil().setWidth(100)),
                      child: Image(
                        width: ScreenUtil().setWidth(100),
                        color: Colors.white,
                        image: AssetImage('images/看书.png'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                      child: Text('开始阅读',style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(50),
                          fontWeight: FontWeight.w500
                      ),),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
