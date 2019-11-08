class ConsumModel {
  bool _success;
  List<ConsumData> _data;

  ConsumModel({bool success, List<ConsumData> data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  List<ConsumData> get data => _data;
  set data(List<ConsumData> data) => _data = data;

  ConsumModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = new List<ConsumData>();
      json['data'].forEach((v) {
        _data.add(new ConsumData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ConsumData {
  String _title;
  String _desc;
  String _date;
  String _prod;

  ConsumData({String title, String desc, String date, String prod}) {
    this._title = title;
    this._desc = desc;
    this._date = date;
    this._prod = prod;
  }

  String get title => _title;
  set title(String title) => _title = title;
  String get desc => _desc;
  set desc(String desc) => _desc = desc;
  String get date => _date;
  set date(String date) => _date = date;
  String get prod => _prod;
  set prod(String prod) => _prod = prod;

  ConsumData.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _desc = json['desc'];
    _date = json['date'];
    _prod = json['prod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['desc'] = this._desc;
    data['date'] = this._date;
    data['prod'] = this._prod;
    return data;
  }
}
