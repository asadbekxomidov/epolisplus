import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPreferencesManager _prefsManager = SharedPreferencesManager();

  SettingsBloc() : super(SettingsInitaialState()) {
    on<LogoutEvent>(logout);
    on<SettingsPushScreenEvent>(onPushScreen);
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

  // void pushScreen(SettingsPushScreenEvent event, Emitter<SettingsState> emit) {
  //   emit(SettingsLoadingState());
  //   Get.offAll(() => NotificationScreen());
  //   emit(SettingsSuccesState());
  // }
  void onPushScreen(
      SettingsPushScreenEvent event, Emitter<SettingsState> emit) {
    emit(SettingsLoadingState());
    // Navigate to NotificationScreen
    Get.offAll(() => NotificationScreen());
    emit(SettingsSuccesState());
  }
}
