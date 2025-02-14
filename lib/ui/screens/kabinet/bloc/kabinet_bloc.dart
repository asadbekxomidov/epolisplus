// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'dart:async';
import 'package:get/get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/repository/profil/profil_repository.dart';

part 'kabinet_event.dart';
part 'kabinet_state.dart';

class KabinetBloc extends Bloc<KabinetEvent, KabinetState> {
  ProfilResponse profilResponse = ProfilResponse(
    phone: '',
    carInfo: [],
    fullName: '',
  );

  String get isHaveUserName {
    return profilResponse.fullName;
  }

  String get isHaveUserPhoneNumber {
    return profilResponse.phone;
  }

  KabinetBloc() : super(KabinetInitialState()) {
    on<KabinetGetEvent>(userGetInformation);
    on<KabinetPushScreenEvent>(editpushScreen);
    on<AddMyCarEvent>(addCar);
    on<MyCarDeleteEvent>(deleteCar);
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

  FutureOr<void> addCar(AddMyCarEvent event, Emitter<KabinetState> emit) async {
    await Get.to(() => AddCarScreen());
    await getData();
  }

  FutureOr<void> deleteCar(
      MyCarDeleteEvent event, Emitter<KabinetState> emit) async {
    emit(KabinetLoadingState());
    try {
      final profilRepository = ProfilRepository();
      final response = await profilRepository.deleteCar(event.carNumber);

      if (response.status == 200) {
        await getData();
      } else if (response.status == 401) {
        final prefsManager = SharedPreferencesManager();
        await prefsManager.clearUserInfo();
        Get.offAll(() => CheckAuthScreen());
      } else {
        emit(KabinetErrorState(UserInfoNotFound()));
      }
    } catch (e) {
      emit(KabinetErrorState(UserInfoNotFound()));
    }

    await getData();
  }

  getData() async {
    emit(KabinetLoadingState());

    try {
      final profilRepository = ProfilRepository();
      final response = await profilRepository.getProfile();

      if (response.status == 200 && response.response != null) {
        emit(KabinetInformationGetState(profilResponse: response.response!));
        profilResponse = response.response!;
        print('${profilResponse.fullName} GETDATA GETDATA GETDATA');
        // emit(KabinetSuccesState());
      } else if (response.status == 401) {
        final prefsManager = SharedPreferencesManager();
        await prefsManager.clearUserInfo();
        Get.offAll(() => CheckAuthScreen());
      } else {
        emit(KabinetErrorState(UserInfoNotFound()));
      }
    } catch (e) {
      emit(KabinetErrorState(UserInfoNotFound()));
    }
  }
}
