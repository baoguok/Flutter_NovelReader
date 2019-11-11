class CheckConfigModel {
  bool _success;
  CheckConfigData _data;

  CheckConfigModel({bool success, CheckConfigData data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  CheckConfigData get data => _data;
  set data(CheckConfigData data) => _data = data;

  CheckConfigModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _data = json['data'] != null ? new CheckConfigData.fromJson(json['data']) : null;
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

class CheckConfigData {
  int _coin;
  CheckConfigDaily _daily;
  int _gift;
  ConfigConfigNewData _newData;

  CheckConfigData({int coin, CheckConfigDaily daily, int gift, ConfigConfigNewData newData}) {
    this._coin = coin;
    this._daily = daily;
    this._gift = gift;
    this._newData = newData;
  }

  int get coin => _coin;
  set coin(int coin) => _coin = coin;
  CheckConfigDaily get daily => _daily;
  set daily(CheckConfigDaily daily) => _daily = daily;
  int get gift => _gift;
  set gift(int gift) => _gift = gift;
  ConfigConfigNewData get newData => _newData;
  set newData(ConfigConfigNewData newData) => _newData = newData;

  CheckConfigData.fromJson(Map<String, dynamic> json) {
    _coin = json['coin'];
    _daily = json['daily'] != null ? new CheckConfigDaily.fromJson(json['daily']) : null;
    _gift = json['gift'];
    _newData =
    json['new'] != null ? new ConfigConfigNewData.fromJson(json['new']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coin'] = this._coin;
    if (this._daily != null) {
      data['daily'] = this._daily.toJson();
    }
    data['gift'] = this._gift;
    if (this._newData != null) {
      data['new'] = this._newData.toJson();
    }
    return data;
  }
}

class CheckConfigDaily {
  int _current;
  List<CheckConfigLists> _lists;
  int _next;
  bool _today;

  CheckConfigDaily({int current, List<CheckConfigLists> lists, int next, bool today}) {
    this._current = current;
    this._lists = lists;
    this._next = next;
    this._today = today;
  }

  int get current => _current;
  set current(int current) => _current = current;
  List<CheckConfigLists> get lists => _lists;
  set lists(List<CheckConfigLists> lists) => _lists = lists;
  int get next => _next;
  set next(int next) => _next = next;
  bool get today => _today;
  set today(bool today) => _today = today;

  CheckConfigDaily.fromJson(Map<String, dynamic> json) {
    _current = json['current'];
    if (json['list'] != null) {
      _lists = new List<CheckConfigLists>();
      json['list'].forEach((v) {
        _lists.add(new CheckConfigLists.fromJson(v));
      });
    }
    _next = json['next'];
    _today = json['today'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this._current;
    if (this._lists != null) {
      data['list'] = this._lists.map((v) => v.toJson()).toList();
    }
    data['next'] = this._next;
    data['today'] = this._today;
    return data;
  }
}

class CheckConfigLists {
  int _no;
  int _coin;
  int _gift;

  CheckConfigLists({int no, int coin, int gift}) {
    this._no = no;
    this._coin = coin;
    this._gift = gift;
  }

  int get no => _no;
  set no(int no) => _no = no;
  int get coin => _coin;
  set coin(int coin) => _coin = coin;
  int get gift => _gift;
  set gift(int gift) => _gift = gift;

  CheckConfigLists.fromJson(Map<String, dynamic> json) {
    _no = json['no'];
    _coin = json['coin'];
    _gift = json['gift'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this._no;
    data['coin'] = this._coin;
    data['gift'] = this._gift;
    return data;
  }
}

class ConfigConfigNewData {
  int _current;
  List<CheckConfigLists> _lists;
  bool _today;

  ConfigConfigNewData({int current, List<CheckConfigLists> lists, bool today}) {
    this._current = current;
    this._lists = lists;
    this._today = today;
  }

  int get current => _current;
  set current(int current) => _current = current;
  List<CheckConfigLists> get lists => _lists;
  set lists(List<CheckConfigLists> lists) => _lists = lists;
  bool get today => _today;
  set today(bool today) => _today = today;

  ConfigConfigNewData.fromJson(Map<String, dynamic> json) {
    _current = json['current'];
    if (json['list'] != null) {
      _lists = new List<CheckConfigLists>();
      json['list'].forEach((v) {
        _lists.add(new CheckConfigLists.fromJson(v));
      });
    }
    _today = json['today'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this._current;
    if (this._lists != null) {
      data['list'] = this._lists.map((v) => v.toJson()).toList();
    }
    data['today'] = this._today;
    return data;
  }
}
