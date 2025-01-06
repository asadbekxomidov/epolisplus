import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/repository/profil/profil_repository.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'add_car_event.dart';
part 'add_car_state.dart';

class AddedCarBloc extends Bloc<AddedCarEvent, AddedCarState>
    implements OnVehicleListener {
  var _vehicleInformation = CarInformationResponse();

  String get getVehicleOwnerName {
    return "${_vehicleInformation.orgName} ${_vehicleInformation.birthday}";
  }

  final TextEditingController carNumberController = TextEditingController();
  final TextEditingController teachSeriaController = TextEditingController();
  final TextEditingController teachPassportNumberController =
      TextEditingController();

  AddedCarBloc() : super(CarInitialState()) {
    on<AddCarEvent>(onmyCarInformation);
    on<RegisterCertificateNumberEvent>(onpushScreen);
  }

  Future<void> onmyCarInformation(
      AddCarEvent event, Emitter<AddedCarState> emit) async {
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

        print('Response status: ${response.status}');
        print('Response message: ${response.message}');
        print('Response data: ${response.response}');
        logger(response.toString(), error: "MyCar Bloc");

        if (response.status == 200 && response.response != null) {
          print(response.response!);
          print("object");
          _vehicleInformation = response.response!;
          // listener.onVehicle(_vehicleInformation);
          emit(CarInformationGetState());
        } else if (response.status == 500) {
        } else {
          emit(CarErrorState(response.message!));
        }
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
}

abstract class OnVehicleListener {
  void onVehicle(CarInformationResponse vehicle);
}
