class CateConfigModel {
  bool _success;
  CateConfigData _data;

  CateConfigModel({bool success, CateConfigData data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  CateConfigData get data => _data;
  set data(CateConfigData data) => _data = data;

  CateConfigModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _data = json['data'] != null ? new CateConfigData.fromJson(json['data']) : null;
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

class CateConfigData {
  CateConfigCate _category;
  List<CateConfigChannels> _channels;
  List<CateConfigStatus> _status;
  List<CateConfigTypes> _types;

  CateConfigData({CateConfigCate category, List<CateConfigChannels> channels, List<CateConfigStatus> status, List<CateConfigTypes> types}) {
    this._category = category;
    this._channels = channels;
    this._status = status;
    this._types = types;
  }

  CateConfigCate get category => _category;
  set category(CateConfigCate category) => _category = category;
  List<CateConfigChannels> get channels => _channels;
  set channels(List<CateConfigChannels> channels) => _channels = channels;
  List<CateConfigStatus> get status => _status;
  set status(List<CateConfigStatus> status) => _status = status;
  List<CateConfigTypes> get types => _types;
  set types(List<CateConfigTypes> types) => _types = types;

  CateConfigData.fromJson(Map<String, dynamic> json) {
    _category = json['category'] != null ? new CateConfigCate.fromJson(json['category']) : null;
    if (json['channels'] != null) {
      _channels = new List<CateConfigChannels>();
      json['channels'].forEach((v) { _channels.add(new CateConfigChannels.fromJson(v)); });
    }
    if (json['status'] != null) {
      _status = new List<CateConfigStatus>();
      json['status'].forEach((v) { _status.add(new CateConfigStatus.fromJson(v)); });
    }
    if (json['types'] != null) {
      _types = new List<CateConfigTypes>();
      json['types'].forEach((v) { _types.add(new CateConfigTypes.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._category != null) {
      data['category'] = this._category.toJson();
    }
    if (this._channels != null) {
      data['channels'] = this._channels.map((v) => v.toJson()).toList();
    }
    if (this._status != null) {
      data['status'] = this._status.map((v) => v.toJson()).toList();
    }
    if (this._types != null) {
      data['types'] = this._types.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CateConfigCate {
  List<CateConfigChannel1> _lchannelOne;
  List<CateConfigChannel2> _lchannelTwo;

  CateConfigCate({List<CateConfigChannel1> lchannelOne, List<CateConfigChannel2> lchannelTwo}) {
    this._lchannelOne = lchannelOne;
    this._lchannelTwo = lchannelTwo;
  }

  List<CateConfigChannel1> get lchannelOne => _lchannelOne;
  set lchannelOne(List<CateConfigChannel1> lchannelOne) => _lchannelOne = lchannelOne;
  List<CateConfigChannel2> get lchannelTwo => _lchannelTwo;
  set lchannelTwo(List<CateConfigChannel2> lchannelTwo) => _lchannelTwo = lchannelTwo;

  CateConfigCate.fromJson(Map<String, dynamic> json) {
    if (json['1'] != null) {
      _lchannelOne = new List<CateConfigChannel1>();
      json['1'].forEach((v) { _lchannelOne.add(new CateConfigChannel1.fromJson(v)); });
    }
    if (json['2'] != null) {
      _lchannelTwo = new List<CateConfigChannel2>();
      json['2'].forEach((v) { _lchannelTwo.add(new CateConfigChannel2.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._lchannelOne != null) {
      data['1'] = this._lchannelOne.map((v) => v.toJson()).toList();
    }
    if (this._lchannelTwo != null) {
      data['2'] = this._lchannelTwo.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CateConfigChannel1 {
int _k;
String _v;

CateConfigChannel1({int k, String v}) {
this._k = k;
this._v = v;
}

int get k => _k;
set k(int k) => _k = k;
String get v => _v;
set v(String v) => _v = v;

CateConfigChannel1.fromJson(Map<String, dynamic> json) {
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

class CateConfigChannel2 {
int _k;
String _v;

CateConfigChannel2({int k, String v}) {
this._k = k;
this._v = v;
}

int get k => _k;
set k(int k) => _k = k;
String get v => _v;
set v(String v) => _v = v;

CateConfigChannel2.fromJson(Map<String, dynamic> json) {
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

class CateConfigChannels {
int _k;
String _v;

CateConfigChannels({int k, String v}) {
this._k = k;
this._v = v;
}

int get k => _k;
set k(int k) => _k = k;
String get v => _v;
set v(String v) => _v = v;

CateConfigChannels.fromJson(Map<String, dynamic> json) {
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

class CateConfigStatus {
int _k;
String _v;

CateConfigStatus({int k, String v}) {
this._k = k;
this._v = v;
}

int get k => _k;
set k(int k) => _k = k;
String get v => _v;
set v(String v) => _v = v;

CateConfigStatus.fromJson(Map<String, dynamic> json) {
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

class CateConfigTypes {
int _k;
String _v;

CateConfigTypes({int k, String v}) {
this._k = k;
this._v = v;
}

int get k => _k;
set k(int k) => _k = k;
String get v => _v;
set v(String v) => _v = v;

CateConfigTypes.fromJson(Map<String, dynamic> json) {
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
