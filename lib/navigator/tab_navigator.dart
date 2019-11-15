import 'package:flutter/material.dart';
import 'package:flutter_reader/pages/book_shelf/bookshelf_page.dart';
import 'package:flutter_reader/pages/category/category_page.dart';
import 'package:flutter_reader/pages/gift/gift_page.dart';
import 'package:flutter_reader/pages/home/home_page.dart';
import 'package:flutter_reader/pages/me/me_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabNavigator extends StatefulWidget {
  TabNavigator({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() {
    return _TabNavigatorState();
  }
}

class _TabNavigatorState extends State<TabNavigator> {
  //底部图标颜色
  final _defaultColor = Colors.grey;
  final _activeColor = Color(0xffe53935);
  int _currentIndex = 0;
  //页面控制器
  final PageController _controller = PageController(
    initialPage: 0,
  );

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
    ScreenUtil.instance = ScreenUtil(width: 1125, height: 2436)..init(context);
    // TODO: implement build
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          BookshelfPage(),
          HomePage(),
          CategoryPage(),
          MePage()
        ],
        //静止左右滑动
        physics: NeverScrollableScrollPhysics(),
      ),
      //底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomItem(Icons.book, '书架', 0),
          _bottomItem(Icons.home, '首页', 1),
          _bottomItem(Icons.photo_library, '分类', 2),
          _bottomItem(Icons.account_box, '我', 3)
        ],
      ),
    );
  }


  //封装底部item
  _bottomItem(IconData iconData, String title, int index){
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: _defaultColor,
      ),
      activeIcon: Icon(
        iconData,
        color: _activeColor,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: _currentIndex != index?_defaultColor:_activeColor
        ),
      )
    );
  }
}