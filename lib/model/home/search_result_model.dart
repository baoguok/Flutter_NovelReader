class SearchModel {
  bool _success;
  List<SearchData> _data;

  SearchModel({bool success, List<SearchData> data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  List<SearchData> get data => _data;
  set data(List<SearchData> data) => _data = data;

  SearchModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = new List<SearchData>();
      json['data'].forEach((v) {
        _data.add(new SearchData.fromJson(v));
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

class SearchData {
  String _id;
  String _name;
  String _image;

  SearchData({String id, String name, String image}) {
    this._id = id;
    this._name = name;
    this._image = image;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get image => _image;
  set image(String image) => _image = image;

  SearchData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['image'] = this._image;
    return data;
  }
}
