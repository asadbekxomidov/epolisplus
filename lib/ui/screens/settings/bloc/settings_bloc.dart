import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPreferencesManager _prefsManager = SharedPreferencesManager();

  SettingsBloc() : super(SettingsInitaialState()) {
    on<LogoutEvent>(logout);
    on<SettingsPushScreenEvent>(onPushScreen);
    on<SettingsQuestionscreenEvent>(onPushQuestion);
    on<SettingsDilogEvent>(onSelectLanguageShowDilog);
    on<SettingsHelpDeskDilogEvent>(onSelectShowDilog);
  }

  Future<void> logout(LogoutEvent event, Emitter<SettingsState> emit) async {
    emit(SettingsLoadingState());

    try {
      await _prefsManager.clearToken();
      Get.offAll(() => CheckAuthScreen());
      emit(LogoutSuccessState());
    } catch (e) {
      emit(SettingsErrorState('Logout failed: $e'));
    }
  }

  void onPushScreen(
      SettingsPushScreenEvent event, Emitter<SettingsState> emit) {
    emit(SettingsLoadingState());
    Get.to(() => const NotificationScreen());
    emit(SettingsSuccesState());
  }

  void onPushQuestion(
      SettingsQuestionscreenEvent event, Emitter<SettingsState> emit) {
    emit(SettingsLoadingState());
    Get.to(() => const QuestionsScreen());
    emit(SettingsSuccesState());
  }

  void onSelectLanguageShowDilog(
      SettingsDilogEvent event, Emitter<SettingsState> emit) async {
    emit(SettingsLoadingState());

    final selectedLanguage = await showDialog<String>(
      context: event.context,
      builder: (BuildContext context) {
        return LanguageSelectionDialog();
      },
    );

    if (selectedLanguage != null) {
      emit(SettingsSuccesState());
    } else {
      emit(SettingsErrorState('No language selected'));
    }
  }

  void onSelectShowDilog(
      SettingsHelpDeskDilogEvent event, Emitter<SettingsState> emit) async {
    emit(SettingsLoadingState());

    final selectedLanguage = await showDialog<String>(
      context: event.context,
      builder: (BuildContext context) {
        return HelpdeskSelectDialog();
      },
    );

    if (selectedLanguage != null) {
      emit(SettingsSuccesState());
    } else {
      emit(SettingsErrorState(''));
    }
  }
}
