class PayConfigModel {
  bool _success;
  PayConfigData _data;

  PayConfigModel({bool success, PayConfigData data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  PayConfigData get data => _data;
  set data(PayConfigData data) => _data = data;

  PayConfigModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _data = json['data'] != null ? new PayConfigData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    return data;
  }
}

class PayConfigData {
  int _coin;
  int _gift;
  List<PayConfigItem> _item;
  String _tip;

  PayConfigData({int coin, int gift, List<PayConfigItem> item, String tip}) {
    this._coin = coin;
    this._gift = gift;
    this._item = item;
    this._tip = tip;
  }

  int get coin => _coin;
  set coin(int coin) => _coin = coin;
  int get gift => _gift;
  set gift(int gift) => _gift = gift;
  List<PayConfigItem> get item => _item;
  set item(List<PayConfigItem> item) => _item = item;
  String get tip => _tip;
  set tip(String tip) => _tip = tip;

  PayConfigData.fromJson(Map<String, dynamic> json) {
    _coin = json['coin'];
    _gift = json['gift'];
    if (json['item'] != null) {
      _item = new List<PayConfigItem>();
      json['item'].forEach((v) {
        _item.add(new PayConfigItem.fromJson(v));
      });
    }
    _tip = json['tip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coin'] = this._coin;
    data['gift'] = this._gift;
    if (this._item != null) {
      data['item'] = this._item.map((v) => v.toJson()).toList();
    }
    data['tip'] = this._tip;
    return data;
  }
}

class PayConfigItem {
  String _price;
  String _code;
  String _name;
  String _desc;
  String _logo;
  bool _enable;

  PayConfigItem(
      {String price,
        String code,
        String name,
        String desc,
        String logo,
        bool enable}) {
    this._price = price;
    this._code = code;
    this._name = name;
    this._desc = desc;
    this._logo = logo;
    this._enable = enable;
  }

  String get price => _price;
  set price(String price) => _price = price;
  String get code => _code;
  set code(String code) => _code = code;
  String get name => _name;
  set name(String name) => _name = name;
  String get desc => _desc;
  set desc(String desc) => _desc = desc;
  String get logo => _logo;
  set logo(String logo) => _logo = logo;
  bool get enable => _enable;
  set enable(bool enable) => _enable = enable;

  PayConfigItem.fromJson(Map<String, dynamic> json) {
    _price = json['price'];
    _code = json['code'];
    _name = json['name'];
    _desc = json['desc'];
    _logo = json['logo'];
    _enable = json['enable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this._price;
    data['code'] = this._code;
    data['name'] = this._name;
    data['desc'] = this._desc;
    data['logo'] = this._logo;
    data['enable'] = this._enable;
    return data;
  }
}
