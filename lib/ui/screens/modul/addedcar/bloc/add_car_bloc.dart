import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/repository/profil/profil_repository.dart';

part 'add_car_event.dart';
part 'add_car_state.dart';

class AddedCarBloc extends Bloc<AddedCarEvent, AddedCarState> {
  CarInformationResponse vehicleInformation;
  OnVehicleListener listener;

  String get getVehicleOwnerName {
    return "${vehicleInformation.orgName}";
  }

  bool get isHaveCarInformation {
    return vehicleInformation.error == "0";
  }

  String get getVehicleOwnerCarNumber {
    return "${vehicleInformation.issueYear}";
  }

  String get getVehicleOwnerCarModelName {
    return "${vehicleInformation.modelName}";
  }

  var gowNumberController = TextEditingController();
  var techSeriaController = TextEditingController();
  var techNumberController = TextEditingController();

  AddedCarBloc({
    required this.listener,
    required this.vehicleInformation,
  }) : super(CarInitialState()) {
    on<GetInfromationCarEvent>(onmyCarInformation);
    on<RegisterCertificateNumberEvent>(onpushScreen);
    on<ClearVehicleEvent>(clearVehicle);
  }

  Future<void> onmyCarInformation(
      GetInfromationCarEvent event, Emitter<AddedCarState> emit) async {
    emit(CarLoadingState());

    var carNumber = gowNumberController.text.trim();
    var teachPassportSeria = techSeriaController.text.trim();
    var teachPassportNumber = techNumberController.text.trim();
    carNumber = clearCarNumber(carNumber);

    try {
      final ProfilRepository repository = ProfilRepository();
      if (carNumber.isNotEmpty &&
          teachPassportSeria.isNotEmpty &&
          teachPassportNumber.isNotEmpty) {
        listener.onWait(true);

        var response = await repository.getCarInformation(
          teachPassportSeria,
          teachPassportNumber,
          carNumber,
        );
        listener.onWait(false);

        if (response.status == 200 && response.response != null) {
          vehicleInformation = response.response!;
          listener.onVehicle(vehicleInformation);
          emit(CarInformationGetState());
        } else if (response.status == 401) {
          final preferense = SharedPreferencesManager();
          preferense.clearUserInfo();
        }
      } else {
        emit(CarErrorState(''));
      }
    } catch (e) {
      emit(CarErrorState(e.toString()));
    }
  }

  Future<void> onpushScreen(
      RegisterCertificateNumberEvent event, Emitter<AddedCarState> emit) async {
    Get.to(() => RegisterCertnumberScreen());
  }

  FutureOr<void> clearVehicle(
      ClearVehicleEvent event, Emitter<AddedCarState> emit) {
    listener.clearData();
    vehicleInformation = CarInformationResponse();
    gowNumberController.text = "";
    techSeriaController.text = "";
    techNumberController.text = "";
    emit(CarSuccesState());
  }
}

abstract class OnVehicleListener {
  void onVehicle(CarInformationResponse vehicle);
  void onWait(bool isProgressbar) {
    return progressBar3();
  }

  void clearData();
}
