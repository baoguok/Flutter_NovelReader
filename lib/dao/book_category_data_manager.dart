import 'dart:convert';
import 'package:flutter_reader/model/category/category_config_model.dart';
import 'package:flutter_reader/model/category/category_list_model.dart';
import 'package:http/http.dart' as http;

const BSAuthorization = 'C2B92CBAA2B92328A330DC3D50B73CEE';
const BaseURL = 'http://appapi.98nice.cn/api';

class BookCategoryDao{
  static Future<CateConfigModel> fetchCateConfig() async{
    final response = await http.get(BaseURL+'/config/category',
        headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if( response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return CateConfigModel.fromJson(json);
    }
    else
    {
      throw Exception('加载cateconfig接口失败');
    }
  }

  static Future<CateListModel> fetchCateList(int channel,int cat,int status,int type,int page) async{
    final response = await http.get(BaseURL+'/search/filter?channel=${channel}&cat=${cat}&status=${status}&fee=${type}&page=${page}&format=full',
        headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if( response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return CateListModel.fromJson(json);
    }
    else
    {
      throw Exception('加载catelist接口失败');
    }
  }
}