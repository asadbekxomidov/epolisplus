part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AllNotificationEvent extends NotificationEvent {
  // final int id;

  // AllNotificationEvent(this.id);
}

class GetNotificationEvent extends NotificationEvent {}
