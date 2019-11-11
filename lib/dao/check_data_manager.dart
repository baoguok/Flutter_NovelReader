import 'dart:convert';
import 'package:flutter_reader/model/check/check_config_model.dart';
import 'package:flutter_reader/model/check/check_model.dart';
import 'package:http/http.dart' as http;

const BSAuthorization = 'C2B92CBAA2B92328A330DC3D50B73CEE';
const BaseURL = 'http://appapi.98nice.cn/api';

class CheckDao{
  static Future<CheckConfigModel> fetchCheckConfig() async{
    final response = await http.get(BaseURL+'/config/sign'
        ,headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if(response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return CheckConfigModel.fromJson(json);
    }
    else
    {
      throw Exception('加载checkconfig接口失败');
    }
  }

  static Future<CheckModel> getToCheck() async{
    final response = await http.get(BaseURL+'/user/sign/daily'
        ,headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if(response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return CheckModel.fromJson(json);
    }
    else
    {
      throw Exception('加载check接口失败');
    }
  }
}