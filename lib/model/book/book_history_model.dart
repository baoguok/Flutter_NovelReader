class BookHistoryModel {
  bool _success;
  List<BookHistoryData> _data;

  BookHistoryModel({bool success, List<BookHistoryData> data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  List<BookHistoryData> get data => _data;
  set data(List<BookHistoryData> data) => _data = data;

  BookHistoryModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = new List<BookHistoryData>();
      json['data'].forEach((v) {
        _data.add(new BookHistoryData.fromJson(v));
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

class BookHistoryData {
  String _id;
  String _name;
  String _image;
  String _status;
  String _chapter;
  String _progress;

  BookHistoryData(
      {String id,
        String name,
        String image,
        String status,
        String chapter,
        String progress}) {
    this._id = id;
    this._name = name;
    this._image = image;
    this._status = status;
    this._chapter = chapter;
    this._progress = progress;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get image => _image;
  set image(String image) => _image = image;
  String get status => _status;
  set status(String status) => _status = status;
  String get chapter => _chapter;
  set chapter(String chapter) => _chapter = chapter;
  String get progress => _progress;
  set progress(String progress) => _progress = progress;

  BookHistoryData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _status = json['status'];
    _chapter = json['chapter'];
    _progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['image'] = this._image;
    data['status'] = this._status;
    data['chapter'] = this._chapter;
    data['progress'] = this._progress;
    return data;
  }
}
