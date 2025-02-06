import 'dart:async';

import 'package:get/get.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/log/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/repository/auth/auth_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SharedPreferencesManager _prefsManager = SharedPreferencesManager();

  HomeBloc() : super(HomeInitialState()) {
    on<LogoutEvent>(_handleLogout);
    on<DeleteAccountEvent>(deleteAccount);
    on<PushScreensEvent>(pushSettings);
    on<PushWarrantyEvent>(pushWarranty);
    on<OpenCaskoEvent>(openCasko);
    on<OpenOsagoEvent>(openOsago);
    on<OpenTravelEvent>(openTravel);
    on<OpenAddServisePEvent>(openaddServise);
  }

  Future<void> _handleLogout(LogoutEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    try {
      await _prefsManager.clearToken();
      Get.offAll(() => CheckAuthScreen());
      emit(LogoutSuccessState());
    } catch (e) {
      emit(HomeErrorState('Logout failed: $e'));
    }
  }

  Future<void> deleteAccount(
      DeleteAccountEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    String? token = await _prefsManager.getToken();
    String? phone = await _prefsManager.getPhone();

    if (token == null || phone == null) {
      emit(HomeErrorState(""));
      return;
    }

    final baseResponse = await AuthRepository().deleteAccount(
      phone,
      token,
    );

    if (baseResponse.status == 200) {
      await _prefsManager.clearToken();
      await _prefsManager.clearPhone();

      Get.off(() => CheckAuthScreen());
      emit(HomeSuccessState());
    } else {
      logger(baseResponse.message.toString());
      emit(HomeErrorState(""));
    }
  }

  Future<void> pushSettings(
      PushScreensEvent event, Emitter<HomeState> emit) async {
    // emit(HomeLoadingState());
    Get.to(() => SettingsScreen());
    emit(HomeSuccessState());
  }

  Future<void> pushWarranty(
      PushWarrantyEvent event, Emitter<HomeState> emit) async {
    // emit(HomeLoadingState());
    await Get.to(() => SelectwarrantyCodes());
    // await Get.to(() => WarrantycodeScreen());
    emit(HomeSuccessState());
  }

  Future<void> openCasko(OpenCaskoEvent event, Emitter<HomeState> emit) async {
    // emit(HomeLoadingState());
    await Get.to(() => CaskoScreen());
    emit(HomeSuccessState());
  }

  Future<void> openOsago(OpenOsagoEvent event, Emitter<HomeState> emit) async {
    // emit(HomeLoadingState());
    await Get.to(() => OsagoScreen());
    emit(HomeSuccessState());
  }

  Future<void> openTravel(
      OpenTravelEvent event, Emitter<HomeState> emit) async {
    // emit(HomeLoadingState());
    await Get.to(() => TravelScreen());
    emit(HomeSuccessState());
  }

  Future<void> openaddServise(
      OpenAddServisePEvent event, Emitter<HomeState> emit) async {
    // emit(HomeLoadingState());
    await Get.to(() => AddServiseScreen());
    emit(HomeSuccessState());
  }
}
