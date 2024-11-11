part of 'partners_bloc.dart';

abstract class PartnersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PartnersInitialState extends PartnersState {}

class PartnersSuccesState extends PartnersState {}

class PartnersLoadingState extends PartnersState {}

class PartnersLoadedState extends PartnersState {}

class PartnersErrorState extends PartnersState {}
