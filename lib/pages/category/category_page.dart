import 'package:flutter/material.dart';
import 'package:flutter_reader/dao/book_category_data_manager.dart';
import 'package:flutter_reader/model/category/category_config_model.dart';
import 'package:flutter_reader/model/category/category_list_model.dart';
import 'package:flutter_reader/pages/read_book/book_introduction.dart';
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

  int _nowSelectedChannel = -1;
  int _nowSelectedCate = -1;
  int _nowSelectedStatus = -1;
  int _nowSelectedType = -1;

  bool _isLoadingConfig = true;
  bool _isLoadingBook = true;
  bool _noBook = false;

  int page = 1;
  bool isPerformingRequest = false;
  ScrollController _scrollController = new ScrollController();

  List<String> _dropDownHeaderItemStrings = ['性别', '类型', '进度', '价格'];
  List<SortCondition> _sexSortConditions = [];
  List<SortCondition> _categorySortConditions = [];
  List<SortCondition> _categorySortConditions2 = [];
  List<SortCondition> _stateSortConditions = [];
  List<SortCondition> _priceSortConditions = [];

  SortCondition _selectSexSortCondition;
  SortCondition _selectCategorySortCondition;
  SortCondition _selectCategorySortCondition2;
  SortCondition _selectStateSortCondition;
  SortCondition _selectPriceSortCondition;

  CateConfigModel _cateConfigModel;
  CateConfigData _cateConfigData;
  CateConfigCate _cateConfigCate;
  List<CateConfigChannel1> _cateConfigChannel1;
  List<CateConfigChannel2> _cateConfigChannel2;
  List<CateConfigChannels> _cateConfigChannels;
  List<CateConfigStatus> _cateConfigStatus;
  List<CateConfigTypes> _cateConfigTypes;

  List<int> _category1k=[];
  List<String> _category1v=[];
  Map<String,int> _category1 = new Map();
  List<int> _category2k=[];
  List<String> _category2v=[];
  Map<String,int> _category2 = new Map();
  List<int> _channelsk=[];
  List<String> _channelsv=[];
  Map<String,int> _channels = new Map();
  List<int> _statusk=[];
  List<String> _statusv=[];
  Map<String,int> _status = new Map();
  List<int> _typek=[];
  List<String> _typev=[];
  Map<String,int> _types = new Map();


  CateListModel _cateListModel;
  List<CateListData> _cateListData;
  List<String> _bookId = [];
  List<String> _bookName = [];
  List<String> _bookCat = [];
  List<String> _bookImage = [];
  List<String> _bookDesc = [];
  List<String> _bookStatus = [];
  List<int> _bookClicks = [];


  GZXDropdownMenuController _dropdownMenuController =
  GZXDropdownMenuController();

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey _stackKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    loadCateConfig();
    loadCateList();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        page += 1;
        loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  loadCateConfig(){
    BookCategoryDao.fetchCateConfig().then((value){
      _cateConfigModel = value;
      _cateConfigData = value.data;
      _cateConfigCate = _cateConfigData.category;
      _cateConfigChannel1 = _cateConfigCate.lchannelOne;
      _cateConfigChannel2 = _cateConfigCate.lchannelTwo;
      _cateConfigChannels = _cateConfigData.channels;
      _cateConfigStatus = _cateConfigData.status;
      _cateConfigTypes = _cateConfigData.types;
      setState(() {
        for(var i = 0; i < _cateConfigChannel1.length; i++){
          _category1k.add(_cateConfigChannel1[i].k);
          _category1v.add(_cateConfigChannel1[i].v);
          _category1[_cateConfigChannel1[i].v] = _cateConfigChannel1[i].k;
        }
        for(var i = 0; i < _cateConfigChannel2.length; i++){
          _category2k.add(_cateConfigChannel2[i].k);
          _category2v.add(_cateConfigChannel2[i].v);
          _category2[_cateConfigChannel2[i].v] = _cateConfigChannel2[i].k;
        }
        for(var i = 0; i < _cateConfigChannels.length; i++){
          _channelsk.add(_cateConfigChannels[i].k);
          _channelsv.add(_cateConfigChannels[i].v);
          _channels[_cateConfigChannels[i].v] = _cateConfigChannels[i].k;
        }
        for(var i = 0; i < _cateConfigStatus.length; i++){
          _statusk.add(_cateConfigStatus[i].k);
          _statusv.add(_cateConfigStatus[i].v);
          _status[_cateConfigStatus[i].v] = _cateConfigStatus[i].k;
        }
        for(var i = 0; i < _cateConfigTypes.length; i++){
          _typek.add(_cateConfigTypes[i].k);
          _typev.add(_cateConfigTypes[i].v);
          _types[_cateConfigTypes[i].v] = _cateConfigTypes[i].k;
        }

        for(int i = 0; i < _channelsv.length; i++){
          if(i==0){
            _sexSortConditions.add(SortCondition(name: _channelsv[i], isSelected: true));
          }
          else
          {
            _sexSortConditions.add(SortCondition(name: _channelsv[i], isSelected: false));
          }
        }
        _selectSexSortCondition = _sexSortConditions[0];

        for(int i = 0; i < _statusv.length; i++){
          if(i==0){
            _stateSortConditions.add(SortCondition(name: _statusv[i], isSelected: true));
          }
          else
          {
            _stateSortConditions.add(SortCondition(name: _statusv[i], isSelected: false));
          }
        }
        _selectStateSortCondition = _stateSortConditions[0];

        for(int i = 0; i < _typev.length; i++){
          if(i==0)
          {
            _priceSortConditions.add(SortCondition(name: _typev[i], isSelected: true));
          }
          else
          {
            _priceSortConditions.add(SortCondition(name: _typev[i], isSelected: false));
          }
        }
        _selectPriceSortCondition = _priceSortConditions[0];

        for(int i = 0; i < _category1v.length;i++){
          if(i==0){
            _categorySortConditions.add(SortCondition(name: _category1v[i], isSelected: true));
          }
          else
          {
            _categorySortConditions.add(SortCondition(name: _category1v[i], isSelected: false));
          }
        }
        _selectCategorySortCondition = _categorySortConditions[0];

        for(int i = 0; i < _category2v.length;i++){
          if(i==0){
            _categorySortConditions2.add(SortCondition(name: _category2v[i], isSelected: true));
          }
          else
          {
            _categorySortConditions2.add(SortCondition(name: _category2v[i], isSelected: false));
          }
        }
        _selectCategorySortCondition2 = _categorySortConditions2[0];

        _isLoadingConfig = false;
      });
    });
  }

  loadCateList(){
    page = 1;
    setState(() {
      _isLoadingBook = true;
    });
    _bookId.clear();
    _bookName.clear();
    _bookDesc.clear();
    _bookStatus.clear();
    _bookCat.clear();
    _bookImage.clear();
    _bookClicks.clear();
    BookCategoryDao.fetchCateList(_nowSelectedChannel, _nowSelectedCate, _nowSelectedStatus, _nowSelectedType, 1).then((value){
      setState(() {
        if(value.data != null) {
          _noBook = false;
          print('11');
          _cateListModel = value;
          _cateListData = value.data;
          for (var i = 0; i < _cateListData.length; i++) {
            _bookId.add(_cateListData[i].id);
            _bookName.add(_cateListData[i].name);
            _bookImage.add(_cateListData[i].image);
            _bookCat.add(_cateListData[i].cat);
            _bookClicks.add(_cateListData[i].clicks);
            _bookStatus.add(_cateListData[i].status);
            _bookDesc.add(_cateListData[i].desc);
          }
        }
        else
          {
            print('22');
            _noBook = true;
          }
        _isLoadingBook = false;
      });
    });
  }

  loadMore(){
    if(!isPerformingRequest){
      setState(() => isPerformingRequest = true);
      BookCategoryDao.fetchCateList(_nowSelectedChannel, _nowSelectedCate, _nowSelectedStatus, _nowSelectedType, page).then((value){
        setState(() {
          if(value.data != null) {
            _noBook = false;
            print('11');
            _cateListModel = value;
            _cateListData = value.data;
            for (var i = 0; i < _cateListData.length; i++) {
              _bookId.add(_cateListData[i].id);
              _bookName.add(_cateListData[i].name);
              _bookImage.add(_cateListData[i].image);
              _bookCat.add(_cateListData[i].cat);
              _bookClicks.add(_cateListData[i].clicks);
              _bookStatus.add(_cateListData[i].status);
              _bookDesc.add(_cateListData[i].desc);
            }
            print(_bookId.length);
          }
          else
          {
            double edge = 50.0;
            double offsetFromBottom = _scrollController.position.maxScrollExtent - _scrollController.position.pixels;
            if (offsetFromBottom < edge) {
              _scrollController.animateTo(
                  _scrollController.offset - (edge -offsetFromBottom),
                  duration: new Duration(milliseconds: 500),
                  curve: Curves.easeOut);
            }
          }
          isPerformingRequest = false;
          _isLoadingBook = false;
        });
      });
    }
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      appBar:AppBar(
            title: Text('分类'),
            backgroundColor: Color(0xffe53935),
          ),
      backgroundColor: Colors.white,
      body: _isLoadingConfig == true ? Center(
        child: Text('正在加载分类配置'),
      ) : Stack(
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
              ),
              _isLoadingBook == true ? Container(
                height: ScreenUtil().setHeight(1700),
                child: Center(
                  child: Text('加载中...'),
                ),
              ) : _noBook == true ? Container(
                height: ScreenUtil().setHeight(1900),
                child: Center(
                  child: Text('没有符合筛选条件的书籍'),
                ),
              ) : Container(
                height: ScreenUtil().setHeight(1761),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _bookId.length + 1,
                  itemBuilder: (context,index){
                    if (index == _bookId.length) {
                      return _buildProgressIndicator();
                    }
                    else {
                      return _getMainItem(
                          _bookId[index],
                          _bookImage[index],
                          _bookName[index],
                          _bookStatus[index],
                          _bookDesc[index],
                          _bookCat[index],
                          _bookClicks[index]);
                    }
                  },
                ),
              ),
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
                    var i = _channels[value.name];
                    setState(() {
                      _nowSelectedChannel = i;
                    });

                    loadCateList();

                    _selectSexSortCondition = value;
                    _dropDownHeaderItemStrings[0] =
                    _selectSexSortCondition.name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: _nowSelectedChannel == 1 ? 40.0 * _categorySortConditions.length : 40.0 * _categorySortConditions2.length,
                  dropDownWidget:
                  _buildConditionListWidget(_nowSelectedChannel == 1 ?_categorySortConditions : _categorySortConditions2, (value) {
                    var i;
                    if(_nowSelectedChannel == 1){
                       i = _category1[value.name];
                    }
                    else{
                      i = _category2[value.name];
                    }
                    _nowSelectedCate = i;

                    loadCateList();

                    _nowSelectedChannel == 1 ? _selectCategorySortCondition = value : _selectCategorySortCondition2 = value;
                    _dropDownHeaderItemStrings[1] =
                    _nowSelectedChannel == 1 ? _selectCategorySortCondition.name : _selectCategorySortCondition2.name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40.0 * _stateSortConditions.length,
                  dropDownWidget: _buildConditionListWidget(
                      _stateSortConditions, (value) {
                    var i = _status[value.name];
                    print('status:${i}');
                    _nowSelectedStatus = i;

                    loadCateList();

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
                        var i = _types[value.name];
                        print('type:${i}');
                        _nowSelectedType = i;

                        loadCateList();

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

  _getMainItem(String bookId,String imageName, String title, String state, String introduce, String type, int readTimes){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => BookInfoPage(channel: _nowSelectedChannel == 1 ? '1' : '2',bookId: bookId,bookName: title,bookImage: imageName,isHorizontal: false,hasCollect: false,)
        ));
      },
      child: Container(
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
                height: 1.27*ScreenUtil().setWidth(280),
                image: NetworkImage(imageName),
                fit: BoxFit.fill,
              ),
            ),
            _rightItem(title, state, introduce, type, readTimes)
          ],
        ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '[${state}]:',
                        style: TextStyle(
                            color: state == '连载中' ? Colors.lightBlue : Colors.orangeAccent
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
                image: AssetImage('images/fl_eye.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), ScreenUtil().setHeight(60), 0, 0),
              child: Text(
                readTimes.toString(),
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(35),
                    color: Color(0xffe53935)
                ),
              ),
            )
          ],
        )
    );
  }
}
