import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FuncWidget extends StatelessWidget {
  FuncWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setHeight(200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(6)
        )
      ),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context){

    List<Widget> items = [
      _item(context, '充值', 'images/充值2@2x.png'),
      _item(context, '特价', 'images/限免@2x.png'),
      _item(context, '排行榜', 'images/排行榜.png'),
      _item(context, '签到', 'images/签到@2x.png')
    ];



    return Row(
      //水平均匀排列
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }

  Widget _item(BuildContext context, String itemTitle, String itemImage){
    return GestureDetector(
      onTap: (){print('点击了功能按钮');},
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
}
