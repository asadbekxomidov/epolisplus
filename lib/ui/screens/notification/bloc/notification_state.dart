part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SuccesState extends NotificationState {}

class LoadingState extends NotificationState {}

class LoadedState extends NotificationState {}

class ErrorState extends NotificationState {
  Failure failure;

  ErrorState({required this.failure});
}
