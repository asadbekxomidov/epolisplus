// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/modul/addedcar/bloc/add_car_bloc.dart';
import 'package:epolisplus/models/profil/profil_response/carinforesponse/car_information_response.dart';

part 'warrantycode_event.dart';
part 'warrantycode_state.dart';

class WarrantycodeBloc extends Bloc<WarrantycodeEvent, WarrantycodeState>
    implements OnVehicleListener {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController qrCodeController = TextEditingController();
  var vehicleInformation = CarInformationResponse();
  String? data;
  List<WarrantyAddQrCodeWidget> warrantyWidgets = [];
  final int maxWidgets = 4;

  WarrantycodeBloc({this.data}) : super(WarrantycodeInitialState()) {
    warrantyWidgets.add(WarrantyAddQrCodeWidget(
      bloc: this,
    ));
    if (data != null) {
      qrCodeController.text = data!;
    }
    on<WarrantycodePushScreenEvent>(_qrCodeScreenNavigate);
    on<WarrantycodeQrCodeClearEvent>(_qrCodeClear);
    on<WarrantycodeAddRowEvent>(_onAddRow);
  }

  bool get isHaveCarInfor {
    print("Checking if vehicle info exists: ${vehicleInformation.error}");
    return vehicleInformation.error == "0";
  }

  // bool get isHaveQrCodeInfo {
  //   print("Checking if Qr Code info exists: ${data}");
  //   return data != null;
  // }

  bool get isHaveQrCodeInfo {
    return qrCodeController.text.isNotEmpty;
  }

  bool get isHaveCarInformation {
    return vehicleInformation.error == "0";
  }

  void _qrCodeScreenNavigate(
      WarrantycodePushScreenEvent event, Emitter<WarrantycodeState> emit) {
    qrCodeController.text = event.scannedData ?? '';
    print('QR Data: ${data}');
    print('QR Controller: ${qrCodeController.text}');
    print('Phone Controller: ${phoneNumberController.text}');
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

  Future<void> _qrCodeClear(WarrantycodeQrCodeClearEvent event,
      Emitter<WarrantycodeState> emit) async {
    emit(WarrantycodeLoadingState());
    qrCodeController.text = '';
    data = null;
    emit(WarrantycodeSuccesState());
  }

  Future<void> _onAddRow(
      WarrantycodeAddRowEvent event, Emitter<WarrantycodeState> emit) async {
    // Agar 4 tagacha widget bo'lsa, yangi widget qo'shishga ruxsat beriladi
    if (warrantyWidgets.length < maxWidgets) {
      warrantyWidgets.add(
        WarrantyAddQrCodeWidget(
          bloc: this,
        ),
      );
    }
    emit(WarrantycodeUpdatedState(warrantyWidgets));
  }
}
