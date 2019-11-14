import 'dart:io';
import 'dart:math';

import 'package:flutter_reader/model/me/callBack_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';

const BSAuthorization = 'C2B92CBAA2B92328A330DC3D50B73CEE';
const BaseURL = 'http://appapi.98nice.cn/api';

class callBackDao{
  static Future<bool> postSuggestion(Map msg) async {

    Dio dio = Dio();

    final response = await dio.post('http://appapi.98nice.cn/api/user/feedback',
        data: msg,
        options: Options(
            contentType:Headers.formUrlEncodedContentType,
            headers: {
      'BSAuthorization':'C2B92CBAA2B92328A330DC3D50B73CEE',
      'READING':'API',
      'Content-Type':'application/x-www-form-urlencoded'}));
    if(response.statusCode == 200)
    {
     return response.data['success'];
    }
    else
    {
      print(response.statusCode);
      throw Exception('加载callback接口失败');
    }
  }
}