part of 'oferta_bloc.dart';

abstract class OfertaState extends Equatable {
  const OfertaState();

  @override
  List<Object> get props => [];
}

class OfertaInitialState extends OfertaState {
  final String response;

  const OfertaInitialState(this.response);

  @override
  List<Object> get props => [response];
}

class OfertaLoadingState extends OfertaState {}

class OfertaLoadedState extends OfertaState {
  final String response;

  const OfertaLoadedState(this.response);

  @override
  List<Object> get props => [response];
}

class OfertaErrorState extends OfertaState {
  Failure failure;

  OfertaErrorState(this.failure);
}
