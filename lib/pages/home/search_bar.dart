import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SearchBarType { home, normal, homeLight }

class SearchBar extends StatefulWidget {
  //是否禁止搜索
  final bool enabled;
  final bool hideLeft;

  //searchBar类型， 首页，首页下拉后高亮，搜索页
  final SearchBarType searchBarType;

  //默认提示文案
  final String hint;

  //默认文字
  final String defaultText;
  final void Function() leftButtonClick;
  final void Function() rightButtonClick;
  final void Function() speakClick;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChanged;

  const SearchBar(
      {Key key,
        this.enabled = true,
        this.hideLeft,
        this.searchBarType = SearchBarType.normal,
        this.hint,
        this.defaultText,
        this.leftButtonClick,
        this.rightButtonClick,
        this.speakClick,
        this.inputBoxClick,
        this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _searchBarState();
}

class _searchBarState extends State<SearchBar> {
  //是否显示删除按钮
  bool showClear = false;
  final TextEditingController _controller = TextEditingController();

  void initState() {
    if (widget.defaultText != null) {
      setState(() {
        _controller.text = widget.defaultText;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (widget.searchBarType == SearchBarType.normal) {
      return _genNormalSearch();
    }
    else{
      if(widget.searchBarType == SearchBarType.homeLight){
        return _genHomeLightSearch();
      }
      else{
        return _genHomeSearch();
      }
    }
  }

  _genNormalSearch() {
    return Container(
      //横向布局
      child: Row(
        children: <Widget>[
          _wrapTap(
              Container(
                padding: EdgeInsets.fromLTRB(6, 5, 10, 5),
                child: widget?.hideLeft ?? false
                    ? null
                    : Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                  size: 26,
                ),
              ),
              //回调函数
              widget.leftButtonClick),
          //自适应宽度
          Expanded(
            flex: 1,
            child: _inputBox(),
          ),
          _wrapTap(
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  '搜索',
                  style: TextStyle(color: Color(0xffe53935), fontSize: 17),
                ),
              ),
              widget.rightButtonClick)
        ],
      ),
    );
  }

  _genHomeSearch() {
    return Container(
      //横向布局
      child: Row(
        children: <Widget>[
          _wrapTap(
              Container(
                width: ScreenUtil().setWidth(30),
                  padding: EdgeInsets.fromLTRB(6, 5, 5, 5),
                  child: Text('')),
              //回调函数
              widget.leftButtonClick),
          //自适应宽度
          Expanded(
            flex: 1,
            child: _inputBox(),
          ),
          _wrapTap(
              Container(
                  padding: EdgeInsets.fromLTRB(10, 3, 10, 5),
                  child: Image(
                    width: ScreenUtil().setWidth(90),
                    height: ScreenUtil().setHeight(120),
                    image: AssetImage('images/fl_gift.png'),
                  )
              ),
              widget.rightButtonClick)
        ],
      ),
    );
  }

  _genHomeLightSearch() {
    return Container(
      //横向布局
      child: Row(
        children: <Widget>[
          _wrapTap(
              Container(
                  width: ScreenUtil().setWidth(30),
                  padding: EdgeInsets.fromLTRB(6, 5, 5, 5),
                  child: Text('')),
              //回调函数
              widget.leftButtonClick),
          //自适应宽度
          Expanded(
            flex: 1,
            child: _inputBox(),
          ),
          _wrapTap(
              Container(
                  padding: EdgeInsets.fromLTRB(10, 3, 10, 5),
                  child: Image(
                    width: ScreenUtil().setWidth(90),
                    height: ScreenUtil().setHeight(120),
                    image: AssetImage('images/fl_gift.png'),
                    color: Color(0xffe53935),
                  )
              ),
              widget.rightButtonClick)
        ],
      ),
    );
  }

  _wrapTap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: child,
    );
  }

  _inputBox() {
    Color intputBoxColor;
    if (widget.searchBarType == SearchBarType.home) {
      intputBoxColor = Colors.white;
    } else {
      intputBoxColor = Color(int.parse('0xffEDEDED'));
    }
    return Container(
      height: 30,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: intputBoxColor,
          borderRadius: BorderRadius.circular(
              widget.searchBarType == SearchBarType.normal ? 5.0 : 15.0)),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            size: 20,
            color: widget.searchBarType == SearchBarType.normal
                ? Color(0xffA9A9A9)
                : Color(0xffe53935),
          ),
          Expanded(
              flex: 1,
              child: widget.searchBarType == SearchBarType.normal
                  ? TextField(
                controller: _controller,
                onChanged: _onChanged,
                //自动对焦
                autofocus: true,
                //输入框样式
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    //文本粗细
                    fontWeight: FontWeight.w300),
                //输入文本样式
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 0, 5, ScreenUtil().setHeight(45)),
                  border: InputBorder.none,
                  //提示文字
                  hintText: widget.hint ?? '',
                  hintStyle: TextStyle(fontSize: 15),
                ),
              )
                  : _wrapTap(
                  Container(
                    child: Text(
                      widget.defaultText,
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ),
                  widget.inputBoxClick)),
          !showClear
              ? _wrapTap(
              Icon(
                Icons.mic,
                size: 22,
                color: widget.searchBarType == SearchBarType.normal
                    ? Color(0xffe53935)
                    : Colors.grey,
              ),
              widget.speakClick)
              : _wrapTap(
              Icon(
                Icons.clear,
                size: 22,
                color: Colors.grey,
              ), () {
            setState(() {
              _controller.clear();
            });
            _onChanged('');
          })
        ],
      ),
    );
  }

  _onChanged(String text) {
    if (text.length > 0) {
      setState(() {
        showClear = true;
      });
    } else {
      setState(() {
        showClear = false;
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }

  _homeFontColor(){
    return widget.searchBarType == SearchBarType.home
        ? Colors.white
        : Colors.black54;
  }
}
