import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/src/logic/Search/search_repo.dart';
import 'package:weather/src/model/search_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial()){
    getData();
  }

  SearchRepo searchRepo=SearchRepo();
  getData()async{
    emit(SearchLoading());
    try{
      Response? response=await searchRepo.fetchData();
      SearchModel searchModel=searchModelFromJson(response!.data);
      emit(SearchLoaded(searchModel));
    }catch(ex){
      throw Exception(ex);
    }
  }
}
