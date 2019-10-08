//library custom_radio_grouped_button;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRadioButton extends StatefulWidget {
  CustomRadioButton({
    this.buttonLables,
    this.buttonValues,
    this.radioButtonValue,
    this.buttonColor,
    this.selectedColor,
    this.hight,
    this.width = 300,
    this.elevation = 0,
  })  : assert(buttonLables.length == buttonValues.length),
        assert(buttonColor != null),
        assert(selectedColor != null);


  final List buttonValues;

  final double hight;
  final double width;

  final List<String> buttonLables;

  final Function(dynamic) radioButtonValue;

  final Color selectedColor;

  final Color buttonColor;

  final double elevation;

  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  int currentSelected = 0;
  String currentSelectedLabel;

  @override
  void initState() {
    super.initState();
    currentSelectedLabel = widget.buttonLables[0];
  }

  List<Widget> buildButtonsColumn() {
    List<Widget> buttons = [];
    for (int index = 0; index < widget.buttonLables.length; index++) {
      var button = Expanded(
        // flex: 1,
        child: Card(
          color: currentSelectedLabel == widget.buttonLables[index]
              ? widget.selectedColor
              : widget.buttonColor,
          elevation: widget.elevation,
          child: Container(
            height: widget.hight,
            child: MaterialButton(
              onPressed: () {
                widget.radioButtonValue(widget.buttonValues[index]);
                setState(() {
                  currentSelected = index;
                  currentSelectedLabel = widget.buttonLables[index];
                });
              },
              child: Text(
                widget.buttonLables[index],
                style: TextStyle(
                  color: currentSelectedLabel == widget.buttonLables[index]
                      ? Colors.white
                      : Theme.of(context).textTheme.body1.color,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      );
      buttons.add(button);
    }
    return buttons;
  }

  List<Widget> buildButtonsRow() {
    List<Widget> buttons = [];
    for (int index = 0; index < widget.buttonLables.length; index++) {
      var button = Card(
          color: currentSelectedLabel == widget.buttonLables[index]
              ? widget.selectedColor
              : widget.buttonColor,
          elevation: widget.elevation,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(
                color: Colors.redAccent,
                width: 1
              )
            ),
            height: widget.hight,
            width: ScreenUtil().setWidth(495),
            child: MaterialButton(
              onPressed: () {
                widget.radioButtonValue(widget.buttonValues[index]);
                setState(() {
                  currentSelected = index;
                  currentSelectedLabel = widget.buttonLables[index];
                });
              },
              child: Text(
                widget.buttonLables[index],
                style: TextStyle(
                  color: currentSelectedLabel == widget.buttonLables[index]
                      ? Colors.white
                      : Colors.redAccent,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        );
      buttons.add(button);
    }
    return buttons;
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
