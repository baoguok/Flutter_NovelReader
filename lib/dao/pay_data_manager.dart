import 'dart:async';
import 'dart:convert';//模型转换用到
import 'package:flutter_reader/model/pay/pay_config_model.dart';
import 'package:http/http.dart' as http;

const BSAuthorization = 'C2B92CBAA2B92328A330DC3D50B73CEE';
const BaseURL = 'http://appapi.98nice.cn/api';

class PayDao {

  static Future<PayConfigModel> fetchConfig() async{
    final response = await http.get(BaseURL+'/config/pay'
        ,headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if(response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return PayConfigModel.fromJson(json);
    }
    else
    {
      throw Exception('加载payconfig接口失败');
    }
  }

}