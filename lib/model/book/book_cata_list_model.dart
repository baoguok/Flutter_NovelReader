class CataListModel {
  bool _success;
  List<CataListData> _data;

  CataListModel({bool success, List<CataListData> data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  List<CataListData> get data => _data;
  set data(List<CataListData> data) => _data = data;

  CataListModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = new List<CataListData>();
      json['data'].forEach((v) {
        _data.add(new CataListData.fromJson(v));
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

class CataListData {
  String _id;
  String _name;
  String _logo;

  CataListData({String id, String name, String logo}) {
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

  CataListData.fromJson(Map<String, dynamic> json) {
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
