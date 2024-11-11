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

class TabbarSelectionUpdated extends TabbarState {
  final int selectedIndex;

  const TabbarSelectionUpdated(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}
