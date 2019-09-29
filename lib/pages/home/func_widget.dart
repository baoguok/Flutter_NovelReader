import 'package:flutter/material.dart';
import 'package:flutter_reader/pages/category/category_page.dart';
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
      height: ScreenUtil().setHeight(200),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(6)
          )
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(20),
            ScreenUtil().setHeight(30),
            ScreenUtil().setWidth(20),
            ScreenUtil().setHeight(10)),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context){

    List<Widget> items = [
      _item(context, '充值', 'images/充值2@2x.png', _jumpToCategory),
      _item(context, '分类', 'images/类目 品类 分类 类别.2.png', _jumpToCategory),
      _item(context, '排行榜', 'images/排行榜.png', _jumpToCategory),
      _item(context, '签到', 'images/签到@2x.png', _jumpToCategory)
    ];



    return Row(
      //水平均匀排列
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            image: AssetImage(itemImage),
            height: ScreenUtil().setWidth(100),
            width: ScreenUtil().setWidth(100),
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
}


