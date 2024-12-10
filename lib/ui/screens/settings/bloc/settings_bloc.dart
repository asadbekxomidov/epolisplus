import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPreferencesManager _prefsManager = SharedPreferencesManager();

  SettingsBloc() : super(SettingsInitaialState()) {
    on<LogoutEvent>(logout);
    on<SettingsPushScreenEvent>(onPushScreen);
    on<SettingsQuestionscreenEvent>(onPushQuestion);
    on<SettingsDilogEvent>(onSelectLanguageShowDilog);
    on<SettingsHelpDeskDilogEvent>(onSelectShowDialog);
    on<SettingsAboutAppEvent>(onPushAboutAppScreen);
    // on<SettingsPushPhoneEvent>(onpushPhone);
    // on<SettingsPushTelegramEvent>(onpushtelegramBot);
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

  void onPushAboutAppScreen(
      SettingsAboutAppEvent event, Emitter<SettingsState> emit) {
    emit(SettingsLoadingState());
    Get.to(() => const AboutAppScreen());
    emit(SettingsSuccesState());
  }

  Future<void> onPushQuestion(
      SettingsQuestionscreenEvent event, Emitter<SettingsState> emit) async {
    emit(SettingsLoadingState());
    await Future.delayed(Duration(milliseconds: 500));
    Get.to(() => QuestionsScreen());
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

  Future<void> onSelectShowDialog(
      SettingsHelpDeskDilogEvent event, Emitter<SettingsState> emit) async {
    emit(SettingsLoadingState());
    try {
      const String phone = '+998558081515'; // Telefon raqam
      const String url = 'https://t.me/epolisplus_bot'; // Telegram bot URL

      // Telefon raqamiga o'tish
      final Uri phoneUri = Uri.parse('tel:$phone');
      bool phoneLaunched = await launchUrl(phoneUri);
      if (!phoneLaunched) {
        emit(SettingsErrorState('Telefon raqamga o\'ta olmadi.'));
        return;
      }

      // Telegram botga o'tish
      final Uri telegramUri = Uri.parse(url);
      bool telegramLaunched = await launchUrl(telegramUri);
      if (!telegramLaunched) {
        emit(SettingsErrorState('Telegram botga o\'ta olmadi.'));
        return;
      }
    } catch (e) {
      emit(SettingsErrorState('Xatolik yuz berdi: $e'));
      return;
    }

    final selectedOption = await showDialog<String>(
      context: event.context,
      builder: (BuildContext context) {
        return HelpdeskSelectDialog(
          onPhoneClick: () async {
            final Uri phoneUri = Uri.parse('tel:+998558081515');
            await launchUrl(phoneUri);
          },
          onTelegramClick: () async {
            final Uri telegramUri = Uri.parse('https://t.me/epolisplus_bot');
            await launchUrl(telegramUri);
          },
        );
      },
    );

    if (selectedOption != null) {
      emit(SettingsSuccesState());
    } else {
      emit(SettingsErrorState('Hech narsa tanlanmadi.'));
    }
  }
}
