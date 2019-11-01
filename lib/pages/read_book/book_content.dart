import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reader/pages/read_book/book_catelog.dart';
import 'package:flutter_reader/tools/colors.dart';
import 'package:flutter_reader/tools/size.dart';
import 'package:flutter_reader/widget/Bubbles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookContentPage extends StatefulWidget {
  BookContentPage({Key key}) : super(key: key);

  @override
  _BookContentPageState createState() {
    return _BookContentPageState();
  }
}

class _BookContentPageState extends State<BookContentPage> {

  String _title = '第一章：瑞雪';
  String _content = '刚至寒冬，北楚便迎来第一场大雪。大雪过后，玲珑阁的梅花便迎雪绽放，点点红香在银装素裹的天地间飘荡。\n\n　　“小姐可醒了？大姑娘要来了。”精致厚重的帘子被人撩起，一个穿着嫩绿色夹袄的小丫鬟走了进来，手中捧着一大束半开的红梅，一时间房中弥漫着淡淡梅香。\n\n　　“嘘！”屋内站着一个年龄稍大一点的丫鬟，看着绿衣丫鬟走进来皱了皱眉，低声呵斥道：“小声点！别吵到小姐。”\n\n　　小丫鬟撇了撇嘴，却也不敢说什么，悄悄的走到一旁，将红梅插入书案上白色的陶瓷花瓶中。然后沉声站在大丫鬟的身后，到底是年龄小，不一会，小丫头又压低声音对大丫鬟说：“子衿姐，都这个时辰了，小姐还不醒，莫不是昨日席上喝多了？”\n\n　　子衿看了看旁边的海棠，又看了看沉睡的凤朝阳，问道：“大姑娘何时来？”\n\n　　“白露姐姐方才来传时大姑娘就出门了，现在约摸着要到了。”\n\n　　子衿点了点头，吩咐道：“传洗漱吧。”\n\n　　“好。”海棠撩帘跑了出去。\n\n　　子衿缓步走到床前，撩起薄薄的真丝纱帐，随着纱帘的摆动，便听见一阵阵细碎的铃铛声，奈何床上的人睡得太沉竟没有一丝反应。\n\n　　“小姐，醒醒，大姑娘要来了。”子衿轻唤着凤朝阳，可是此时的她沉睡着，没有丝毫反应。\n\n　　凤朝阳站在奈何桥头，四下茫茫，无路可走，父亲与兄长战死，姐姐也死了，她也自尽了。一切的所有，不过是因为萧与哲昏庸，夺了自己皇叔的妃子。\n\n　　皇叔造反了，势如破竹，将萧与哲的昏庸朝廷一举灭掉，而她作为皇后，她的家人领军抗敌，全部死于战乱。\n\n　　宫殿里，萧与哲失心疯般杀了所有人，包括他费劲心思抢来的宸妃，却将她留作为当萧景尧谈判的筹码。\n\n　　可笑之极！他抢了别人的妻子，最后却想用自己的妻子赎罪吗？\n\n　　突然，远处传来一阵铃铛声，由远至近，从缥缈至清晰，凤朝阳循声望去，混沌之中乍现一束金光，金光中站着一个人，向她招手。\n\n　　凤朝阳顺着光线走去，走近了，才看清是个落魄的道士，衣衫破烂，身形单薄。\n\n　　“姑娘，可是凤朝阳？”道士开口了，竟叫她姑娘？\n\n　　凤朝阳伸手抚上脸颊，自嘲的笑道：“姑娘？哪有我这般模样的姑娘？”\n\n　　那道士没说话，只是拿出一面镜子，那镜子十分精致，不似凡物，纵是凤朝阳贵为皇后多年，见过天下无数珍宝，也被这面镜子的材质与外观所震惊。\n\n　　“姑娘看看镜中的人，可否是你？”\n\n　　凤朝阳接过镜子，缓缓的望向镜中，目光刚落在镜上，便忍不住的浑身颤抖，镜中那个青葱少女不是她是谁！\n\n　　可是！可是她已为人妻多年，死时更是狼狈不堪，怎么会？\n\n　　“道长，这是……”凤朝阳持镜子的手不住颤抖，完全不敢相信镜中景象。\n\n　　“姑娘莫惊，凤凰涅而生，寄灵魂于两生镜之内，以生祭之，可换新生。本道有一位朋友，用两生镜换姑娘新生，前尘往事以落为尘埃，还请姑娘珍重此生，切莫重蹈覆辙。”\n\n　　道士的声音逐渐飘远，凤朝阳只觉头越来越重，恍惚片刻便一头摔倒在地。\n\n　　“好香…”凤朝阳呢喃着，呼吸间鼻中充满了梅花的清香，让她想起玲珑阁外那一片梅林，每至凛冬时节，阁中便充满梅香，香气浓郁可以飘散到府中的每个角落，若是还能能回去便好了。\n\n　　站在一旁的子衿听到凤朝阳好似呢喃，便俯下身轻声问道：“小姐，你说什么？”\n\n　　“好香……”\n\n　　“小姐？醒醒，大姑娘要来了。”子衿提高声音，轻轻的摇晃沉睡的凤朝阳。\n\n　　凤朝阳只觉的有一种力量把她从混沌中拉了出来，一瞬间周围的世界都清晰了，她吃力的缓缓睁开眼睛，入目的是既熟悉又陌生的精致帐纱还有上面一个个晶莹剔透的玉铃铛。\n\n　　泪，一下子涌出了眼眶，凤朝阳呆呆的望着铃铛。\n\n　　“小姐！你怎么了？哪里不舒服吗？不要吓奴婢啊。”站在一旁的子衿看凤朝阳醒来便哭成了泪人，着实吓了一跳，转身便要去请府医，却被凤朝阳一把拉住。\n\n　　“子衿？你怎么在这？”\n\n　　子衿闻言一下子哭了出来：“小姐，您到底说什么，莫不是昨日喝多了伤了脑子？您可千万不要吓奴婢啊！”\n\n　　子衿是凤朝阳的陪嫁丫鬟，上一世为了她死于后宫争斗之中。如今见她站在她的面前，凤朝阳便以为，人死之后，生前相识的人便又聚到一起。\n\n　　“小姐，您千万莫说胡话，好端端的，您怎么会死？”子衿听了，哭的更甚。\n\n　　子衿话一出口，凤朝阳便愣住，突然刚刚奈何桥头的记忆涌了上来。\n\n　　沉吟了许久，她伸手替子衿擦眼泪，温热的液体刺激着她感官，她真的如道士所说，重来一世。真的，还活着……\n\n　　凤朝阳慢慢的起了身，环望着玲珑阁内一件件熟悉无比的摆设。\n\n　　她曾经最爱的妆奁，那窗前的楠木条案上照着她的习惯放着的一束半开红梅，远处的屏风上依旧绣着大朵大朵的海棠花，娇艳艳的填饰着房间。南边的书架上摆满了父亲和姐姐从各处搜集来的好书，只可惜都被她束之高阁，连带着丫鬟们不在意，有些架子上竟会落些浮灰。\n\n　　这里的一切都没有变，还是原来熟悉的模样，熟悉的人，熟悉的事，可是曾经那只顾着自己的幸福，将家人的性命，将家族的荣辱都全然抛在脑后的小女孩不见了。\n\n　　这一次，她要好好保护她的家人，让那些曾经伤害过她的人，一一付出代价。\n\n　　这北楚的天，终究是要变一变了！\n';
  double _textSize = 18.0;


  ///是否正在加载
  bool _isLoading = true;
  ///动画时间
  int _duration = 200;

  ///夜间模式
  bool _isNightModel = false;

  ///夜间模式按钮大小
  static final double _sImagePadding = ScreenUtil().setWidth(80);
  double _imagePadding = _sImagePadding;
  ///加入书架按钮
  static final double _addBookshelfWidth = ScreenUtil().setWidth(375);
  double _addBookshelfPadding = _addBookshelfWidth;
  ///顶部导航栏高度
  double _topHeight = 0;
  ///底部导航栏
  double _bottomHeight = 0;

  bool _isAddBookshelf = false;

  @override
  void initState() {
    super.initState();
    Timer _timer = Timer(Duration(seconds: 5), (){
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _isLoading ? Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Bubbles(),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(1100)),
                child: Column(
                  children: <Widget>[
                    SpinKitPouringHourglass(
                      color: Colors.redAccent,
                      size: 50,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
                      child: Text('请稍等，精彩内容马上呈现',
                        style: TextStyle(fontSize: ScreenUtil().setSp(55)),),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ) : Scaffold(
      backgroundColor: _isNightModel ? Colors.black : Colors.white,
      body: Container(
        child: GestureDetector(
          onTap: (){
            setState(() {

              _imagePadding == 0
                  ? _imagePadding = _sImagePadding
                  : _imagePadding = 0;

              _addBookshelfPadding == 0
                  ? _addBookshelfPadding = _addBookshelfWidth
                  : _addBookshelfPadding = 0;

              _topHeight == ScreenUtil().setHeight(269)
                  ? _topHeight = 0
                  : _topHeight = ScreenUtil().setHeight(269);

              _bottomHeight == ScreenUtil().setHeight(300)
                  ? _bottomHeight = 0
                  : _bottomHeight = ScreenUtil().setHeight(300);
            });
          },
          child:Stack(
            children: <Widget>[
              _bookBgWidget(),
              ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        right: ScreenUtil().setWidth(60),
                        left: ScreenUtil().setWidth(80)),
                    width: ScreenUtil().setWidth(900),
                    child: Text(
                      _content,
                      style: TextStyle(
                        letterSpacing: 1.5,
                          height: 1.5,
                          fontSize: _textSize,
                          color: _isNightModel ? Colors.grey : Colors.black
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(60),
                        right: ScreenUtil().setWidth(60)),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: MaterialButton(
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                      Icons.chevron_left,
                                      color: _isNightModel ? Colors.white : Colors.redAccent
                                  ),
                                  Text(
                                    '上一章',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(50),
                                      color: _isNightModel ? Colors.white : Colors.redAccent
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: MaterialButton(
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
                                    child: Icon(
                                        Icons.menu,
                                        color: _isNightModel ? Colors.white : Colors.redAccent
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                                    child: Text(
                                      '目录',
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(50),
                                          color: _isNightModel ? Colors.white : Colors.redAccent
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: MaterialButton(
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '下一章',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(50),
                                        color: _isNightModel ? Colors.white : Colors.redAccent
                                    ),
                                  ),
                                  Icon(
                                      Icons.chevron_right,
                                      color: _isNightModel ? Colors.white : Colors.redAccent
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              _settingWidget(),
              _isAddBookshelf ? Container()
                  : Positioned(
                top: ScreenUtil().setHeight(400),
                right: 0,
                child: Container(
                  width: _addBookshelfWidth,
                  child: AnimatedPadding(
                    padding: EdgeInsets.fromLTRB(_addBookshelfPadding, 0, 0, 0),
                    duration: Duration(milliseconds: _duration),
                    child: GestureDetector(
                      onTap: (){
                        Fluttertoast.showToast(msg: "加入书架成功", fontSize: 14.0);
                        ///加入书架操作


                        setState(() {
                          _isAddBookshelf = true;
                        });
                      },
                      child: Container(
                        width: _addBookshelfWidth,
                        height: ScreenUtil().setHeight(150),
                        padding: EdgeInsets.only(left: ScreenUtil().setWidth(40),
                        top: ScreenUtil().setHeight(40),
                        bottom: ScreenUtil().setHeight(40),),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(234, 95, 89, 0.8),
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(50),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                              child:Text('加入书架',
                              style: TextStyle(color: Colors.white,
                              fontSize: ScreenUtil().setSp(50)),)
                        )
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  ///设置控件
  _settingWidget(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _settingTopBar(),
          Expanded(child: SizedBox()),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(80)),
            width: _sImagePadding * 2,
            height: _sImagePadding * 2,
            child: AnimatedPadding(
              duration: Duration(milliseconds: _duration),
              padding: EdgeInsets.fromLTRB(_imagePadding, _imagePadding, _imagePadding, _imagePadding),
              child: InkWell(
                onTap: (){
                  setState(() {
                    _isNightModel = !_isNightModel;
                  });
                },
                child: ClipOval(
                  child: Container(
                    child:Image(
                      image: AssetImage(_isNightModel ? 'images/白天.png' : 'images/夜间勿扰.png'),
                      width: ScreenUtil().setWidth(120),
                    ),
                  )
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _settingBottomBar()
        ],
      ),
    );
  }

  _settingTopBar(){
    return AnimatedContainer(
      height: _topHeight,
      duration: Duration(milliseconds: _duration),
      color: Color.fromRGBO(234, 95, 89, 0.8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child:Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            ScreenUtil().setWidth(40), ScreenUtil().setHeight(80), ScreenUtil().setWidth(40), 0),
                        child: Image(
                          width: ScreenUtil().setWidth(80),
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                          image: AssetImage('images/向左.png'),
                        )
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
                  child: Text(
                    _title,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(55),
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
            child: InkWell(
              onTap: (){
                ///跳转至目录页
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => BookCatalogPage('68E37B30E2D8219CBF1F0CCEC5384AEE')
                ));
              },
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                    child: Text('目录',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(55),
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                      ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: ScreenUtil().setWidth(60)),
                    child: Image(
                      width: ScreenUtil().setWidth(70),
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      image: AssetImage('images/目录@2x.png',
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  
  _settingBottomBar(){
    return AnimatedContainer(
      height: _bottomHeight,
      duration: Duration(milliseconds: _duration),
      color: Color.fromRGBO(234, 95, 89, 0.8),
      child: _bottomHeight != ScreenUtil().setHeight(300) ?
      null : Container(
          child: AnimatedContainer(
            duration: Duration(milliseconds: _duration),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(100)),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: ScreenUtil().setWidth(60)),
                          child: Text(
                            "字号",
                            style: TextStyle(

                                color: MyColors.MyWhite,
                                fontSize: ScreenUtil().setSp(60)),
                          ),
                        ),
                      Container(
                        margin: EdgeInsets.only(left: ScreenUtil().setWidth(60)),
                        child: Image.asset(
                          "images/字号变小.png",
                          color: MyColors.MyWhite,
                          width: ScreenUtil().setWidth(60),
                          height: ScreenUtil().setHeight(60),
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(650),
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            valueIndicatorColor: MyColors.textPrimaryColor,
                            inactiveTrackColor: MyColors.MyWhite,
                            activeTrackColor: MyColors.textPrimaryColor,
                            activeTickMarkColor: Colors.transparent,
                            inactiveTickMarkColor: Colors.transparent,
                            trackHeight: 5,
                            thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 8),
                          ),
                          child: Slider(
                            value: _textSize,
                            label: "字号：$_textSize",
                            divisions: 20,
                            min: 10,
                            max: 30,
                            onChanged: (double value) {
                              setState(() {
                                _textSize = value;
                              });
                            },
                            onChangeEnd: (value) {
                              _spSetTextSizeValue(value);
                            },
                          ),
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          "images/字号变大.png",
                          color: MyColors.MyWhite,
                          width: ScreenUtil().setWidth(70),
                          height: ScreenUtil().setHeight(70),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(

                  ),
                )
              ],
            ),
          )
      ),
    );
  }

  ///设置控件隐藏
  void hideSettingWidget(){

  }

  _spSetTextSizeValue(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('textSizeValue', value);
  }

  _bookBgWidget(){
    return !_isNightModel ? Container(
      child: Image(
        fit: BoxFit.fill,
        width: ScreenUtil().setWidth(1125),
        height: ScreenUtil().setHeight(2436),
        image: AssetImage('images/read_bg.png'),
      ),
    ) : Container(
      child: null,
    );
  }

}