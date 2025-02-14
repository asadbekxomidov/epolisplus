// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/modul/user_info/bloc/user_info_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/screens/modul/vehicle/bloc/add_car_bloc.dart';
import 'package:epolisplus/repository/warranty_code/warranty_code_repository.dart';

part 'warrantycode_event.dart';
part 'warrantycode_state.dart';

class WarrantycodeBloc extends Bloc<WarrantyCodeEvent, WarrantycodeState>
    implements OnVehicleListener, OnUserInforListener {
  var listActivateCode = <ActivateCodeModels>[
    ActivateCodeModels(
      models: ActivateCodeResponse(
        id: -1,
        code: '',
        info: '',
        status: -1,
        status_label: '',
        partners: [],
      ),
      controller: TextEditingController(),
    ),
  ];

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController amoutController = TextEditingController();
  var vehicleInformation = CarInformationResponse();
  var userInformation = UserInfoResponse();
  bool isAgreeChecked = false;
  final int maxWidgets = 4;
  String? partnerName;
  double price = 0;

  WarrantycodeBloc() : super(SuccessState()) {
    on<OpenScanningQrcodeEvent>(openScaningPage);
    on<AddActiveteCodeEvent>(addActiveteCode);
    on<DeleteWarrantyCodeEvent>(deleteItem);
    on<ToggleAgreeEventW>(toggleAgree);
    on<AddWarrantyCodeEvent>(addItem);
    on<UpdateAmount>(amoutChange);
    on<OpenGetWarrantyPageEvent>(openGetWCode);
    on<OpenOfertaPageEvent>(openOferta);
  }

  String get selectPartnerName {
    return partnerName!;
  }

  bool get isHaveCarInformation {
    return vehicleInformation.error == "0";
  }

  bool get isHaveUserInformation {
    print('USER INFORMATION ERROR ${userInformation.error}');
    return userInformation.error == "0";
  }

  bool isHaveQrCodeInfo(int position) {
    return listActivateCode[position].models.code.isNotEmpty;
  }

  isHaveActivatePartnersInfo(int position) {
    final activateCodeResponse =
        listActivateCode[position].models as ActivateCodeResponse;
    return activateCodeResponse.partners;
  }

  @override
  void onUserInfo(UserInfoResponse userInfo) {
    emit(LoadingState());
    this.userInformation = userInfo;
    emit(SuccessState());
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

  Future<void> amoutChange(
      UpdateAmount event, Emitter<WarrantycodeState> emit) async {
    var amout = amoutController.text.trim();
    amout = clearProbel(amout);
    final amount = double.tryParse(amout) ?? 0;
    price = amount * 0.01;
    emit(CalculatedState(price));
  }

  Future<void> deleteItem(
      DeleteWarrantyCodeEvent event, Emitter<WarrantycodeState> emit) async {
    emit(LoadingState());
    listActivateCode.removeAt(event.position);
    emit(SuccessState());
  }

  Future<void> addItem(
      AddWarrantyCodeEvent event, Emitter<WarrantycodeState> emit) async {
    emit(LoadingState());
    listActivateCode.add(
      ActivateCodeModels(
        models: ActivateCodeResponse(
          id: -1,
          code: '',
          info: '',
          status: -1,
          status_label: '',
          partners: [],
        ),
        controller: TextEditingController(),
      ),
    );
    emit(SuccessState());
  }

  Future<void> toggleAgree(
      ToggleAgreeEventW event, Emitter<WarrantycodeState> emit) async {
    emit(LoadingState());
    isAgreeChecked = !isAgreeChecked;
    emit(SuccessState());
  }

  Future<void> addActiveteCode(
      AddActiveteCodeEvent event, Emitter<WarrantycodeState> emit) async {
    emit(LoadingState());
    try {
      var qrCode = listActivateCode[event.position].controller.text.trim();
      if (qrCode.isNotEmpty) {
        final repository = WarrantyCodeRepository();
        var response = await repository.activateCodeInfo(qrCode);
        if (response.status == 200) {
          listActivateCode[event.position].models = response.response!;
          emit(SuccessState());
        } else if (response.status == 401) {
          final preferenseStorage = SharedPreferencesManager();
          await preferenseStorage.clearUserInfo();
        }
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
        final response = await repository.activateCodeInfo(text);

        if (response.status == 200) {
          return ActivateCodeResponse(
            code: '',
            id: 1,
            info: '',
            partners: [],
            status: 2,
            status_label: '',
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
  }

  Future<void> openGetWCode(
      OpenGetWarrantyPageEvent event, Emitter<WarrantycodeState> emit) async {
    emit(LoadingState());
    Get.to(() => GetWCodeScreen(warrantyId: event.id));
    emit(SuccessState());
  }

  Future<void> openOferta(
      OpenOfertaPageEvent event, Emitter<WarrantycodeState> emit) async {
    Get.to(() => PartnersOferta());
    emit(SuccessState());
  }
}
