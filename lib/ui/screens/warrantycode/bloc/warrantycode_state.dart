part of 'warrantycode_bloc.dart';

abstract class WarrantycodeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WarrantycodeInitialState extends WarrantycodeState {}

class WarrantycodeLoadingState extends WarrantycodeState {}

class WarrantycodeLoadedState extends WarrantycodeState {}

class WarrantycodeErrorState extends WarrantycodeState {
  Failure failure;

  WarrantycodeErrorState(this.failure);
}

class WarrantycodeSuccesState extends WarrantycodeState {}

class WarrantycodeNewWidgetState extends WarrantycodeState {
  final List<Widget> widgets;

  WarrantycodeNewWidgetState(this.widgets);
}

class WarrantycodeAddNewWidgetEvent extends WarrantycodeEvent {}

class WarrantycodeUpdatedState extends WarrantycodeState {
  final List<WarrantyAddQrCodeWidget> warrantyWidgets;

  WarrantycodeUpdatedState(this.warrantyWidgets);

  @override
  List<Object?> get props => [warrantyWidgets];
}
