class HotModel {
  bool _success;
  HotData _data;

  HotModel({bool success, HotData data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  HotData get data => _data;
  set data(HotData data) => _data = data;

  HotModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _data = json['data'] != null ? new HotData.fromJson(json['data']) : null;
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

class HotData {
  App _app;
  String _pushInfo;
  List<Shortcut> _shortcut;

  HotData({App app, String pushInfo, List<Shortcut> shortcut}) {
    this._app = app;
    this._pushInfo = pushInfo;
    this._shortcut = shortcut;
  }

  App get app => _app;
  set app(App app) => _app = app;
  String get pushInfo => _pushInfo;
  set pushInfo(String pushInfo) => _pushInfo = pushInfo;
  List<Shortcut> get shortcut => _shortcut;
  set shortcut(List<Shortcut> shortcut) => _shortcut = shortcut;

  HotData.fromJson(Map<String, dynamic> json) {
    _app = json['app'] != null ? new App.fromJson(json['app']) : null;
    _pushInfo = json['push_info'];
    if (json['shortcut'] != null) {
      _shortcut = new List<Shortcut>();
      json['shortcut'].forEach((v) {
        _shortcut.add(new Shortcut.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._app != null) {
      data['app'] = this._app.toJson();
    }
    data['push_info'] = this._pushInfo;
    if (this._shortcut != null) {
      data['shortcut'] = this._shortcut.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class App {
  String _time;
  String _qq;
  String _name;
  String _image;

  App({String time, String qq, String name, String image}) {
    this._time = time;
    this._qq = qq;
    this._name = name;
    this._image = image;
  }

  String get time => _time;
  set time(String time) => _time = time;
  String get qq => _qq;
  set qq(String qq) => _qq = qq;
  String get name => _name;
  set name(String name) => _name = name;
  String get image => _image;
  set image(String image) => _image = image;

  App.fromJson(Map<String, dynamic> json) {
    _time = json['time'];
    _qq = json['qq'];
    _name = json['name'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this._time;
    data['qq'] = this._qq;
    data['name'] = this._name;
    data['image'] = this._image;
    return data;
  }
}

class Shortcut {
  String _bookId;
  String _channel;
  String _hint;
  String _image;
  String _listTitle;
  String _listType;
  String _name;
  String _type;

  Shortcut(
      {String bookId,
        String channel,
        String hint,
        String image,
        String listTitle,
        String listType,
        String name,
        String type}) {
    this._bookId = bookId;
    this._channel = channel;
    this._hint = hint;
    this._image = image;
    this._listTitle = listTitle;
    this._listType = listType;
    this._name = name;
    this._type = type;
  }

  String get bookId => _bookId;
  set bookId(String bookId) => _bookId = bookId;
  String get channel => _channel;
  set channel(String channel) => _channel = channel;
  String get hint => _hint;
  set hint(String hint) => _hint = hint;
  String get image => _image;
  set image(String image) => _image = image;
  String get listTitle => _listTitle;
  set listTitle(String listTitle) => _listTitle = listTitle;
  String get listType => _listType;
  set listType(String listType) => _listType = listType;
  String get name => _name;
  set name(String name) => _name = name;
  String get type => _type;
  set type(String type) => _type = type;

  Shortcut.fromJson(Map<String, dynamic> json) {
    _bookId = json['book_id'];
    _channel = json['channel'];
    _hint = json['hint'];
    _image = json['image'];
    _listTitle = json['list_title'];
    _listType = json['list_type'];
    _name = json['name'];
    _type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['book_id'] = this._bookId;
    data['channel'] = this._channel;
    data['hint'] = this._hint;
    data['image'] = this._image;
    data['list_title'] = this._listTitle;
    data['list_type'] = this._listType;
    data['name'] = this._name;
    data['type'] = this._type;
    return data;
  }
}
