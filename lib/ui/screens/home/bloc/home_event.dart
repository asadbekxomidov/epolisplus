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

class PushWarrantyEvent extends HomeEvent {}

class OpenCaskoEvent extends HomeEvent {}

class OpenOsagoEvent extends HomeEvent {}

class OpenTravelEvent extends HomeEvent {}

class OpenAddServisePEvent extends HomeEvent {}

class OpenNotificationEvent extends HomeEvent {}

class SelectPolicyCategoryEvent extends HomeEvent {
  int categoryId;

  SelectPolicyCategoryEvent(this.categoryId);
}
