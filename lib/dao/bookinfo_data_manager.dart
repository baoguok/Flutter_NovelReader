import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_reader/model/book/book_buy_model.dart';
import 'package:flutter_reader/model/book/book_cata_info_model.dart';
import 'package:flutter_reader/model/book/book_cata_list_model.dart';
import 'package:flutter_reader/model/book/book_info_catalog_model.dart';
import 'package:flutter_reader/model/book/bookinfo_model.dart';
import 'package:flutter_reader/model/home/guess_like_model.dart';
import 'package:http/http.dart' as http;

const BSAuthorization = 'C2B92CBAA2B92328A330DC3D50B73CEE';
const BaseURL = 'http://appapi.98nice.cn/api';


class BookDao{
  static Future<BookinfoModel> fetchBookinfo(id) async{
    final response = await http.get(BaseURL+'/book/profile?id=${id}',
    headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if( response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return BookinfoModel.fromJson(json);
    }
    else
    {
      throw Exception('加载bookinfo接口失败');
    }
  }

  static Future<BookInfoCaModel> fetchBookInfoCa(id) async{
    final response = await http.get(BaseURL+'/chap/list?id=${id}&page=1&limit=6&sort=0&no=0',
        headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if( response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return BookInfoCaModel.fromJson(json);
    }
    else
    {
      throw Exception('加载bookinfoCa接口失败');
    }
  }

  static Future<GuessModel> fetchGuess(String channel) async{
    final response = await http.get(BaseURL+'/topic/gene?channel=${channel}&size=4&format=full',
        headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if(response.statusCode == 200){
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return GuessModel.fromJson(json);
    }
    else
    {
      throw Exception('加载guess接口失败');
    }
  }
  
  static Future<CataInfoModel> fetchCataInfo(String id) async{
    final response = await http.get(BaseURL+'/chap/info?id=${id}',
        headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if(response.statusCode == 200){
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return CataInfoModel.fromJson(json);
    }
    else
    {
      throw Exception('加载catainfo接口失败');
    }
  }

  static Future<CataListModel> fetchCataList(String id,int startNum) async{
    final response = await http.get(BaseURL+'/chap/list?id=${id}&page=1&limit=100&sort=0&no=${startNum}',
        headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if(response.statusCode == 200){
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return CataListModel.fromJson(json);
    }
    else
    {
      throw Exception('加载catalist接口失败');
    }
  }

  static Future<bool> buyBook(String id) async {
    Dio dio = Dio();
    final response = await dio.get(BaseURL+'/book/buy?id=${id}',
        options: Options(
            headers: {
              'BSAuthorization':BSAuthorization,
              'READING':'API',
              }));
    if (response.statusCode == 200) {
      return response.data['success'];
    }
    else {
      print(response.statusCode);
      throw Exception('加载buybook接口失败');
    }
  }
}