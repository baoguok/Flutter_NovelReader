class ExchangeModel {
  bool _success;
  ExchangeData _data;

  ExchangeModel({bool success, ExchangeData data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  ExchangeData get data => _data;
  set data(ExchangeData data) => _data = data;

  ExchangeModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _data = json['data'] != null ? new ExchangeData.fromJson(json['data']) : null;
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

class ExchangeData {
  int _coin;
  int _gift;

  ExchangeData({int coin, int gift}) {
    this._coin = coin;
    this._gift = gift;
  }

  int get coin => _coin;
  set coin(int coin) => _coin = coin;
  int get gift => _gift;
  set gift(int gift) => _gift = gift;

  ExchangeData.fromJson(Map<String, dynamic> json) {
    _coin = json['coin'];
    _gift = json['gift'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coin'] = this._coin;
    data['gift'] = this._gift;
    return data;
  }
}
