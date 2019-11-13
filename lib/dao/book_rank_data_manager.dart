import 'dart:convert';
import 'package:flutter_reader/model/rank/book_rank_detail_model.dart';
import 'package:flutter_reader/model/rank/book_rank_model.dart';
import 'package:http/http.dart' as http;

const BSAuthorization = 'C2B92CBAA2B92328A330DC3D50B73CEE';
const BaseURL = 'http://appapi.98nice.cn/api';

class BookRankDao{
  static Future<RankConfigModel> fetchRankConfig() async{
    final response = await http.get(BaseURL+'/config/rank',
        headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if( response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return RankConfigModel.fromJson(json);
    }
    else
    {
      throw Exception('加载rankconfig接口失败');
    }
  }

  static Future<RankDetailModel> fetchRankDetail(String channel,int id,int page) async{
    final response = await http.get(BaseURL+'/rank/one?channel=${channel}&id=${id}&page=${page}&format=full',
        headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if( response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return RankDetailModel.fromJson(json);
    }
    else
    {
      throw Exception('加载rankdetail接口失败');
    }
  }
}
