import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RankPage extends StatefulWidget {
  RankPage({Key key}) : super(key: key);

  @override
  _RankPageState createState() {
    return _RankPageState();
  }
}

class _RankPageState extends State<RankPage> {

  String _selected = '本周畅销';
  List<String> _sub = <String>['本周畅销','全年畅销','好文热搜','精品短片','经典完结'];


  final Map<int, Widget> children = const {
    0: Text('男生'),
    1: Text('女生'),
  };

  int currentSex;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Iterable<Widget> get rankCategory sync*{
    for (String choiceSub in _sub){
      yield Padding(
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(20),top: ScreenUtil().setHeight(40)),
        child: ChoiceChip(
          backgroundColor: Colors.black26,
          selectedColor: Colors.redAccent,
          label: Text(choiceSub),
          labelStyle: TextStyle(),
          materialTapTargetSize: MaterialTapTargetSize.padded,
          onSelected: (bool value){
            print(choiceSub);
            setState(() {
              _selected = value ? choiceSub : 'Colors.red';
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
        backgroundColor: Colors.redAccent,
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
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(40),right: ScreenUtil().setWidth(40)),
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
          });
          print(currentSex);
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
    return Container(
      width: ScreenUtil().setWidth(779),
      height: ScreenUtil().setHeight(1950),
      child: ListView(
        children: <Widget>[
          _getMainItem('bookImage/book19.jpg', '花前月下', '[已完结]:', '林小峰是村里出了名的大傻子，可是忽然某一天，他重新恢复了神智…各位书友要是觉得《花前月下》还不错的话请不要忘记向您QQ群和微博里的朋友推荐哦！', '都市娱乐', 6128),
          _getMainItem('bookImage/book20.jpg', '花露欲滴', '[已完结]:', '在面试时，发现主考官竟是和自己有关系的美女监狱长，走了好运的他进入女子监狱，成了这间监狱里面的唯一一个男管教。 在女子监狱里，女犯人，女管教，女领导，一大波女人接踵而至，让他眼花缭乱应接不暇。', '都市娱乐', 5567),
          _getMainItem('bookImage/book21.jpg', '一世情，两生缘', '[连载中]:', '三年前。在同四王爷楚靖祺大婚前一个月，太傅千金沈茹忽然身染重疾，消香玉陨。四王爷自此性子大变，亦不近女色。三年后。', '都市娱乐', 5736),
          _getMainItem('bookImage/book22.jpg', '迷途的羔羊', '[已完结]:', '命运曾赋予我们每人一双翅膀,鼓励我们在起风的日子里逆风翱翔。无论你曾经是幸运的宠儿还是悲惨的弃儿,都要少一点无用的矜持,多几分无憾的坚持', '都市娱乐', 7789),
          _getMainItem('bookImage/book23.jpg', '幼花的芳香', '[连载中]:', '主角老王,李芳芳《芳香依旧》是作者一身肥肉创作的都市类小说,开了家小卖部的老王,怎么都不会想到自己能与年轻的厂花,产生暧昧', '都市娱乐', 3477),
          _getMainItem('bookImage/book24.jpg', '女性开光师', '[连载中]:', '我所生活的地方，是一个很贫穷很落后的偏远山区。我们村自古就有一个习俗，新娘洞房花烛夜不能见红，否则会给丈夫带来血光之灾。因此，新娘出嫁前必须先由别人帮破瓜，俗称开光。', '都市娱乐', 1432),
        ],
      ),
    );
  }

  _getMainItem(String imageName, String title, String state, String introduce, String type, int readTimes){
    return Container(
      width: ScreenUtil().setWidth(800),
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
              width: ScreenUtil().setWidth(200),
              height: ScreenUtil().setHeight(280),
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
      width: ScreenUtil().setWidth(500),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(60),right: ScreenUtil().setWidth(100)),
            width: ScreenUtil().setWidth(350),
            height: ScreenUtil().setHeight(100),
            child:  Text(
              title,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w500
              ),),
          ),
          Container(
            margin: EdgeInsets.only(right: ScreenUtil().setWidth(40)),
              width: ScreenUtil().setWidth(400),
              height: ScreenUtil().setHeight(120),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        state,
                        style: TextStyle(
                            color: state == '[连载中]:' ? Colors.lightBlue : Colors.orangeAccent,
                          fontSize: ScreenUtil().setSp(35)
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(35)),
                      width: ScreenUtil().setWidth(260),
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
      margin: EdgeInsets.only(right: ScreenUtil().setWidth(40),left: ScreenUtil().setWidth(30),bottom: ScreenUtil().setHeight(10)),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(20), ScreenUtil().setWidth(150), 0),
              width: ScreenUtil().setWidth(120),
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
                image: AssetImage('images/浏览眼睛@2x.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setHeight(20), 0, 0),
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
}