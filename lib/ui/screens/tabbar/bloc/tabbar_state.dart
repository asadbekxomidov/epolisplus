part of 'tabbar_bloc.dart';

abstract class TabbarState extends Equatable {
  const TabbarState();

  @override
  List<Object?> get props => [];
}

class TabbarInitialState extends TabbarState {
  final int initialIndex;

  const TabbarInitialState(this.initialIndex);

  @override
  List<Object?> get props => [initialIndex];
}

class TabbarSuccesState extends TabbarState {}

class TabbarLoadingState extends TabbarState {}

class TabbarLoadedState extends TabbarState {}

class TabbarErrorState extends TabbarState {}

class HomeState2 extends TabbarState {}

class CabinetState extends TabbarState {}

class SosState extends TabbarState {}

class PolicyState extends TabbarState {}

class PartnerState extends TabbarState {}
