part of 'home_bloc.dart';


abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LogoutEvent extends HomeEvent {} // Event for logout
