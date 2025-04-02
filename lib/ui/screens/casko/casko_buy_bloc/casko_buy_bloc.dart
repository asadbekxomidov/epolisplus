// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:epolisplus/ui/screens/oferta/screen/oferta_screen.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/modul/vehicle/bloc/add_car_bloc.dart';
import 'package:epolisplus/ui/screens/modul/user_info/bloc/user_info_bloc.dart';
import 'package:get/get.dart';

part 'casko_buy_event.dart';
part 'casko_buy_state.dart';

class CaskoBuyBloc extends Bloc<CaskoBuyEvent, CaskoBuyState>
    implements OnVehicleListener, OnUserInforListener {
  bool checkinsurance = false;
  late int currentindex;
  late int index = IConstanta.STEP_VEHICLE;
  // late int index = IConstanta.STEP_DRIVER;
  // late int index = IConstanta.STEP_CONTACT;
  // late int index = IConstanta.STEP_PAYMENT;
  late SharedPreferencesManager localStorage;
  var userInformation = UserInfoResponse();
  var vehicleInformation = CarInformationResponse();
  TextEditingController phoneController = TextEditingController();
  CaskoBuyBloc() : super(SuccesState()) {
    on<NextStep2Event>(nextStep2);
    on<NextStep3Event>(nextStep3);
    on<NextStep4Event>(nextStep4);
    on<BackStep1Event>(backStep1);
    on<BackStep2Event>(backStep2);
    on<BackStep3Event>(backStep3);
    on<BackStep4Event>(backStep4);
    on<GetPhoneNumberEvent>(_loadPhoneNumber);
    _initPhoneNumber();
    on<IsCheckInsuranceEvent>(isChechIns);
    on<OpenOfertaPageEvent>(openOferta);
  }

  @override
  void onUserInfo(UserInfoResponse userInfo) {
    emit(LoadingState());
    this.userInformation = userInfo;
    emit(SuccesState());
  }

  @override
  void onVehicle(CarInformationResponse vehicle) {
    emit(LoadingState());
    loggerF(vehicle.toString(), error: 'logger');
    this.vehicleInformation = vehicle;
    emit(SuccesState());
  }

  @override
  void onWait(bool isProgressbar) {
    if (isProgressbar) {
      print('Loading...');
    } else {
      print('Finished loading...');
    }
  }

  Future<void> _initPhoneNumber() async {
    localStorage = SharedPreferencesManager();
    String? savedPhone = await localStorage.getPhone();
    if (savedPhone != null) {
      phoneController.text = formatPhoneNumber(savedPhone);
    }
    add(GetPhoneNumberEvent());
  }

  void _loadPhoneNumber(
      GetPhoneNumberEvent event, Emitter<CaskoBuyState> emit) {
    emit(SuccesState());
  }

  bool get isHaveUserInfo {
    print('USER INFORMATION ERROR ${userInformation.error}');
    return userInformation.error == "0" && phoneController.text.trim() != '';
  }

  bool get isHaveCarInformation {
    print('VEHICLE INFORMATION ERROR ${vehicleInformation.error}');
    return vehicleInformation.error == "0";
  }

  Future<void> nextStep2(
      NextStep2Event event, Emitter<CaskoBuyState> emit) async {
    emit(LoadingState());
    index = IConstanta.STEP_DRIVER;
    emit(SuccesState());
  }

  Future<void> nextStep3(
      NextStep3Event event, Emitter<CaskoBuyState> emit) async {
    emit(LoadingState());
    index = IConstanta.STEP_CONTACT;
    emit(SuccesState());
  }

  Future<void> nextStep4(
      NextStep4Event event, Emitter<CaskoBuyState> emit) async {
    emit(LoadingState());
    index = IConstanta.STEP_PAYMENT;
    emit(SuccesState());
  }

  Future<void> backStep1(
      BackStep1Event event, Emitter<CaskoBuyState> emit) async {
    emit(LoadingState());
    index = IConstanta.STEP_VEHICLE;
    emit(SuccesState());
  }

  Future<void> backStep2(
      BackStep2Event event, Emitter<CaskoBuyState> emit) async {
    emit(LoadingState());
    index = IConstanta.STEP_DRIVER;
    emit(SuccesState());
  }

  Future<void> backStep3(
      BackStep3Event event, Emitter<CaskoBuyState> emit) async {
    emit(LoadingState());
    index = IConstanta.STEP_CONTACT;
    emit(SuccesState());
  }

  Future<void> backStep4(
      BackStep4Event event, Emitter<CaskoBuyState> emit) async {
    emit(LoadingState());
    index = IConstanta.STEP_PAYMENT;
    emit(SuccesState());
  }

  Future<void> isChechIns(
      IsCheckInsuranceEvent event, Emitter<CaskoBuyState> emit) async {
    emit(LoadingState());
    checkinsurance = !checkinsurance;
    emit(SuccesState());
  }

  Future<void> openOferta(
      OpenOfertaPageEvent event, Emitter<CaskoBuyState> emit) async {
    Get.to(() => OfertaScreen());
    emit(SuccesState());
  }
}

formatPhoneNumber(String phone) {
  phone = phone.replaceAll(RegExp(r'\D'), ''); // Faqat raqamlarni qoldiramiz
  if (phone.length == 9) {
    return "(${phone.substring(0, 2)}) ${phone.substring(2, 5)}-${phone.substring(5, 7)}-${phone.substring(7)}";
  }
  return phone; // Agar uzunlik noto‘g‘ri bo‘lsa, o‘zgartirmasdan qaytaramiz
}
