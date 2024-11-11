part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingsInitaialState extends SettingsState {}

class SettingsLoadingState extends SettingsState {}

class SettingsLoadedState extends SettingsState {}

class SettingsErrorState extends SettingsState {
  final String errorMessage;

  SettingsErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class NavigateToNotificationScreen extends SettingsState {}

class SettingsSuccesState extends SettingsState {}

class LogoutSuccessState extends SettingsState {}
