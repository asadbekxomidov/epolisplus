// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/travel/widget/travel_widget.dart';
import 'package:epolisplus/ui/screens/modul/vehicle/bloc/add_car_bloc.dart';
import 'package:epolisplus/repository/servises/osago/osago_repository.dart';
import 'package:epolisplus/ui/screens/modul/user_info/bloc/user_info_bloc.dart';

part 'osago_event.dart';
part 'osago_state.dart';

class OsagoBloc extends Bloc<OsagoEvent, OsagoState> {
  late int currentindex;
  late int index = IConstanta.STEP_VEHICLE;
  // late int index = IConstanta.STEP_DRIVER;
  // late int index = IConstanta.STEP_CONTACT;
  // late int index = IConstanta.STEP_PAYMENT;

  OsagoBloc() : super(SuccessState()) {
    on<SelectButtonEvent>(selectBtn);
    on<OsagoInfoGetEvent>(getOsago);
  }

  Future<void> selectBtn(
      SelectButtonEvent event, Emitter<OsagoState> emit) async {
    emit(LoadingState());
    index = currentindex;
    emit(SuccessState());
  }

  Future<void> getOsago(
      OsagoInfoGetEvent event, Emitter<OsagoState> emit) async {
    emit(LoadingState());

    try {
      final repository = OsagoRepository();
      var response = await repository.getOsago();

      if (response.status == 200) {
        emit(SuccessState());
      } else if (response.status == 401) {
        final lStorage = SharedPreferencesManager();
        await lStorage.clearUserInfo();
        emit(SuccessState());
      } else {
        emit(ErrorState(ServerFailure(message: response.message!)));
      }
    } catch (e) {
      emit(ErrorState(ServerFailure(message: '$e')));
    }
  }
}

class VehicleOsago extends Bloc<OsagoEvent, OsagoState>
    implements OnVehicleListener {
  var vehicleInfo = CarInformationResponse();

  bool get isHaveVehicleInfo {
    print('ERRORERRORERRORERRORERRORERROR ${vehicleInfo.error}');
    return vehicleInfo.error == '0';
  }

  @override
  onWait(bool isProgressbar) {
    print(isProgressbar == true ? 'Loading...' : 'Loading finished');
  }

  @override
  onVehicle(CarInformationResponse vehicle) {
    this.vehicleInfo = vehicle;
    emit(SuccessState());
  }

  VehicleOsago() : super(SuccessState()) {
    on<ClearVehicleInfoEvent>(clearVehicle);
  }

  Future<void> clearVehicle(
      ClearVehicleInfoEvent event, Emitter<OsagoState> emit) async {
    emit(LoadingState());
    vehicleInfo = CarInformationResponse.empty();
    emit(SuccessState());
  }
}

class UserInfoOsago extends Bloc<OsagoEvent, OsagoState>
    implements OnUserInforListener {
  var userInformation = UserInfoResponse();

  UserInfoOsago() : super(SuccessState());

  @override
  void onUserInfo(UserInfoResponse userInfo) {
    userInformation = userInfo;
    emit(SuccessState());
  }

  @override
  void onWait(bool isProgressbar) {
    if (isProgressbar) {
      emit(LoadingState());
    }
  }
}

class Step2Bloc extends Bloc<OsagoEvent, OsagoState> {
  bool selectPolicy = true;

  Step2Bloc() : super(SuccessState()) {
    on<SelectPolicyEvent>(selPolicy);
  }

  Future<void> selPolicy(
      SelectPolicyEvent event, Emitter<OsagoState> emit) async {
    emit(LoadedState());
    selectPolicy = !selectPolicy;
    emit(SuccessState());
  }
}

class Step3Bloc extends Bloc<OsagoEvent, OsagoState> {
  String? endTimeTravel;
  String? startTimeTravel;
  String endcurrentDate = DateFormat('dd.MM.yyyy').format(DateTime.now());
  String startcurrentDate = DateFormat('dd.MM.yyyy').format(DateTime.now());
  Step3Bloc() : super(SuccessState()) {
    on<StartTimeEvent>(startTimeFunc);
    on<EndTimeEvent>(endTimeFunc);
  }

  String get startTime {
    // return userBirthDateNow ?? "дд.мм.гггг";
    return startTimeTravel ?? startcurrentDate;
    // return startTimeTravel != null ? startcurrentDate : startTimeTravel!;
  }

  String get endTime {
    // return userBirthDateNow ?? "дд.мм.гггг";
    return endTimeTravel ?? endcurrentDate;
    // return endTimeTravel != null ? endcurrentDate : endTimeTravel!;
  }

  Future<void> startTimeFunc(
      StartTimeEvent event, Emitter<OsagoState> emit) async {
    emit(LoadedState());
    String userBirthDate = DateTime.now().toString();

    DateTime? selectedDate = await showDialog<DateTime>(
      context: Get.context!,
      builder: (context) {
        return SelectDatesDilog(birthDate: userBirthDate);
      },
    );

    if (selectedDate != null) {
      print("Foydalanuvchi tanlagan sana: ${selectedDate.toString()}");
      startTimeTravel = DateFormat('dd.MM.yyyy').format(selectedDate);
      print('FormatLangan Sana ${startTimeTravel}');
      emit(SuccessState());
    }
  }

  Future<void> endTimeFunc(EndTimeEvent event, Emitter<OsagoState> emit) async {
    emit(LoadedState());
    String userBirthDate = DateTime.now().toString();

    DateTime? selectedDate = await showDialog<DateTime>(
      context: Get.context!,
      builder: (context) {
        return SelectDatesDilog(birthDate: userBirthDate);
      },
    );

    if (selectedDate != null) {
      print("Foydalanuvchi tanlagan sana: ${selectedDate.toString()}");
      endTimeTravel = DateFormat('dd.MM.yyyy').format(selectedDate);
      print('FormatLangan Sana ${endTimeTravel}');
      emit(SuccessState());
    }
  }
}

class Step4Bloc extends Bloc<OsagoEvent, OsagoState> {
  Step4Bloc() : super(SuccessState()) {}
}
