import 'dart:async';

import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/repository/profil/profil_repository.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/sharedPreferencesManager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'kabinet_event.dart';
part 'kabinet_state.dart';

class KabinetBloc extends Bloc<KabinetEvent, KabinetState> {
  KabinetBloc() : super(KabinetInitialState()) {
    on<KabinetGetEvent>(userGetInformation);
    on<KabinetPushScreenEvent>(editpushScreen);
    on<AddMyCarEvent>(addCar);
  }

  Future<void> userGetInformation(
      KabinetGetEvent event, Emitter<KabinetState> emit) async {
    await getData();
  }

  Future<void> editpushScreen(
    KabinetPushScreenEvent event,
    Emitter<KabinetState> emit,
  ) async {
    await Get.to(() => EditProfilScreen(event.userName));
    await getData();
  }

  getData() async {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(KabinetLoadingState());

    try {
      final profilRepository = ProfilRepository();
      final response = await profilRepository.getProfile();

      if (response.status == 200 && response.response != null) {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(KabinetInformationGetState(profilResponse: response.response!));
      } else if (response.status == 401) {
        final prefsManager = SharedPreferencesManager();
        await prefsManager.clearPassword();
        await prefsManager.clearPhone();
        await prefsManager.clearToken();
        Get.offAll(() => CheckAuthScreen());
      } else {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(KabinetErrorState(message: response.message ?? "Unknown error"));
      }
    } catch (e) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(KabinetErrorState(message: e.toString()));
    }
  }

  FutureOr<void> addCar(AddMyCarEvent event, Emitter<KabinetState> emit) async {
    await Get.to(() => AddCarScreen());
    await getData();
  }
}
