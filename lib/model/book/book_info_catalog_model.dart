class BookInfoCaModel {
  bool _success;
  List<BookInfoCaData> _data;

  BookInfoCaModel({bool success, List<BookInfoCaData> data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  List<BookInfoCaData> get data => _data;
  set data(List<BookInfoCaData> data) => _data = data;

  BookInfoCaModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = new List<BookInfoCaData>();
      json['data'].forEach((v) {
        _data.add(new BookInfoCaData.fromJson(v));
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

class BookInfoCaData {
  String _id;
  String _name;
  String _logo;

  BookInfoCaData({String id, String name, String logo}) {
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

  BookInfoCaData.fromJson(Map<String, dynamic> json) {
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
