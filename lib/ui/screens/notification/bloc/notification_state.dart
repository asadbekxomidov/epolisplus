part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotificationInitialState extends NotificationState {}

class NotificationSuccesState extends NotificationState {}

class NotificationLoadingState extends NotificationState {}

class NotificationLoadedState extends NotificationState {}

class NotificationErrorState extends NotificationState {}
