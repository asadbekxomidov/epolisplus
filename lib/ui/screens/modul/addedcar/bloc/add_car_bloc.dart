import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/repository/profil/profil_repository.dart';

part 'add_car_event.dart';
part 'add_car_state.dart';

class AddedCarBloc extends Bloc<AddedCarEvent, AddedCarState>
    implements OnVehicleListener {
  var _vehicleInformation = CarInformationResponse();

  OnVehicleListener? listener;

  String get getVehicleOwnerName {
    return "${_vehicleInformation.orgName}";
  }

  String get getVehicleOwnerCarNumber {
    return "${_vehicleInformation.issueYear}";
  }

  String get getVehicleOwnerCarModelName {
    return "${_vehicleInformation.modelName}";
  }

  final TextEditingController carNumberController = TextEditingController();
  final TextEditingController teachSeriaController = TextEditingController();
  final TextEditingController teachPassportNumberController =
      TextEditingController();

  AddedCarBloc({this.listener}) : super(CarInitialState()) {
    on<GetInfromationCarEvent>(onmyCarInformation);
    on<RegisterCertificateNumberEvent>(onpushScreen);
    on<AddCarEvent>(onaddCar);
  }

  Future<void> onmyCarInformation(
      GetInfromationCarEvent event, Emitter<AddedCarState> emit) async {
    emit(CarLoadingState());

    var carNumber = carNumberController.text.trim();
    var teachPassportSeria = teachSeriaController.text.trim();
    var teachPassportNumber = teachPassportNumberController.text.trim();

    try {
      final ProfilRepository repository = ProfilRepository();
      if (carNumber.isNotEmpty &&
          teachPassportSeria.isNotEmpty &&
          teachPassportNumber.isNotEmpty) {
        var response = await repository.getCarInformation(
          teachPassportSeria,
          teachPassportNumber,
          carNumber,
        );

        if (response.status == 200 && response.response != null) {
          print(response.response!);
          print("object");
          _vehicleInformation = response.response!;
          // listener!.onVehicle(_vehicleInformation);
          emit(CarInformationGetState());
        } else if (response.status == 500) {
        } else {
          emit(CarErrorState(response.message!));
        }
      } else {
        emit(CarErrorState('Malumotlar bosh'));
      }
    } catch (e) {
      emit(CarErrorState(e.toString()));
    }
  }

  Future<void> onpushScreen(
      RegisterCertificateNumberEvent event, Emitter<AddedCarState> emit) async {
    Get.to(() => RegisterCertnumberScreen());
  }

  bool isShowBtn = false;
  @override
  void onVehicle(CarInformationResponse vehicle) {
    if (vehicle.error == "0") {
      isShowBtn = true;
      // emit(CarSuccesState());
    }
  }

  // Future<void> onaddCar(AddCarEvent event, Emitter<AddedCarState> emit) async {
  //   emit(CarLoadedState());

  //   try {
  //     final ProfilRepository repository = ProfilRepository();

  //     var baseResponse = await repository.addUserCar(_vehicleInformation);

  //     if (baseResponse.status == 200) {
  //       Get.back();
  //       emit(CarSuccesState());
  //     } else {
  //       emit(CarErrorState(baseResponse.message!));
  //     }
  //   } catch (e) {
  //     emit(CarErrorState(e.toString()));
  //   }
  // }

  Future<void> onaddCar(AddCarEvent event, Emitter<AddedCarState> emit) async {
    emit(CarLoadedState());

    try {
      final ProfilRepository repository = ProfilRepository();
      var carNumber = carNumberController.text.trim();
      var teachPassportSeria = teachSeriaController.text.trim();
      var teachPassportNumber = teachPassportNumberController.text.trim();

      if (carNumber.isNotEmpty &&
          teachPassportSeria.isNotEmpty &&
          teachPassportNumber.isNotEmpty) {
        var data = _vehicleInformation.toJson();
        // var data = _vehicleInformation.toJson(
        //   carNumber,
        //   teachPassportSeria,
        //   teachPassportNumber,
        // );

        var baseResponse = await repository.addUserCar(data);

        if (baseResponse.status == 200) {
          Get.back();
          emit(CarSuccesState());
        } else {
          emit(CarErrorState(baseResponse.message!));
        }
      }
    } catch (e) {
      emit(CarErrorState(e.toString()));
    }
  }
}

abstract class OnVehicleListener {
  void onVehicle(CarInformationResponse vehicle);
}
