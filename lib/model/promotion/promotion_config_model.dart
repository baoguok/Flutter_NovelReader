class ProConfigModel {
  bool _success;
  List<ProConfigData> _data;

  ProConfigModel({bool success, List<ProConfigData> data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  List<ProConfigData> get data => _data;
  set data(List<ProConfigData> data) => _data = data;

  ProConfigModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = new List<ProConfigData>();
      json['data'].forEach((v) {
        _data.add(new ProConfigData.fromJson(v));
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

class ProConfigData {
  String _k;
  String _v;

  ProConfigData({String k, String v}) {
    this._k = k;
    this._v = v;
  }

  String get k => _k;
  set k(String k) => _k = k;
  String get v => _v;
  set v(String v) => _v = v;

  ProConfigData.fromJson(Map<String, dynamic> json) {
    _k = json['k'];
    _v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['k'] = this._k;
    data['v'] = this._v;
    return data;
  }
}
