part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}
class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}
  class SearchLoaded extends SearchState {
  final SearchModel searchModel;
  const SearchLoaded(this.searchModel);
  @override
  List<Object> get props => [searchModel];
}
class SearchError extends SearchState {
  @override
  List<Object> get props => [];
}