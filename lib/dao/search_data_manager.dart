import 'dart:async';
import 'dart:convert';//模型转换用到
import 'package:flutter_reader/model/home/search_result_model.dart';
import 'package:http/http.dart' as http;

const BSAuthorization = 'C2B92CBAA2B92328A330DC3D50B73CEE';

/// 搜索页面数据管理类
class SearchDataManager {

  static Future<SearchModel> fetch(String url, String text) async {
    final http.Response response = await http.get(url,headers: {'BSAuthorization':BSAuthorization,'READING':'API'});

    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();//修复中文乱码问题
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      // 防止搜索过快
      SearchModel model = SearchModel.fromJson(result);
      return model;
    } else {
      throw Exception("搜索接口请求失败");
    }
  }
}