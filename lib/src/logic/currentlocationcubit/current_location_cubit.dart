import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/src/logic/currentlocationcubit/current_location_repository.dart';
import 'package:weather/src/model/current_temp_model.dart';

part 'current_location_state.dart';

class CurrentLocationCubit extends Cubit<CurrentLocationState> {
  CurrentLocationCubit() : super(CurrentLocationInitial()){
    getData();
  }
  
  CurrentLocationRepository currentLocationRepository=CurrentLocationRepository();
  
  getData()async{
    emit(CurrentLocationLoading());
    try{
      Response? response=await currentLocationRepository.fetchDetails();
      if(response!.statusCode==200||response.statusCode==201){
        // var data=json.decode(response.data);
        // print(data.runtimeType);
        CurrentTemperatures currentTemperatures=CurrentTemperatures.fromJson(response.data);

        print(currentTemperatures.current.humidity);
        Current current=currentTemperatures.current ;

        print(current.humidity);
        Location location=currentTemperatures.location;
        print(current);
        emit(CurrentLocationLoaded(current,location));
      }

    }catch(ex){
      print(ex);
      emit(CurrentLocationError());
    }
  }
}
