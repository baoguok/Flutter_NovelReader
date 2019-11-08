import 'package:flutter/material.dart';
import 'package:flutter_reader/dao/bookinfo_data_manager.dart';
import 'package:flutter_reader/model/book/book_cata_list_model.dart';
import 'package:flutter_reader/pages/read_book/book_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';

class CataSortCondition {
  String name;
  bool isSelected;

  CataSortCondition({this.name, this.isSelected});
}

class BookCatalogPage extends StatefulWidget {

  final String _bookId;
  final bool _hasCollect;

  BookCatalogPage(this._bookId,this._hasCollect);

  @override
  _BookCatalogPageState createState() {
    return _BookCatalogPageState();
  }
}

class _BookCatalogPageState extends State<BookCatalogPage> {

  bool _isLoadCataInfo = true;
  bool _isLoadCataList = true;

  CataListModel _cataListModel;
  List<CataListData> _cataListData;
  List<String> _cataListId = [];
  List<String> _cataListName = [];
  List<String> _cataListPrice = [];

  List<String> _dropDownHeaderItemStrings = ['点击快速选择章节'];
  List<CataSortCondition> _chaSortConditions = [];

  CataSortCondition _selectChaSortCondition;

  GZXDropdownMenuController _dropdownMenuController =
  GZXDropdownMenuController();

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey _stackKey = GlobalKey();

  var totalCha;

  var startCata = 0;
  var finishCata = 100;

  @override
  void initState() {
    loadCataInfo();
    loadCataList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadCataInfo(){
    BookDao.fetchCataInfo(widget._bookId).then((value){
      setState(() {
        totalCha = value.data.total;
        int i = (totalCha/100).toInt();
        if(i == 0){
          _chaSortConditions.add(CataSortCondition(name: '第1章 - 第${totalCha}章',isSelected: true));
          _selectChaSortCondition = _chaSortConditions[0];

        }
        else
        {
          for(var j = 0;j <= i;j++){
            if(j<i){
              if(j==0)
                {
                  _chaSortConditions.add(CataSortCondition(name: '第${100*j+1}章 - 第${100*(j+1)}章',isSelected: true));
                }
              else
                {
                  _chaSortConditions.add(CataSortCondition(name: '第${100*j+1}章 - 第${100*(j+1)}章',isSelected: false));
                }
            }
            else if (j==i){
              _chaSortConditions.add(CataSortCondition(name: '第${100*j+1}章 - 第${totalCha}章',isSelected: false));
            }
          }
          _selectChaSortCondition = _chaSortConditions[0];
        }
        _isLoadCataInfo = false;
      });
    });
  }

  loadCataList(){
    _cataListName.clear();
    _cataListPrice.clear();
    _cataListId.clear();
    BookDao.fetchCataList(widget._bookId, startCata).then((value){
      setState(() {
        _cataListModel = value;
        _cataListData = value.data;
        for(var i =0;i<_cataListData.length;i++){
          _cataListName.add(_cataListData[i].name);
          _cataListPrice.add(_cataListData[i].logo);
          _cataListId.add(_cataListData[i].id);
        }
        _isLoadCataList = false;
      });
    });
  }

  final items = List<String>.generate(35, (i) => '第$i章');
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('章节目录'),
          backgroundColor: Color(0xffe53935),
        ),
        body: _isLoadCataInfo == true || _isLoadCataList == true ? Center(child: Text('正在加载目录详情'),) :Stack(
          key: _stackKey,
          children: <Widget>[
            Column(
              children: <Widget>[
                GZXDropDownHeader(
                  items: [GZXDropDownHeaderItem(_dropDownHeaderItemStrings[0])],
                  stackKey: _stackKey,
                  controller: _dropdownMenuController,
                  onItemTap: (index){

                  },
                ),
                Container(
                  height: ScreenUtil().setHeight(1900),
                  child: ListView.builder(
                      itemCount: _cataListName.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => BookContentPage(_cataListId[index], widget._bookId,widget._hasCollect)
                            ));
                          },
                          title: Text('${_cataListName[index]}'),
                          trailing: _cataListPrice[index] == 'free' ? null : Image(
                            width: ScreenUtil().setWidth(60),
                            image: AssetImage('images/需书币的@2x.png'),
                          ),
                        );
                      }),
                )
              ],
            ),
            GZXDropDownMenu(
              controller: _dropdownMenuController,
              animationMilliseconds: 500,
              menus: [
                GZXDropdownMenuBuilder(
                    dropDownHeight: 40.0 * _chaSortConditions.length,
                    dropDownWidget:
                    _buildConditionListWidget(_chaSortConditions, (value) {
                      _selectChaSortCondition = value;
                      var name = value.name;
                      List a = name.split('第');
                      String start = a[1];
                      String finish = a[2];
                      List b = start.split('章');
                      List c = finish.split('章');
                      startCata = int.parse(b[0]) - 1;
                      _dropDownHeaderItemStrings[0] = _selectChaSortCondition.name;
                      _dropdownMenuController.hide();
                      setState(() {
                        loadCataList();
                      });
                    })),
              ],
            )
          ],
        )
    );
  }

  _buildConditionListWidget(items, void itemOnTap(CataSortCondition sortCondition)) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      // item 的个数
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 1.0),
      // 添加分割线
      itemBuilder: (BuildContext context, int index) {
        CataSortCondition goodsSortCondition = items[index];
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
}
