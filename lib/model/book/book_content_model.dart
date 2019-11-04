class BookContentModel {
  bool _success;
  BookContentData _data;

  BookContentModel({bool success, BookContentData data}) {
    this._success = success;
    this._data = data;
  }

  bool get success => _success;
  set success(bool success) => _success = success;
  BookContentData get data => _data;
  set data(BookContentData data) => _data = data;

  BookContentModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _data = json['data'] != null ? new BookContentData.fromJson(json['data']) : null;
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

class BookContentData {
  String _visible;
  String _url;
  String _name;
  int _price;
  int _bookSellPrice;
  int _bookOriginalPrice;
  int _userCoin;
  int _userGift;
  String _pre;
  String _next;
  String _pushInfo;

  BookContentData(
      {String visible,
        String url,
        String name,
        int price,
        int bookSellPrice,
        int bookOriginalPrice,
        int userCoin,
        int userGift,
        String pre,
        String next,
        String pushInfo}) {
    this._visible = visible;
    this._url = url;
    this._name = name;
    this._price = price;
    this._bookSellPrice = bookSellPrice;
    this._bookOriginalPrice = bookOriginalPrice;
    this._userCoin = userCoin;
    this._userGift = userGift;
    this._pre = pre;
    this._next = next;
    this._pushInfo = pushInfo;
  }

  String get visible => _visible;
  set visible(String visible) => _visible = visible;
  String get url => _url;
  set url(String url) => _url = url;
  String get name => _name;
  set name(String name) => _name = name;
  int get price => _price;
  set price(int price) => _price = price;
  int get bookSellPrice => _bookSellPrice;
  set bookSellPrice(int bookSellPrice) => _bookSellPrice = bookSellPrice;
  int get bookOriginalPrice => _bookOriginalPrice;
  set bookOriginalPrice(int bookOriginalPrice) =>
      _bookOriginalPrice = bookOriginalPrice;
  int get userCoin => _userCoin;
  set userCoin(int userCoin) => _userCoin = userCoin;
  int get userGift => _userGift;
  set userGift(int userGift) => _userGift = userGift;
  String get pre => _pre;
  set pre(String pre) => _pre = pre;
  String get next => _next;
  set next(String next) => _next = next;
  String get pushInfo => _pushInfo;
  set pushInfo(String pushInfo) => _pushInfo = pushInfo;

  BookContentData.fromJson(Map<String, dynamic> json) {
    _visible = json['visible'];
    _url = json['url'];
    _name = json['name'];
    _price = json['price'];
    _bookSellPrice = json['book_sell_price'];
    _bookOriginalPrice = json['book_original_price'];
    _userCoin = json['user_coin'];
    _userGift = json['user_gift'];
    _pre = json['pre'];
    _next = json['next'];
    _pushInfo = json['push_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['visible'] = this._visible;
    data['url'] = this._url;
    data['name'] = this._name;
    data['price'] = this._price;
    data['book_sell_price'] = this._bookSellPrice;
    data['book_original_price'] = this._bookOriginalPrice;
    data['user_coin'] = this._userCoin;
    data['user_gift'] = this._userGift;
    data['pre'] = this._pre;
    data['next'] = this._next;
    data['push_info'] = this._pushInfo;
    return data;
  }
}
