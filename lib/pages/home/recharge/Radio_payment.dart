import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'radio_model.dart';

class CustomRadioGroupWidget extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final bool isSquareRadioGroup;
  final List<RadioModel> radioList;

  const CustomRadioGroupWidget(
      {Key key, this.isSquareRadioGroup, this.radioList, this.onChanged})
      : super(key: key);

  @override
  _CustomRadioGroupWidgetState createState() => _CustomRadioGroupWidgetState();
}

class _CustomRadioGroupWidgetState extends State<CustomRadioGroupWidget> {
  String _selectedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 10.0,
          maxHeight: 160.0,
        ),
        child: _buildRoundRadioGroup(),
      );
  }
  

  Widget _buildRoundRadioGroup() {
    return new ListView.builder(
      shrinkWrap: true,
          padding: EdgeInsets.all(0.0),
          physics: NeverScrollableScrollPhysics(),
      itemCount: widget.radioList.length,
      itemBuilder: (BuildContext context, int index) {
        return new InkWell(
          onTap: () {
            setState(() {
              widget.radioList.forEach((element) => element.isSelected = false);
              widget.radioList[index].isSelected = true;
              _selectedValue = widget.radioList[index].text;
              _publishSelection(_selectedValue);
            });
          },
          child: new RoundRadioItem(widget.radioList[index]),
        );
      },
    );
  }

  void _publishSelection(selectedValue) {
    if (widget.onChanged != null) {
      widget.onChanged(selectedValue);
    }
  }
}

class SquareRadioItem extends StatelessWidget {
  final RadioModel _item;
  SquareRadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: double.infinity,
      child: new Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _item.radioIcon != null
                  ? IconButton(
                icon: _item.radioIcon,
                onPressed: null,
              )
                  : Container(),
              new Text(_item.text,
                  style: new TextStyle(
                      color: _item.isSelected ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)),
            ],
          )),
      decoration: new BoxDecoration(
        color: _item.isSelected ? _item.selectedColor : Colors.white,
        border: new Border.all(
            width: 1.0,
            color: _item.isSelected ? _item.selectedColor : Colors.white),
      ),
    );
  }
}

class RoundRadioItem extends StatelessWidget {
  final RadioModel _item;

  RoundRadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      new EdgeInsets.only(left: ScreenUtil().setWidth(60), right: ScreenUtil().setWidth(60), top: ScreenUtil().setHeight(40), bottom: 0),
      height: ScreenUtil().setHeight(100),
      width: double.infinity,
      child: new Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _item.radioIcon != null
                  ? Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(40)),
                child: _item.radioIcon,
              )
                  : Container(),
              new Text(_item.text,
                  style: new TextStyle(
                      color: _item.isSelected ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(40),
                      fontWeight: FontWeight.w400)),
            ],
          )),
      decoration: new BoxDecoration(
        color: _item.isSelected ? _item.selectedColor : Colors.white,
        border: new Border.all(
            width: 1.0,
            color:_item.isSelected ? _item.selectedColor : Colors.white),
        borderRadius:
        const BorderRadius.all(const Radius.elliptical(100.0, 100.0)),
      ),
    );
  }
}