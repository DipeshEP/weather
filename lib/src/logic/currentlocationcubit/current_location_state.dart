part of 'current_location_cubit.dart';

abstract class CurrentLocationState extends Equatable {
  const CurrentLocationState();
}

class CurrentLocationInitial extends CurrentLocationState {
  @override
  List<Object> get props => [];
}

class CurrentLocationLoading extends CurrentLocationState {

  @override
  List<Object> get props => [];
}

class CurrentLocationLoaded extends CurrentLocationState {
  final Current CurrentTemperatures ;
  final Location location;
  const CurrentLocationLoaded(this.CurrentTemperatures,this.location);
  @override
  List<Object> get props => [CurrentTemperatures,location];
}

class CurrentLocationError extends CurrentLocationState {
  @override
  List<Object> get props => [];
}
