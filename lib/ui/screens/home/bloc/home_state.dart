part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class LogoutSuccessState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}


class HomeSerCategoryChangedState extends HomeState {
  final int categoryId;
  HomeSerCategoryChangedState(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}
