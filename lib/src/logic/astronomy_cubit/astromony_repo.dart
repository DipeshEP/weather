import 'package:dio/dio.dart';
import 'package:weather/src/constants/constants.dart';
import 'package:weather/src/services/api_helper.dart';

class AstronomyRepo{
  Future<Response?>fetchDetails()async{
   try{
     Response? response=await ApiHelper.internal().getRequest(Constants.astronomy);
     if(response!.statusCode==200||response.statusCode==201){
       return response;
     }
   }catch(ex){
     throw Exception(ex);
   } 
  }
}