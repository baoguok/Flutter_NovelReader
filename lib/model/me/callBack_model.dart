class CallBackModel {
  bool _success;
  String _data;

  CallBackModel({bool success, String data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  String get data => _data;
  set data(String data) => _data = data;

  CallBackModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['data'] = this._data;
    return data;
  }
}
