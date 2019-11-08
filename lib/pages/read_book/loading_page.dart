import 'package:flutter/material.dart';

class LoadPage extends StatefulWidget {
  LoadPage({Key key}) : super(key: key);

  @override
  _LoadPageState createState() {
    return _LoadPageState();
  }
}

class _LoadPageState extends State<LoadPage> {
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
    return null;
  }
}


class FailureView extends StatefulWidget {
  final OnLoadReloadListener _listener;

  FailureView(this._listener);

  @override
  State<StatefulWidget> createState() => _FailureViewState();
}

class _FailureViewState extends State<FailureView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffe53935),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "images/icon_network_error.png",
            width: 150,
            height: 150,
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            "咦？没网络啦~检查下设置吧",
            style: TextStyle(fontSize: 12, color: Color(0xffe53935)),
          ),
          SizedBox(
            height: 25,
          ),
          MaterialButton(
            onPressed: () {
              this.widget._listener.onReload();
            },
            minWidth: 150,
            height: 43,
            color: Color(0xffe53935),
            child: Text(
              "重新加载",
              style: TextStyle(
                color: Color(0xffe53935),
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}

abstract class OnLoadReloadListener {
  void onReload();
}


//加载状态
enum LoadStatus {
  LOADING,
  SUCCESS,
  FAILURE,
}