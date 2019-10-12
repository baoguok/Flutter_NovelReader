import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reader/pages/home/recharge/Radio_Widget.dart';
import 'package:flutter_reader/pages/home/recharge/protocol_dialog.dart';
import 'package:flutter_reader/pages/home/recharge/radio_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Radio_payment.dart';

class RechargePage extends StatefulWidget {
  RechargePage({Key key}) : super(key: key);

  @override
  _RechargePageState createState() {
    return _RechargePageState();
  }
}

class _RechargePageState extends State<RechargePage> {
  bool _haveReadProtocol;
  bool _checkboxListChecked;

  String _selectedPayment;

  bool _selectWechat = true;
  bool _selectAlipay = false;

  @override
  void initState() {
    super.initState();
    _haveReadProtocol = true;
    _checkboxListChecked = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: <Widget>[
            _coinWidget(),
            Column(
              children: <Widget>[
                _chooseWidget(),
                _showProtocolButton(),
                _payment(),
                _confirmButton(),
              ],
            ),
            _hotImage()
          ],
        ),
      ),
    );
  }

  _hotImage() {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(450), left: ScreenUtil().setWidth(955)),
      child: Image(
        width: ScreenUtil().setWidth(100),
        image: AssetImage('images/hot.png'),
      ),
    );
  }

  _coinWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.redAccent,
      ),
      margin: EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(40)),
      height: ScreenUtil().setHeight(600),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(130)),
            child: Stack(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: _backToHome,
                ),
                Container(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
                  child: Center(
                    child: Text(
                      '充值中心',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(65),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(60)),
                  child: Image(
                    image: AssetImage('images/64-金币.png'),
                    width: ScreenUtil().setWidth(100),
                    height: ScreenUtil().setHeight(100),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                  child: Text(
                    '当前余额：   ',
                    style: TextStyle(
                        color: Colors.white, fontSize: ScreenUtil().setSp(60)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
                  child: Text(
                    '410      书币',
                    style: TextStyle(
                        color: Colors.white, fontSize: ScreenUtil().setSp(60)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _chooseWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(40),
          ScreenUtil().setHeight(450), ScreenUtil().setWidth(40), 0),
      height: ScreenUtil().setHeight(1160),
      width: ScreenUtil().setWidth(1100),
      child: Container(
        child: CustomRadioButton(
          hight: ScreenUtil().setHeight(250),
          width: ScreenUtil().setWidth(450),
          buttonColor: Colors.white,
          buttonLables: ['30元', '50元', '66元', '99元', 'vip包月', 'vip包年'],
          buttonSubLables: [
            '3000书币',
            '5000+1500书币',
            '6600+6600书币',
            '9900+9900书币',
            '128元',
            '365元'
          ],
          buttonValues: ['1', '2', '3', '4', '5', '6'],
          buttonRemarksLables: [
            '多送0元',
            '多送15元',
            '多送30元',
            '多送50元',
            '60天全站免费畅读',
            '每天1元，365天全站免费畅读',
          ],
          radioButtonValue: (value) => print(value),
          selectedColor: Colors.redAccent,
        ),
      ),
    );
  }

  _showProtocolButton() {
    return Center(
      child: Container(
        height: ScreenUtil().setHeight(150),
        child: MaterialButton(
          child: Container(
              child: Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
            child: CheckboxListTile(
              onChanged: (isCheck) {
                isCheck == true ? _showProtocol() : null;
                setState(() {
                  _checkboxListChecked = isCheck;
                });
              },
              selected: false,
              value: _checkboxListChecked,
              title: Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      '我已阅读并同意 ',
                      style: TextStyle(fontSize: ScreenUtil().setSp(40)),
                    ),
                    Text.rich(TextSpan(
                      text: ' 充值条款声明',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(40),
                          color: Colors.brown,
                          decoration: TextDecoration.underline),
                    ))
                  ],
                ),
              ),
              controlAffinity: ListTileControlAffinity.leading,
            ),
          )),
        ),
      ),
    );
  }


  _payment() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(
                width: 1,
                color: Colors.black12
              ))
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                  child: Image(
                    width: ScreenUtil().setWidth(100),
                    image: AssetImage('images/微信.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(50)),
                  child: Text('微信支付'),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(600)),
                  child: CircularCheckBox(
                      value: _selectWechat,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      onChanged: (bool x) {
                        setState(() {
                          _selectAlipay = !_selectAlipay;
                          _selectWechat = !_selectWechat;
                        });
                      }),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(
                    width: 1,
                    color: Colors.black12
                ))
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
                  child: Image(
                    width: ScreenUtil().setWidth(100),
                    image: AssetImage('images/支付宝.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(50)),
                  child: Text('支付宝支付'),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(560)),
                  child: CircularCheckBox(
                      value: _selectAlipay,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      onChanged: (bool x) {
                        setState(() {
                          _selectAlipay = !_selectAlipay;
                          _selectWechat = !_selectWechat;
                        });
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _confirmButton() {
    return InkWell(
      onTap: () {
        print('确认支付');
      },
      child: Container(
        width: ScreenUtil().setWidth(1125),
        height: ScreenUtil().setHeight(250),
        color: Colors.redAccent,
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(112)),
        child: Center(
          child: Text(
            '确认支付',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: ScreenUtil().setSp(50)),
          ),
        ),
      ),
    );
  }

  _backToHome() {
    Navigator.pop(context);
  }

  void _showProtocol() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ProtocolDialog(
            title: '充值条款说明',
            dialogText:
                '1.充值兑换比例：1元=100书币\n2.书券可用于兑换VIP，进入“个人中心”点击“书券”即可进入兑换页面！\n3.充得多，送得多（PS：购买包年会员更划算哦！）\n4.充值包年、包月VIP成为VIP会员，可免费查看所有书籍\n5.充值后书币到账有延迟，30分钟内未到账 请联系客服 QQ:kanxiaoshuo101\n6.由于小说书豆为特殊虚拟商品，一旦成功购买即开始享受部分及全部服务，因此不可退换，请购买时注意',
          );
        });
  }
}
