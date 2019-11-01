import 'package:flutter/material.dart';
import 'package:flutter_reader/pages/category/category_page.dart';
import 'package:flutter_reader/pages/home/check/check_page.dart';
import 'package:flutter_reader/pages/home/rank/rank_page.dart';
import 'package:flutter_reader/pages/home/recharge/recharge_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FuncWidget extends StatefulWidget {
  FuncWidget({Key key}) : super(key: key);

  @override
  _FuncWidgetState createState() {
    return _FuncWidgetState();
  }
}

class _FuncWidgetState extends State<FuncWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      height: ScreenUtil().setHeight(230),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(6)
          )
      ),
      child: Container(
        padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context){

    List<Widget> items = [
      _item(context, '充值', 'images/充值2@2x.png', _jumpToRecharge),
      _item(context, '分类', 'images/类目 品类 分类 类别.2.png', _jumpToCategory),
      _item(context, '排行榜', 'images/排行榜.png', _jumpToRank),
      _item(context, '签到', 'images/签到@2x.png', _jumpToCheck)
    ];



    return Row(
      //水平均匀排列
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items,
    );
  }

  Widget _item(BuildContext context, String itemTitle, String itemImage, void Function() callback){
    return GestureDetector(
      onTap: (){
        if (callback != null) callback();
      },
      child: Column(
        children: <Widget>[
          Image(
            fit: BoxFit.fitHeight,
            image: AssetImage(itemImage),
            height: ScreenUtil().setHeight(100),
          ),
          Text(
            itemTitle,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(35),
            ),
          )
        ],
      ),
    );
  }

  _jumpToCategory(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => CategoryPage()
    ));
  }

  _jumpToRecharge(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => RechargePage()
    ));
  }

  _jumpToCheck(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => CheckPage()
    ));
  }

  _jumpToRank(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => RankPage()
    ));
  }
}


