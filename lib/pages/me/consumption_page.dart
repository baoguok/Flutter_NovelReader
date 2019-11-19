import 'package:flutter/material.dart';
import 'package:flutter_reader/dao/me_data_manager.dart';
import 'package:flutter_reader/model/me/consum_model.dart';
import 'package:flutter_reader/tools/color_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConsumptionPage extends StatefulWidget {
  ConsumptionPage({Key key}) : super(key: key);

  @override
  _ConsumptionPageState createState() {
    return _ConsumptionPageState();
  }
}

class _ConsumptionPageState extends State<ConsumptionPage> {

  bool _isLoadData = true;
  bool _hasData = true;

  ConsumModel _consumModel;
  List<ConsumData> _consumData;
  List<String> title = [];
  List<String> desc = [];
  List<String> date = [];
  List<String> prod = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  loadData(){
    title.clear();
    desc.clear();
    date.clear();
    prod.clear();
    MeDao.fetchConsumData().then((value){
      setState(() {
        _consumModel = value;
        _consumData = value.data;
        if(value.data.length == 0){

          _hasData = false;
        }
        else
          {
            for(int i = 0; i < _consumData.length; i ++ ){
              title.add(_consumData[i].title);
              desc.add(_consumData[i].desc);
              date.add(_consumData[i].date);
              prod.add(_consumData[i].prod);
            }
          }
        _isLoadData = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe53935),
        title: Text('消费记录'),
      ),
      body: _isLoadData ? Container(
        width: ScreenUtil().setWidth(1125),
        height: ScreenUtil().setHeight(1900),
        child: Center(
          child: ColorLoader(
            color1: Colors.redAccent,
            color2: Colors.green,
            color3: Colors.amber,
          )
        ),
      ) : _hasData ? Container(
        child: ListView.builder(
          itemCount: _consumData.length,
          itemBuilder: (context,index){
            return _item(index);
          },
        ),
      ): Container(
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(650)),
              child: Column(
                children: <Widget>[
                  Image(
                    width: ScreenUtil().setWidth(800),
                    height: ScreenUtil().setHeight(400),
                    image: AssetImage('images/暂无数据、@2x.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: ScreenUtil().setWidth(65),top: ScreenUtil().setHeight(40)),
                    child: Text(
                      '暂无数据',
                      style: TextStyle(fontSize: ScreenUtil().setSp(55)),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

  _item(int index){
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20),left: ScreenUtil().setWidth(20),right: ScreenUtil().setWidth(20)),
      width: ScreenUtil().setWidth(1125),
      height: ScreenUtil().setHeight(250),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(3.0, 3.0),),
            ],
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xffb31217),
                Color(0xffe52d27)
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(40),top: ScreenUtil().setHeight(40)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(title[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(55),
                    fontWeight: FontWeight.w500
                  ),),
                ),
                Container(
                  width: ScreenUtil().setWidth(450),
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                  child: Text(desc[index],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: ScreenUtil().setSp(40)
                  ),),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: ScreenUtil().setWidth(40)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                  child: Text(prod[index],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(55),
                        fontWeight: FontWeight.w500
                    ),),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                  child: Text(
                    date[index],
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: ScreenUtil().setSp(40)
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}