import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather/src/constants/constants.dart';
import 'package:weather/src/model/current_temp_model.dart';

class ApiHelper{

  ///singleton class
  static final ApiHelper _apiHelper=ApiHelper.internal();
  factory ApiHelper()=>_apiHelper;
  ApiHelper.internal();

  Dio dio=Dio();

  Future<Response?>getRequest(String route)async{
   String url=Constants.baseUrl+route;
   try{
     Response response=await dio.get(url);
     if(response.statusCode==200||response.statusCode==201){
      return response;
     }
   }catch(ex){
     throw Exception(ex);
   }
   return null;
  }
}