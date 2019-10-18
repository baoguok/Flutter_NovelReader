import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FeedbackPage extends StatefulWidget {
  FeedbackPage({Key key}) : super(key: key);

  @override
  _FeedbackPageState createState() {
    return _FeedbackPageState();
  }
}

class _FeedbackPageState extends State<FeedbackPage> {

  final _textController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('问题反馈'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: ScreenUtil().setHeight(600),
            color: Color(0xffeeeeee),
            padding: EdgeInsets.all(10.0),
            child: new ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: ScreenUtil().setHeight(600),
              ),
              child: new Scrollbar(
                child: new SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  child: SizedBox(
                    height: ScreenUtil().setHeight(550),
                    child: new TextField(
                      controller: _textController,
                      maxLines: 100,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        hintText: '请在此处编写您意见',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(60)),
            child: SizedBox(
              width: ScreenUtil().setWidth(1060),
              height: ScreenUtil().setHeight(150),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
                onPressed: (){
                  ///提交意见
                  Fluttertoast.showToast(msg: '问题已反馈');
                  print(_textController.text);
                },
                textColor: Colors.white,
                child: Text('提交',
                style: TextStyle(fontSize: ScreenUtil().setSp(50)),),
              ),
            )
          )
        ],
      ),
    );
  }
}