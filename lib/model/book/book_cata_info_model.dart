class CataInfoModel {
  bool _success;
  CataInfoData _data;

  CataInfoModel({bool success, CataInfoData data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  CataInfoData get data => _data;
  set data(CataInfoData data) => _data = data;

  CataInfoModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _data = json['data'] != null ? new CataInfoData.fromJson(json['data']) : null;
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

class CataInfoData {
  Current _current;
  First _first;
  Last _last;
  int _total;

  CataInfoData({Current current, First first, Last last, int total}) {
    this._current = current;
    this._first = first;
    this._last = last;
    this._total = total;
  }

  Current get current => _current;
  set current(Current current) => _current = current;
  First get first => _first;
  set first(First first) => _first = first;
  Last get last => _last;
  set last(Last last) => _last = last;
  int get total => _total;
  set total(int total) => _total = total;

  CataInfoData.fromJson(Map<String, dynamic> json) {
    _current =
    json['current'] != null ? new Current.fromJson(json['current']) : null;
    _first = json['first'] != null ? new First.fromJson(json['first']) : null;
    _last = json['last'] != null ? new Last.fromJson(json['last']) : null;
    _total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._current != null) {
      data['current'] = this._current.toJson();
    }
    if (this._first != null) {
      data['first'] = this._first.toJson();
    }
    if (this._last != null) {
      data['last'] = this._last.toJson();
    }
    data['total'] = this._total;
    return data;
  }
}

class Current {
  String _id;
  String _name;
  String _logo;

  Current({String id, String name, String logo}) {
    this._id = id;
    this._name = name;
    this._logo = logo;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get logo => _logo;
  set logo(String logo) => _logo = logo;

  Current.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['logo'] = this._logo;
    return data;
  }
}

class First {
  String _id;
  String _name;
  String _logo;

  First({String id, String name, String logo}) {
    this._id = id;
    this._name = name;
    this._logo = logo;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get logo => _logo;
  set logo(String logo) => _logo = logo;

  First.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['logo'] = this._logo;
    return data;
  }
}

class Last {
  String _id;
  String _name;
  String _logo;

  Last({String id, String name, String logo}) {
    this._id = id;
    this._name = name;
    this._logo = logo;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get logo => _logo;
  set logo(String logo) => _logo = logo;

  Last.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['logo'] = this._logo;
    return data;
  }
}
