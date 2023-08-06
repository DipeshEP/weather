part of 'astronomy_cubit.dart';

abstract class AstronomyState extends Equatable {
  const AstronomyState();
}

class AstronomyInitial extends AstronomyState {

  @override
  List<Object> get props => [];
}

class AstronomyLoading extends AstronomyState {
  @override
  List<Object> get props => [];
}

class AstronomyLoaded extends AstronomyState {
  final Astronomy astronomy;
  const AstronomyLoaded(this.astronomy);

  @override
  List<Object> get props => [astronomy];
}

class AstronomyError extends AstronomyState {
  @override
  List<Object> get props => [];
}
