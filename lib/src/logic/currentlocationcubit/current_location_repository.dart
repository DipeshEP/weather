import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather/src/constants/constants.dart';
import 'package:weather/src/services/api_helper.dart';

import '../../model/current_temp_model.dart';

class CurrentLocationRepository{

  /// this is the function for get details
  Future<Response?> fetchDetails()async{
    try {
      Response? response = await ApiHelper.internal().getRequest(
          Constants.currentTemprature);
      if(response!.statusCode==200|| response.statusCode==201){
        return response;
      }
    }catch(ex){
      print(ex);
      throw Exception(ex);
    }
  }
}