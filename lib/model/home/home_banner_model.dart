class HomePageBannerModel {
  bool _success;
  List<bannerData> _data;

  HomePageBannerModel({bool success, List<bannerData> data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  List<bannerData> get data => _data;
  set data(List<bannerData> data) => _data = data;

  HomePageBannerModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = new List<bannerData>();
      json['data'].forEach((v) {
        _data.add(new bannerData.fromJson(v));
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

class bannerData {
  String _id;
  String _type;
  String _image;
  String _url;

  bannerData({String id, String type, String image, String url}) {
    this._id = id;
    this._type = type;
    this._image = image;
    this._url = url;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get type => _type;
  set type(String type) => _type = type;
  String get image => _image;
  set image(String image) => _image = image;
  String get url => _url;
  set url(String url) => _url = url;

  bannerData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _type = json['type'];
    _image = json['image'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['type'] = this._type;
    data['image'] = this._image;
    data['url'] = this._url;
    return data;
  }
}