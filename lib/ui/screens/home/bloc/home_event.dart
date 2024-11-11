part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LogoutEvent extends HomeEvent {}

class DeleteAccountEvent extends HomeEvent {
  DeleteAccountEvent();

  @override
  List<Object?> get props => [];
}

class PushScreensEvent extends HomeEvent {}
