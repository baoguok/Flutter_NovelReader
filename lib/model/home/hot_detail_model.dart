class HotDetailModel {
  bool _success;
  List<HotDetailData> _data;

  HotDetailModel({bool success, List<HotDetailData> data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  List<HotDetailData> get data => _data;
  set data(List<HotDetailData> data) => _data = data;

  HotDetailModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = new List<HotDetailData>();
      json['data'].forEach((v) {
        _data.add(new HotDetailData.fromJson(v));
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

class HotDetailData {
  String _id;
  String _name;
  String _image;
  String _cat;
  String _desc;
  String _status;
  int _clicks;

  HotDetailData(
      {String id,
        String name,
        String image,
        String cat,
        String desc,
        String status,
        int clicks}) {
    this._id = id;
    this._name = name;
    this._image = image;
    this._cat = cat;
    this._desc = desc;
    this._status = status;
    this._clicks = clicks;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get image => _image;
  set image(String image) => _image = image;
  String get cat => _cat;
  set cat(String cat) => _cat = cat;
  String get desc => _desc;
  set desc(String desc) => _desc = desc;
  String get status => _status;
  set status(String status) => _status = status;
  int get clicks => _clicks;
  set clicks(int clicks) => _clicks = clicks;

  HotDetailData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _cat = json['cat'];
    _desc = json['desc'];
    _status = json['status'];
    _clicks = json['clicks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['image'] = this._image;
    data['cat'] = this._cat;
    data['desc'] = this._desc;
    data['status'] = this._status;
    data['clicks'] = this._clicks;
    return data;
  }
}
