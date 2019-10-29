import 'package:flutter/material.dart';
import 'package:flutter_reader/pages/read_book/book_introduction.dart';
import 'package:flutter_reader/widget/book_hero.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotWidget extends StatefulWidget {
  final List<String> _imageList;
  final List<String> _titleList;
  final List<String> _subTitleList;

  HotWidget(this._imageList, this._titleList ,this._subTitleList);

  @override
  _HotWidgetState createState() {
    return _HotWidgetState();
  }
}

class _HotWidgetState extends State<HotWidget> {
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
      height: ScreenUtil().setHeight(750),
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _mainItem(context ,widget._imageList[0], widget._titleList[0],widget._subTitleList[0]),
          Column(
            children: <Widget>[
              _subItem(context, widget._imageList[1], widget._titleList[1], widget._subTitleList[1]),
              _subItem(context, widget._imageList[2], widget._titleList[2], widget._subTitleList[2])
            ],
          )
        ],
      ),
    );
  }

  Widget _mainItem(BuildContext context, String image, String title, String subTitle){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder:(context) => BookInfoPage(bookName: title,bookImage: image,isHorizontal: false,hasCollect: false,)
        ));
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(500),
              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60), ScreenUtil().setHeight(20), 7, 0),
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setSp(45)
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(60), ScreenUtil().setHeight(20), 7, 0),
              width: ScreenUtil().setWidth(500),
              child: Text(
                subTitle,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Color.fromRGBO(100, 100, 100, 1),
                    fontSize: ScreenUtil().setSp(35)
                ),
              ),
            ),
            BookHero(
                book: image,
                height: ScreenUtil().setHeight(500),
                callback: (){
                  Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (BuildContext context){
                        return BookInfoPage(bookName: title,bookImage: image,isHorizontal: false,hasCollect: false,);
                      }
                  ));
                }
            )
          ],
        ),
      ),
    );
  }

  Widget _subItem(BuildContext context, String image,String mainTitle, String subTitle){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => BookInfoPage(bookName: mainTitle,bookImage: image,isHorizontal: true,hasCollect: false,)
        ));
      },
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
              ),
              width: ScreenUtil().setWidth(530),
              child: Text(
                mainTitle,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(40),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(10), 0, ScreenUtil().setHeight(10)),
              decoration: BoxDecoration(
              ),
              width: ScreenUtil().setWidth(530),
              child: Text(
                subTitle,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color.fromRGBO(100, 100, 100, 1),
                  fontSize: ScreenUtil().setSp(35),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: ScreenUtil().setWidth(60)),
              child: Image(
                width: ScreenUtil().setWidth(500),
                height: ScreenUtil().setHeight(200),
                image: NetworkImage(image),
              ),
            )
          ],
        ),
      ),
    );
  }

}
