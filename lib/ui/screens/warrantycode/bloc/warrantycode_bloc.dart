// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:epolisplus/repository/warranty_code/warranty_code_repository.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/models/activate_code/activate_waranty_code.dart';
import 'package:epolisplus/ui/screens/modul/addedcar/bloc/add_car_bloc.dart';
import 'package:epolisplus/models/profil/profil_response/carinforesponse/car_information_response.dart';

part 'warrantycode_event.dart';
part 'warrantycode_state.dart';

class WarrantycodeBloc extends Bloc<WarrantyCodeEvent, WarrantycodeState>
    implements OnVehicleListener {
  var listActivateCode = <ActivateCodeModels>[
    ActivateCodeModels(
      models: ActivateCodeResponse(
        error: -1,
        code: '',
        partnerName: '',
      ),
      controller: TextEditingController(),
    ),
  ];

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController qrCodeController = TextEditingController();
  var vehicleInformation = CarInformationResponse();
  final int maxWidgets = 4;

  WarrantycodeBloc() : super(SuccessState()) {
    on<OpenScanningQrcodeEvent>(openScaningPage);
    on<DeleteWarrantyCodeEvent>(deleteItem);
    on<AddWarrantyCodeEvent>(addItem);
    on<AddActiveteCodeEvent>(addActiveteCode);
  }

  bool get isHaveCarInformation => vehicleInformation.error == "0";

  bool isHaveQrCodeInfo(int position) {
    return listActivateCode[position].models.error == 0;
  }

  void openScaningPage(
      OpenScanningQrcodeEvent event, Emitter<WarrantycodeState> emit) async {
    var code = await Get.to(() => QrCodeScanerScreen());
    if (code != "") {
      listActivateCode[event.position].controller.text = code;
      emit(SuccessState());
      var response = checkingServerCode(
        listActivateCode[event.position].controller.text,
      );

      if (response.error == 0) {
        listActivateCode[event.position].models = response;
        emit(SuccessState());
      } else {
        emit(ErrorState(ServerFailure(message: response.partnerName)));
      }
    }
  }

  @override
  void onVehicle(CarInformationResponse vehicle) {
    emit(LoadingState());
    this.vehicleInformation = vehicle;
    emit(SuccessState());
  }

  @override
  void onWait(bool isProgressbar) {
    if (isProgressbar) {
      print('Loading...');
    } else {
      print('Finished loading...');
    }
  }

  Future<void> deleteItem(
      DeleteWarrantyCodeEvent event, Emitter<WarrantycodeState> emit) async {
    listActivateCode.removeAt(event.position);
    emit(SuccessState());
  }

  Future<void> addItem(
      AddWarrantyCodeEvent event, Emitter<WarrantycodeState> emit) async {
    listActivateCode.add(
      ActivateCodeModels(
        models: ActivateCodeResponse(
          error: -1,
          code: '',
          partnerName: '',
        ),
        controller: TextEditingController(),
      ),
    );
    emit(SuccessState());
  }

  Future<void> addActiveteCode(
      AddActiveteCodeEvent event, Emitter<WarrantycodeState> emit) async {
    emit(LoadingState());
    try {
      var qrCode = qrCodeController.text.trim();
      if (qrCode.isNotEmpty) {
        final repository = WarrantyCodeRepository();
        final response = await repository.warrantyInfo(qrCode);
        if (response.status == 200) {
          emit(SuccessState());
        } else if (response.status == 401) {
          final preferenseStorage = SharedPreferencesManager();
          await preferenseStorage.clearUserInfo();
        }
      } else {
        emit(ErrorState(QrCodemaybeerror()));
      }
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState(QrCodemaybeerror()));
    }
  }

  // ActivateCodeResponse checkingServerCode(String text) async {
  // todo bu yerda api servicedan repository orqali ma'lumotlarni olib kelinadi so'ngra qiymat qaytariladi
  checkingServerCode(String text) async {
    emit(LoadingState());

    try {
      // var qrcode = qrCodeController.text.trim();

      if (text.isNotEmpty) {
        final repository = WarrantyCodeRepository();
        final response = await repository.warrantyInfo(text);

        if (response.status == 200) {
          return ActivateCodeResponse(
            code: '12',
            error: 1,
            partnerName: '',
          );
        } else if (response.status == 401) {
          final preferense = SharedPreferencesManager();
          await preferense.clearUserInfo();
          emit(SuccessState());
        }
      } else {
        emit(ErrorState(QrCodemaybeerror()));
      }
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState(QrCodemaybeerror()));
    }

    // return ActivateCodeResponse(
    //   error: 0,
    //   code: '12345',
    //   partnerName: 'Balo battariddin',
    // );
  }
}
