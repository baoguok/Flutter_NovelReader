import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRadioButton extends StatefulWidget {
  CustomRadioButton({
    this.buttonLables,
    this.buttonSubLables,
    this.buttonValues,
    this.buttonLogo,
    this.radioButtonValue,
    this.buttonRemarksLables,
    this.buttonColor,
    this.selectedColor,
    this.hight,
    this.width,
    this.elevation = 0,
  })  : assert(buttonLables.length == buttonValues.length),
        assert(buttonColor != null),
        assert(selectedColor != null);


  final List buttonValues;

  final double hight;
  final double width;

  final List<String> buttonLables;

  final List<String> buttonSubLables;

  final List<String> buttonRemarksLables;

  final List<String> buttonLogo;

  final Function(dynamic) radioButtonValue;

  final Color selectedColor;

  final Color buttonColor;

  final double elevation;

  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  int currentSelected = 1;
  String currentSelectedLabel;

  @override
  void initState() {
    super.initState();
    currentSelectedLabel = widget.buttonLables[1];
  }

  List<Widget> buildButtonsRow() {
    List<Widget> buttons = [];
    for (int index = 0; index < widget.buttonLables.length; index++) {
      var button = index >= 4 ? _doubleItem(index) : _simpleItem(index);
      buttons.add(button);
    }
    return buttons;
  }

  _simpleItem(int index){
    return widget.buttonLogo[index] == 'hot' ? Container(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(48),
                ScreenUtil().setHeight(40), 0, 0),
            height: widget.hight,
            width: ScreenUtil().setWidth(430),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                    color: Color(0xffe53935),
                    width: 1
                ),
                color: currentSelectedLabel == widget.buttonLables[index]
                    ? widget.selectedColor : widget.buttonColor
            ),
            child: MaterialButton(
                onPressed: () {
                  widget.radioButtonValue(widget.buttonValues[index]);
                  setState(() {
                    currentSelected = index;
                    currentSelectedLabel = widget.buttonLables[index];
                  });
                },
                child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                          child:Text(
                            widget.buttonLables[index],
                            style: TextStyle(
                                color: currentSelectedLabel == widget.buttonLables[index]
                                    ? Colors.white
                                    : Colors.black54,
                                fontSize: ScreenUtil().setSp(60),
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                          child: Text(
                            widget.buttonSubLables[index],
                            style: TextStyle(
                                color: currentSelectedLabel == widget.buttonLables[index]
                                    ? Colors.white
                                    : Colors.black54,
                                fontSize: ScreenUtil().setSp(40),
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                          child: Text(
                            widget.buttonRemarksLables[index],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: currentSelectedLabel == widget.buttonLables[index]
                                    ? Colors.white
                                    : Color(0xffe53935),
                                fontSize: ScreenUtil().setSp(30),
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        )
                      ],
                    )
                )
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(400)),
            child: Image(
              width: ScreenUtil().setWidth(100),
              height: ScreenUtil().setHeight(150),
              image: AssetImage('images/hot.png',),
            ),
          )
        ],
      ),
    ) :
    Container(
      margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(60),
          ScreenUtil().setHeight(40), 0, 0),
      height: widget.hight,
      width: ScreenUtil().setWidth(430),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(
              color: Color(0xffe53935),
              width: 1
          ),
          color: currentSelectedLabel == widget.buttonLables[index]
              ? widget.selectedColor : widget.buttonColor
      ),
      child: MaterialButton(
          onPressed: () {
            widget.radioButtonValue(widget.buttonValues[index]);
            setState(() {
              currentSelected = index;
              currentSelectedLabel = widget.buttonLables[index];
            });
          },
          child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                    child:Text(
                      widget.buttonLables[index],
                      style: TextStyle(
                          color: currentSelectedLabel == widget.buttonLables[index]
                              ? Colors.white
                              : Colors.black54,
                          fontSize: ScreenUtil().setSp(60),
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                    child: Text(
                      widget.buttonSubLables[index],
                      style: TextStyle(
                          color: currentSelectedLabel == widget.buttonLables[index]
                              ? Colors.white
                              : Colors.black54,
                          fontSize: ScreenUtil().setSp(40),
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                    child: Text(
                      widget.buttonRemarksLables[index],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: currentSelectedLabel == widget.buttonLables[index]
                              ? Colors.white
                              : Color(0xffe53935),
                          fontSize: ScreenUtil().setSp(30),
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  )
                ],
              )
          )
      ),
    );
  }

  _doubleItem(int index){
    return Container(
      margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(48),
          ScreenUtil().setHeight(40), 0, 0),
      height: widget.hight,
      width: ScreenUtil().setWidth(940),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(
              color: Color(0xffe53935),
              width: 1
          ),
          color: currentSelectedLabel == widget.buttonLables[index]
              ? widget.selectedColor : widget.buttonColor
      ),
      child: MaterialButton(
          onPressed: () {
            widget.radioButtonValue(widget.buttonValues[index]);
            setState(() {
              currentSelected = index;
              currentSelectedLabel = widget.buttonLables[index];
            });
          },
          child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(250),
                    top: ScreenUtil().setHeight(20)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Image(
                            width:ScreenUtil().setWidth(100),
                            image: AssetImage('images/fl_King2.png'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  widget.buttonLables[index],
                                  style: TextStyle(
                                      color: currentSelectedLabel == widget.buttonLables[index]
                                          ? Colors.white
                                          : Colors.black54,
                                      fontSize: ScreenUtil().setSp(50),
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  widget.buttonSubLables[index],
                                  style: TextStyle(
                                      color: currentSelectedLabel == widget.buttonLables[index]
                                          ? Colors.white
                                          : Colors.black54,
                                      fontSize: ScreenUtil().setSp(50),
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ]
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.buttonRemarksLables[index],
                      style: TextStyle(
                          color: currentSelectedLabel == widget.buttonLables[index]
                              ? Colors.white
                              : Color(0xffe53935),
                          fontSize: ScreenUtil().setSp(40),
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  )
                ],
              )
          )
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child:Wrap(
          children: buildButtonsRow(),
        )
    );
  }
}


