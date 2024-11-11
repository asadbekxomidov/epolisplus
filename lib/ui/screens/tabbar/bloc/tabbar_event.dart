part of 'tabbar_bloc.dart';

abstract class TabbarEvent extends Equatable {
  const TabbarEvent();

  @override
  List<Object?> get props => [];
}

class TabSelected extends TabbarEvent {
  final int index;

  const TabSelected(this.index);

  @override
  List<Object?> get props => [index];
}
