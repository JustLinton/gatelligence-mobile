import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gatelligence/entity/checkLinkTransactionResponse.dart';
import 'package:gatelligence/utils/localStorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:gatelligence/entity/userTaskList.dart';

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

  static Future<bool> registerViaEmail(String email, String passwd,String nickName) async {
    Response response;
    String errmsg;
    bool success;
    var dio = Dio();
    var formData = FormData.fromMap({
      'email': email,
      'password': passwd,
      'nickName': nickName,
    });
    response = await dio.post(baseURL + '/frontEnd/register', data: formData);
    var data = jsonDecode(response.toString()); //3
    success = data['IsSuccess'];
    errmsg = data['ErrorMsg'];
    return success;
  }


  static Future<UserTaskList> fetchUserTaskList(
      int page) async {
    Response response;
    UserTaskList ret;
    var dio = Dio();
    var token= await LocalStorage.getString('token');
    var formData = FormData.fromMap({
      'token': token,
      'page':page,
    });
    response = await dio.post(baseURL + '/frontEnd/fetchList', data: formData);
    var data = jsonDecode(response.toString()); //3
    ret=UserTaskList.fromJson(data);

    return ret;
  }

   static Future<CheckLinkTransactionResponse> checkLinkTransaction(String tid) async {
    Response response;
    CheckLinkTransactionResponse ret;
    var dio = Dio();
    var token = await LocalStorage.getString('token');
    var formData = FormData.fromMap({
      'token': token,
      'tid': tid,
    });
    response = await dio.post(baseURL + '/frontEnd/checkLinkTransaction', data: formData);
    var data = jsonDecode(response.toString()); //3
    ret = CheckLinkTransactionResponse.fromJson(data);

    return ret;
  }

  static logout(){
    LocalStorage.remove('token');
  }

}
