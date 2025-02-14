// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/modul/vehicle/bloc/add_car_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/utils/constanta.dart';
import 'package:flutter/material.dart';

part 'osago_event.dart';
part 'osago_state.dart';

class OsagoBloc extends Bloc<OsagoEvent, OsagoState> {
  late int currentindex;
  late int index = IConstanta.STEP_VEHICLE;

  OsagoBloc() : super(SuccessState()) {
    on<SelectButtonEvent>(selectBtn);
  }

  Future<void> selectBtn(
      SelectButtonEvent event, Emitter<OsagoState> emit) async {
    emit(LoadingState());
    index = currentindex;
    emit(SuccessState());
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
