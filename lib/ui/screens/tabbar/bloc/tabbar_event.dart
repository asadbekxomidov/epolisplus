part of 'tabbar_bloc.dart';

abstract class TabbarEvent extends Equatable {
  const TabbarEvent();

  @override
  List<Object?> get props => [];
}

class TabSelectedEvent extends TabbarEvent {
  final int index;

  const TabSelectedEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class TabScreenPushEvent extends TabbarEvent {
  final int index;

  const TabScreenPushEvent(this.index);

  @override
  List<Object?> get props => [index];
}

/*class HomeScreenPushEvent extends TabbarEvent {}

class KabinetScreenPushEvent extends TabbarEvent {}

class SosScreenPushEvent extends TabbarEvent {}

class PoliciesScreenPushEvent extends TabbarEvent {}

class PartnersScreenPushEvent extends TabbarEvent {}*/
