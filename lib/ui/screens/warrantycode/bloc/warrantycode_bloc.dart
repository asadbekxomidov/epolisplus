// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/screens/modul/addedcar/bloc/add_car_bloc.dart';
import 'package:epolisplus/models/profil/profil_response/carinforesponse/car_information_response.dart';

part 'warrantycode_event.dart';
part 'warrantycode_state.dart';

class WarrantycodeBloc extends Bloc<WarrantycodeEvent, WarrantycodeState>
    implements OnVehicleListener {
  TextEditingController phoneNumberController = TextEditingController();
  var vehicleInformation = CarInformationResponse();

  WarrantycodeBloc() : super(WarrantycodeInitialState()) {
    on<WarrantycodePushScreenEvent>(qrCodeScreenNavigate);
  }

  bool get isHaveCarInfor {
    print("Checking if vehicle info exists: ${vehicleInformation.error}");
    return vehicleInformation.error == "0";
  }

  bool get isHaveCarInformation {
    return vehicleInformation.error == "0";
  }

  void qrCodeScreenNavigate(
      WarrantycodePushScreenEvent event, Emitter<WarrantycodeState> emit) {
    Get.to(() => QrCodeScanerScreen());
  }

  @override
  void onVehicle(CarInformationResponse vehicle) {
    emit(WarrantycodeLoadingState());
    this.vehicleInformation = vehicle;
    print("Updated vehicle info: ${vehicle.orgName}");
    print("Updated error: ${vehicle.error}");
    emit(WarrantycodeSuccesState());
  }

  @override
  void onWait(bool isProgressbar) {
    if (isProgressbar) {
      print('Loading...');
    } else {
      print('Finished loading...');
    }
  }
}
