class CheckModel {
  bool _success;
  CheckData _data;

  CheckModel({bool success, CheckData data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  CheckData get data => _data;
  set data(CheckData data) => _data = data;

  CheckModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _data = json['data'] != null ? new CheckData.fromJson(json['data']) : null;
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

class CheckData {
  int _coin;
  int _current;
  int _gift;
  int _next;
  CheckUser _user;

  CheckData({int coin, int current, int gift, int next, CheckUser user}) {
    this._coin = coin;
    this._current = current;
    this._gift = gift;
    this._next = next;
    this._user = user;
  }

  int get coin => _coin;
  set coin(int coin) => _coin = coin;
  int get current => _current;
  set current(int current) => _current = current;
  int get gift => _gift;
  set gift(int gift) => _gift = gift;
  int get next => _next;
  set next(int next) => _next = next;
  CheckUser get user => _user;
  set user(CheckUser user) => _user = user;

  CheckData.fromJson(Map<String, dynamic> json) {
    _coin = json['coin'];
    _current = json['current'];
    _gift = json['gift'];
    _next = json['next'];
    _user = json['user'] != null ? new CheckUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coin'] = this._coin;
    data['current'] = this._current;
    data['gift'] = this._gift;
    data['next'] = this._next;
    if (this._user != null) {
      data['user'] = this._user.toJson();
    }
    return data;
  }
}

class CheckUser {
  int _coin;
  int _gift;

  CheckUser({int coin, int gift}) {
    this._coin = coin;
    this._gift = gift;
  }

  int get coin => _coin;
  set coin(int coin) => _coin = coin;
  int get gift => _gift;
  set gift(int gift) => _gift = gift;

  CheckUser.fromJson(Map<String, dynamic> json) {
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
