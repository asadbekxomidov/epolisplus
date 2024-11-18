part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LogoutEvent extends SettingsEvent {}

class SettingsPushScreenEvent extends SettingsEvent {}

class SettingsQuestionscreenEvent extends SettingsEvent {}

class SettingsDilogEvent extends SettingsEvent {
  final BuildContext context;

  SettingsDilogEvent(this.context);
}

class SettingsHelpDeskDilogEvent extends SettingsEvent {
  final BuildContext context;

  SettingsHelpDeskDilogEvent(this.context);
}
