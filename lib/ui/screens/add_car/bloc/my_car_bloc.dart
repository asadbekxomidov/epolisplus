// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';
import 'package:get/get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/repository/profil/profil_repository.dart';
import 'package:epolisplus/ui/screens/modul/vehicle/bloc/add_car_bloc.dart';
import 'package:epolisplus/models/profil/profil_response/carinforesponse/car_information_response.dart';

part 'my_car_event.dart';
part 'my_car_state.dart';

class MyCarBloc extends Bloc<MyCarEvent, MyCarState>
    implements OnVehicleListener {
  var vehicleInformation = CarInformationResponse();

  MyCarBloc() : super(CarInitialState()) {
    on<AddCarEvent>(addCar);
    on<ClearCarInfoEvent>(clearCarInfo);
  }

  @override
  void onVehicle(CarInformationResponse vehicle) {
    emit(MyCarLodingState());
    this.vehicleInformation = vehicle;
    print("Updated vehicle info: ${vehicle.orgName}");
    print("Updated error: ${vehicle.error}");
    emit(CarInitialState());
  }

  @override
  void onWait(bool isProgressbar) {}

  bool get isHaveCarInfor {
    print("Checking if vehicle info exists: ${vehicleInformation.error}");
    return vehicleInformation.error == "0";
  }

  bool get isHaveCarInformation {
    return vehicleInformation.error == "0";
  }

  Future<void> clearCarInfo(
      ClearCarInfoEvent event, Emitter<MyCarState> emit) async {
    emit(MyCarLodingState());
    vehicleInformation = CarInformationResponse();
    emit(MyCarSuccesState());
  }

  Future<void> addCar(AddCarEvent event, Emitter<MyCarState> emit) async {
    emit(MyCarLodingState());

    try {
      final ProfilRepository repository = ProfilRepository();

      var data = vehicleInformation.toJson();

      if (data.isNotEmpty) {
        var baseResponse = await repository.addUserCar(data);

        if (baseResponse.status == 200) {
          Get.back();
          emit(MyCarSuccesState());
        } else {
          emit(MyCarErrorState(CarNotFound()));
        }
      }
    } catch (e) {
      emit(MyCarErrorState(CarNotFound()));
    }
  }
}
