import 'dart:convert';
import 'dart:math';
import 'package:flutter_reader/model/book/book_collect_model.dart';
import 'package:flutter_reader/model/book/book_delete_model.dart';
import 'package:flutter_reader/model/book/book_history_model.dart';
import 'package:flutter_reader/model/book/bookshelf_model.dart';
import 'package:http/http.dart' as http;

const BSAuthorization = 'C2B92CBAA2B92328A330DC3D50B73CEE';
const BaseURL = 'http://appapi.98nice.cn/api';

class BookCollectDao{
  static Future<BookCollectModel> getForCollect(String id) async{
    final response = await http.get(BaseURL+'/book/fav?id=${id}',
        headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if( response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return BookCollectModel.fromJson(json);
    }
    else
    {
      throw Exception('加载bookcollect接口失败');
    }
  }

  static Future<BookShelfModel> fetchBookShelf() async{
    final response = await http.get(BaseURL+'/record/favorite?format=normal',
        headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if( response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return BookShelfModel.fromJson(json);
    }
    else
    {
      throw Exception('加载bookshelf接口失败');
    }
  }

  static Future<BookDeleteModel> deleteBook(List<String> list) async{
    String idlist = '';
    for(int i = 0; i < list.length;i++){
      if(i==0){
        idlist = idlist + '${list[i]}';
      }
      else
        {
          idlist = idlist + ',' + '${list[i]}';
        }
    }
    final response = await http.delete(BaseURL+'/manage/favorite?id=${idlist}',
        headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if( response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return BookDeleteModel.fromJson(json);
    }
    else
    {
      throw Exception('加载bookdelete接口失败');
    }
  }

  static Future<BookHistoryModel> fetchBookHistory() async {
    final response = await http.get(BaseURL+'/record/footprint',
        headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if( response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return BookHistoryModel.fromJson(json);
    }
    else
    {
      throw Exception('加载bookhistory接口失败');
    }
  }
}