import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';

class SortCondition {
  String name;
  bool isSelected;

  SortCondition({this.name, this.isSelected});
}

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() =>
      _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  List<String> _dropDownHeaderItemStrings = ['性别', '类型', '进度', '价格'];
  List<SortCondition> _sexSortConditions = [];
  List<SortCondition> _categorySortConditions = [];
  List<SortCondition> _stateSortConditions = [];
  List<SortCondition> _priceSortConditions = [];

  SortCondition _selectSexSortCondition;
  SortCondition _selectCategorySortCondition;
  SortCondition _selectStateSortCondition;
  SortCondition _selectPriceSortCondition;

  GZXDropdownMenuController _dropdownMenuController =
  GZXDropdownMenuController();

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey _stackKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _sexSortConditions.add(SortCondition(name: '全部', isSelected: true));
    _sexSortConditions.add(SortCondition(name: '男生', isSelected: false));
    _sexSortConditions.add(SortCondition(name: '女生', isSelected: false));
    _selectSexSortCondition = _sexSortConditions[0];

    _categorySortConditions.add(SortCondition(name: '全部', isSelected: true));
    _categorySortConditions.add(SortCondition(name: '都市娱乐', isSelected: false));
    _categorySortConditions.add(SortCondition(name: '玄幻魔法', isSelected: false));
    _categorySortConditions.add(SortCondition(name: '恐怖悬疑', isSelected: false));
    _categorySortConditions.add(SortCondition(name: '游戏竞技', isSelected: false));
    _categorySortConditions.add(SortCondition(name: '武侠修真', isSelected: false));
    _categorySortConditions.add(SortCondition(name: '科幻小说', isSelected: false));
    _categorySortConditions.add(SortCondition(name: '军事历史', isSelected: false));
    _selectCategorySortCondition = _categorySortConditions[0];

    _stateSortConditions.add(SortCondition(name: '全部', isSelected: true));
    _stateSortConditions.add(SortCondition(name: '连载', isSelected: false));
    _stateSortConditions.add(SortCondition(name: '完结', isSelected: false));
    _selectStateSortCondition = _stateSortConditions[0];

    _priceSortConditions.add(SortCondition(name: '全部', isSelected: true));
    _priceSortConditions.add(SortCondition(name: '精选', isSelected: false));
    _priceSortConditions.add(SortCondition(name: '收费', isSelected: false));
    _priceSortConditions.add(SortCondition(name: '免费', isSelected: false));
    _selectPriceSortCondition = _priceSortConditions[0];

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      appBar:AppBar(
            title: Text('分类'),
            backgroundColor: Colors.redAccent,
          ),
      backgroundColor: Colors.white,
      body: Stack(
        key: _stackKey,
        children: <Widget>[
          Column(
            children: <Widget>[
//              SizedBox(height: 20,),
              // 下拉菜单头部
              GZXDropDownHeader(
                // 下拉的头部项，目前每一项，只能自定义显示的文字、图标、图标大小修改
                items: [
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[0]),
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[1]),
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[2]),
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[3]),
                ],
                // GZXDropDownHeader对应第一父级Stack的key
                stackKey: _stackKey,
                // controller用于控制menu的显示或隐藏
                controller: _dropdownMenuController,
                // 当点击头部项的事件，在这里可以进行页面跳转或openEndDrawer
                onItemTap: (index) {

                },
//                // 头部的高度
//                height: 40,
//                // 头部背景颜色
//                color: Colors.red,
//                // 头部边框宽度
//                borderWidth: 1,
//                // 头部边框颜色
//                borderColor: Color(0xFFeeede6),
//                // 分割线高度
//                dividerHeight: 20,
//                // 分割线颜色
//                dividerColor: Color(0xFFeeede6),
//                // 文字样式
//                style: TextStyle(color: Color(0xFF666666), fontSize: 13),
//                // 下拉时文字样式
//                dropDownStyle: TextStyle(
//                  fontSize: 13,
//                  color: Theme.of(context).primaryColor,
//                ),
//                // 图标大小
//                iconSize: 20,
//                // 图标颜色
//                iconColor: Color(0xFFafada7),
//                // 下拉时图标颜色
//                iconDropDownColor: Theme.of(context).primaryColor,
              ),
              Container(
                height: ScreenUtil().setHeight(2000),
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
              )
            ],
          ),
          // 下拉菜单
          GZXDropDownMenu(
            // controller用于控制menu的显示或隐藏
            controller: _dropdownMenuController,
            // 下拉菜单显示或隐藏动画时长
            animationMilliseconds: 500,
            // 下拉菜单，高度自定义，你想显示什么就显示什么，完全由你决定，你只需要在选择后调用_dropdownMenuController.hide();即可
            menus: [
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40.0 * _sexSortConditions.length,
                  dropDownWidget:
                  _buildConditionListWidget(_sexSortConditions, (value) {
                    _selectSexSortCondition = value;
                    _dropDownHeaderItemStrings[0] =
                    _selectSexSortCondition.name == '全部'
                        ? '男生'
                        : _selectSexSortCondition.name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40.0 * _categorySortConditions.length,
                  dropDownWidget:
                  _buildConditionListWidget(_categorySortConditions, (value) {
                    _selectCategorySortCondition = value;
                    _dropDownHeaderItemStrings[1] =
                        _selectCategorySortCondition.name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40.0 * _stateSortConditions.length,
                  dropDownWidget: _buildConditionListWidget(
                      _stateSortConditions, (value) {
                    _selectStateSortCondition = value;
                    _dropDownHeaderItemStrings[2] =
                        _selectStateSortCondition.name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40.0 * _priceSortConditions.length,
                  dropDownWidget: _buildConditionListWidget(
                      _priceSortConditions, (value) {
                    _selectPriceSortCondition = value;
                    _dropDownHeaderItemStrings[3] =
                        _selectPriceSortCondition.name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
            ],
          ),
        ],
      ),
    );
  }

  _buildConditionListWidget(items, void itemOnTap(SortCondition sortCondition)) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      // item 的个数
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 1.0),
      // 添加分割线
      itemBuilder: (BuildContext context, int index) {
        SortCondition goodsSortCondition = items[index];
        return GestureDetector(
          onTap: () {
          for (var value in items) {
            value.isSelected = false;
          }
          goodsSortCondition.isSelected = true;

          itemOnTap(goodsSortCondition);
          },
          child: Container(
//            color: Colors.blue,
            height: 40,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    goodsSortCondition.name,
                    style: TextStyle(
                      color: goodsSortCondition.isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                    ),
                  ),
                ),
                goodsSortCondition.isSelected
                    ? Icon(
                  Icons.check,
                  color: Theme.of(context).primaryColor,
                  size: 16,
                )
                    : SizedBox(),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        );
      },
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
}
