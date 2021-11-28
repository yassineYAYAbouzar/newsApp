import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper{
  static Dio dio;
  static init(){
    dio = Dio();
  }

 static Future<Response> getData({
  @required String url,
  @required dynamic query
})async
  {
    return await dio.get('https://newsapi.org/$url', queryParameters: query);
  }
}