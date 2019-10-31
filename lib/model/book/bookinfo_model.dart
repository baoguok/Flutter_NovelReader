class BookinfoModel {
  bool _success;
  BookinfoData _data;

  BookinfoModel({bool success, BookinfoData data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  BookinfoData get data => _data;
  set data(BookinfoData data) => _data = data;

  BookinfoModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _data = json['data'] != null ? new BookinfoData.fromJson(json['data']) : null;
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

class BookinfoData {
  String _id;
  String _name;
  String _image;
  String _author;
  String _cat;
  String _desc;
  String _status;
  int _clicks;
  int _words;
  List<String> _tags;
  List<String> _scope;
  String _type;
  int _sellPrice;
  int _originalPrice;

  BookinfoData(
      {String id,
        String name,
        String image,
        String author,
        String cat,
        String desc,
        String status,
        int clicks,
        int words,
        List<String> tags,
        List<String> scope,
        String type,
        int sellPrice,
        int originalPrice}) {
    this._id = id;
    this._name = name;
    this._image = image;
    this._author = author;
    this._cat = cat;
    this._desc = desc;
    this._status = status;
    this._clicks = clicks;
    this._words = words;
    this._tags = tags;
    this._scope = scope;
    this._type = type;
    this._sellPrice = sellPrice;
    this._originalPrice = originalPrice;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get image => _image;
  set image(String image) => _image = image;
  String get author => _author;
  set author(String author) => _author = author;
  String get cat => _cat;
  set cat(String cat) => _cat = cat;
  String get desc => _desc;
  set desc(String desc) => _desc = desc;
  String get status => _status;
  set status(String status) => _status = status;
  int get clicks => _clicks;
  set clicks(int clicks) => _clicks = clicks;
  int get words => _words;
  set words(int words) => _words = words;
  List<String> get tags => _tags;
  set tags(List<String> tags) => _tags = tags;
  List<String> get scope => _scope;
  set scope(List<String> scope) => _scope = scope;
  String get type => _type;
  set type(String type) => _type = type;
  int get sellPrice => _sellPrice;
  set sellPrice(int sellPrice) => _sellPrice = sellPrice;
  int get originalPrice => _originalPrice;
  set originalPrice(int originalPrice) => _originalPrice = originalPrice;

  BookinfoData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _author = json['author'];
    _cat = json['cat'];
    _desc = json['desc'];
    _status = json['status'];
    _clicks = json['clicks'];
    _words = json['words'];
    _tags = json['tags'].cast<String>();
    _scope = json['scope'].cast<String>();
    _type = json['type'];
    _sellPrice = json['sell_price'];
    _originalPrice = json['original_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['image'] = this._image;
    data['author'] = this._author;
    data['cat'] = this._cat;
    data['desc'] = this._desc;
    data['status'] = this._status;
    data['clicks'] = this._clicks;
    data['words'] = this._words;
    data['tags'] = this._tags;
    data['scope'] = this._scope;
    data['type'] = this._type;
    data['sell_price'] = this._sellPrice;
    data['original_price'] = this._originalPrice;
    return data;
  }
}
