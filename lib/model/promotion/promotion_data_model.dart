class ProDataModel {
  bool _success;
  ProDataData _data;

  ProDataModel({bool success, ProDataData data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  ProDataData get data => _data;
  set data(ProDataData data) => _data = data;

  ProDataModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _data = json['data'] != null ? new ProDataData.fromJson(json['data']) : null;
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

class ProDataData {
  List<ProDataK1> _k1;
  List<ProDataK2> _k2;
  List<ProDataK3> _k3;

  ProDataData({List<ProDataK1> k1, List<ProDataK2> k2, List<ProDataK3> k3}) {
    this._k1 = k1;
    this._k2 = k2;
    this._k3 = k3;
  }

  List<ProDataK1> get k1 => _k1;
  set k1(List<ProDataK1> k1) => _k1 = k1;
  List<ProDataK2> get k2 => _k2;
  set k2(List<ProDataK2> k2) => _k2 = k2;
  List<ProDataK3> get k3 => _k3;
  set k3(List<ProDataK3> k3) => _k3 = k3;

  ProDataData.fromJson(Map<String, dynamic> json) {
    if (json['k1'] != null) {
      _k1 = new List<ProDataK1>();
      json['k1'].forEach((v) {
        _k1.add(new ProDataK1.fromJson(v));
      });
    }
    if (json['k2'] != null) {
      _k2 = new List<ProDataK2>();
      json['k2'].forEach((v) {
        _k2.add(new ProDataK2.fromJson(v));
      });
    }
    if (json['k3'] != null) {
      _k3 = new List<ProDataK3>();
      json['k3'].forEach((v) {
        _k3.add(new ProDataK3.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._k1 != null) {
      data['k1'] = this._k1.map((v) => v.toJson()).toList();
    }
    if (this._k2 != null) {
      data['k2'] = this._k2.map((v) => v.toJson()).toList();
    }
    if (this._k3 != null) {
      data['k3'] = this._k3.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProDataK1 {
  String _id;
  String _name;
  String _image;
  int _sellPrice;
  int _originalPrice;

  ProDataK1({String id, String name, String image, int sellPrice, int originalPrice}) {
    this._id = id;
    this._name = name;
    this._image = image;
    this._sellPrice = sellPrice;
    this._originalPrice = originalPrice;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get image => _image;
  set image(String image) => _image = image;
  int get sellPrice => _sellPrice;
  set sellPrice(int sellPrice) => _sellPrice = sellPrice;
  int get originalPrice => _originalPrice;
  set originalPrice(int originalPrice) => _originalPrice = originalPrice;

  ProDataK1.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _sellPrice = json['sell_price'];
    _originalPrice = json['original_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['image'] = this._image;
    data['sell_price'] = this._sellPrice;
    data['original_price'] = this._originalPrice;
    return data;
  }
}

class ProDataK2 {
  String _id;
  String _name;
  String _image;
  int _sellPrice;
  int _originalPrice;

  ProDataK2({String id, String name, String image, int sellPrice, int originalPrice}) {
    this._id = id;
    this._name = name;
    this._image = image;
    this._sellPrice = sellPrice;
    this._originalPrice = originalPrice;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get image => _image;
  set image(String image) => _image = image;
  int get sellPrice => _sellPrice;
  set sellPrice(int sellPrice) => _sellPrice = sellPrice;
  int get originalPrice => _originalPrice;
  set originalPrice(int originalPrice) => _originalPrice = originalPrice;

  ProDataK2.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _sellPrice = json['sell_price'];
    _originalPrice = json['original_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['image'] = this._image;
    data['sell_price'] = this._sellPrice;
    data['original_price'] = this._originalPrice;
    return data;
  }
}

class ProDataK3 {
  String _id;
  String _name;
  String _image;
  int _sellPrice;
  int _originalPrice;

  ProDataK3({String id, String name, String image, int sellPrice, int originalPrice}) {
    this._id = id;
    this._name = name;
    this._image = image;
    this._sellPrice = sellPrice;
    this._originalPrice = originalPrice;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get image => _image;
  set image(String image) => _image = image;
  int get sellPrice => _sellPrice;
  set sellPrice(int sellPrice) => _sellPrice = sellPrice;
  int get originalPrice => _originalPrice;
  set originalPrice(int originalPrice) => _originalPrice = originalPrice;

  ProDataK3.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _sellPrice = json['sell_price'];
    _originalPrice = json['original_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['image'] = this._image;
    data['sell_price'] = this._sellPrice;
    data['original_price'] = this._originalPrice;
    return data;
  }
}
