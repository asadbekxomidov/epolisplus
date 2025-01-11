import 'package:get/get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/screens/modul/addedcar/bloc/add_car_bloc.dart';
import 'package:epolisplus/models/profil/profil_response/carinforesponse/car_information_response.dart';

part 'warrantycode_event.dart';
part 'warrantycode_state.dart';

class WarrantycodeBloc extends Bloc<WarrantycodeEvent, WarrantycodeState>
    implements OnVehicleListener {
  OnVehicleListener? listener;
  CarInformationResponse? vehicleInformation;

  // WarrantycodeBloc() : super(WarrantycodeInitialState()) {
  WarrantycodeBloc({this.listener, this.vehicleInformation})
      : super(WarrantycodeInitialState()) {
    on<WarrantycodePushScreenEvent>(onQrCodeScreen);
  }

  void onQrCodeScreen(
      WarrantycodePushScreenEvent event, Emitter<WarrantycodeState> emit) {
    Get.to(() => QrCodeScanerScreen());
  }

  @override
  void clearData() {}

  @override
  void onVehicle(CarInformationResponse vehicle) {}

  @override
  void onWait(bool isProgressbar) {}
}

class WarrantyDefaultVehicleListener implements OnVehicleListener {
  @override
  void clearData() {}

  @override
  void onVehicle(CarInformationResponse vehicle) {}

  @override
  void onWait(bool isProgressbar) {}
}
