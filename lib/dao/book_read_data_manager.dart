import 'dart:convert';
import 'package:flutter_reader/model/book/book_content_model.dart';
import 'package:http/http.dart' as http;

const BSAuthorization = 'C2B92CBAA2B92328A330DC3D50B73CEE';
const BaseURL = 'http://appapi.98nice.cn/api';

class BookReadDao{
  static Future<BookContentModel> fetchBookContent(String id) async{
    final response = await http.get(BaseURL+'/chap/read?id=${id}',
        headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if( response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return BookContentModel.fromJson(json);
    }
    else
    {
      throw Exception('加载bookcontent接口失败');
    }
  }

  static Future<String> fetchDataFromUrl(url) async{
    final response = await http.get(url,
        headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
      return response.body;
  }
}