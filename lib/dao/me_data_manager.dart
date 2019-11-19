import 'package:flutter_reader/model/me/consum_model.dart';
import 'package:flutter_reader/model/me/exchange_config_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const BSAuthorization = 'C2B92CBAA2B92328A330DC3D50B73CEE';
const BaseURL = 'http://appapi.98nice.cn/api';

class MeDao{
  static Future<ConsumModel> fetchConsumData() async{
    final response = await http.get(BaseURL+'/record/consume?page=1'
        ,headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if(response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return ConsumModel.fromJson(json);
    }
    else
    {
      throw Exception('加载consum接口失败');
    }
  }

  static Future<ConsumModel> fetchRechargeData() async{
    final response = await http.get(BaseURL+'/record/charge?page=1'
        ,headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if(response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return ConsumModel.fromJson(json);
    }
    else
    {
      throw Exception('加载recharge接口失败');
    }
  }

  static Future<ExchangeConfigModel> fetchExchangeConfig() async{
    final response = await http.get(BaseURL+'/config/exchange'
        ,headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if(response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return ExchangeConfigModel.fromJson(json);
    }
    else
    {
      throw Exception('加载exchangeconfig接口失败');
    }
  }
}