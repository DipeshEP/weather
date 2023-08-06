import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/src/logic/astronomy_cubit/astromony_repo.dart';
import 'package:weather/src/model/Astronomy.dart';

part 'astronomy_state.dart';

class AstronomyCubit extends Cubit<AstronomyState> {
  AstronomyCubit() : super(AstronomyInitial()){
  getData();
  }
  AstronomyRepo astronomyRepo=AstronomyRepo();
   getData()async{
    emit(AstronomyLoading());
    try{
      Response? response=await astronomyRepo.fetchDetails();
      if(response!.statusCode==200||response.statusCode==201){
        final data=json.encode(response.data);
        Astronomy astronomy=astronomyFromJson(data);
        emit(AstronomyLoaded(astronomy));
      }
    }catch(ex){
      throw Exception(ex);
    }
   }
}
