class ExchangeConfigModel {
  bool _success;
  ExchangeConfigData _data;

  ExchangeConfigModel({bool success, ExchangeConfigData data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  ExchangeConfigData get data => _data;
  set data(ExchangeConfigData data) => _data = data;

  ExchangeConfigModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _data = json['data'] != null ? new ExchangeConfigData.fromJson(json['data']) : null;
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

class ExchangeConfigData {
  int _coin;
  int _ctg;
  int _gift;
  int _gtv;

  ExchangeConfigData({int coin, int ctg, int gift, int gtv}) {
    this._coin = coin;
    this._ctg = ctg;
    this._gift = gift;
    this._gtv = gtv;
  }

  int get coin => _coin;
  set coin(int coin) => _coin = coin;
  int get ctg => _ctg;
  set ctg(int ctg) => _ctg = ctg;
  int get gift => _gift;
  set gift(int gift) => _gift = gift;
  int get gtv => _gtv;
  set gtv(int gtv) => _gtv = gtv;

  ExchangeConfigData.fromJson(Map<String, dynamic> json) {
    _coin = json['coin'];
    _ctg = json['ctg'];
    _gift = json['gift'];
    _gtv = json['gtv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coin'] = this._coin;
    data['ctg'] = this._ctg;
    data['gift'] = this._gift;
    data['gtv'] = this._gtv;
    return data;
  }
}
