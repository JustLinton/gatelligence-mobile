import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gatelligence/utils/localStorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 本地存储工具类
class Service {

  static final String baseURL="https://app.cupof.beer:8090";

  static Future<String> sayHello() async {
    Response response;
    var dio = Dio();
    response = await dio.get(baseURL+'/');
    return response.toString();
  }

  static Future<bool> loginViaEmail(String email, String passwd) async {
    Response response;
    String token,errmsg;
    bool success;
    var dio = Dio();
    var formData = FormData.fromMap({
      'email': email,
      'password': passwd,
    });
    response = await dio.post(baseURL + '/frontEnd/login', data: formData);
    var data = jsonDecode(response.toString()); //3
    token = data['Token'];
    success = data['IsSuccess'];
    errmsg=data['ErrorMsg'];
    if(success){
      LocalStorage.setString('token', token);
    }
    return success;
  }

}
