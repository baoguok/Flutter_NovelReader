class RankConfigModel {
  bool _success;
  List<RankConfigData> _data;

  RankConfigModel({bool success, List<RankConfigData> data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  List<RankConfigData> get data => _data;
  set data(List<RankConfigData> data) => _data = data;

  RankConfigModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = new List<RankConfigData>();
      json['data'].forEach((v) {
        _data.add(new RankConfigData.fromJson(v));
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

class RankConfigData {
  int _k;
  String _v;

  RankConfigData({int k, String v}) {
    this._k = k;
    this._v = v;
  }

  int get k => _k;
  set k(int k) => _k = k;
  String get v => _v;
  set v(String v) => _v = v;

  RankConfigData.fromJson(Map<String, dynamic> json) {
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
