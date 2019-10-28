
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_reader/model/home/home_banner_model.dart';

const BannerURL = 'http://appapi.98nice.cn/api/topic/banner?channel=2';
const BSAuthorization = 'C2B92CBAA2B92328A330DC3D50B73CEE';

class HomeDao{
  static Future<HomePageBannerModel> fetchBanner() async{
    final response = await http.get(BannerURL,headers: {'BSAuthorization':BSAuthorization,'READING':'API'});
    if(response.statusCode == 200){
      //解决中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      final json = jsonDecode(utf8decoder.convert(response.bodyBytes));
      return HomePageBannerModel.fromJson(json);
    }
    else{
      throw Exception('加载banner接口失败');
    }
  }
}