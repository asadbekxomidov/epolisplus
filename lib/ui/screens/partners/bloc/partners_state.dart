part of 'partners_bloc.dart';

abstract class PartnersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PartnersInitialState extends PartnersState {}

class PartnersLoadingState extends PartnersState {}

class PartnersLoadedState extends PartnersState {
  final List<PartnersResponse> partners;

  PartnersLoadedState({required this.partners});

  @override
  List<Object?> get props => [partners];
}

class PartnersErrorState extends PartnersState {
  final Failure failure;

  PartnersErrorState(this.failure);

  @override
  List<Object?> get props => [failure];
}
