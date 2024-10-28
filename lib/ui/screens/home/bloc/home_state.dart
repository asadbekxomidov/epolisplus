part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {} // Initial state

class HomeLoadingState extends HomeState {} // Loading state

class LogoutSuccessState extends HomeState {} // Logout success state

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
