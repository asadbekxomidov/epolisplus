import 'package:epolisplus/repository/profil/profil_repository.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'my_car_event.dart';
part 'my_car_state.dart';

class MyCarBloc extends Bloc<MyCarEvent, MyCarState> {
  final TextEditingController carNumberController = TextEditingController();
  final TextEditingController teachSeriaController = TextEditingController();
  final TextEditingController teachPassportNumberController =
      TextEditingController();

  MyCarBloc() : super(CarInitialState()) {
    on<AddCarEvent>(onmyCarInformation);
    on<RegisterCertificateNumberEvent>(onpushScreen);
  }

  Future<void> onmyCarInformation(
      AddCarEvent event, Emitter<MyCarState> emit) async {
    emit(CarLoadingState());

    var carNumber = carNumberController.text.trim();
    var teachPassportSeria = teachSeriaController.text.trim();
    var teachPassportNumber = teachPassportNumberController.text.trim();
    try {
      final ProfilRepository repository = ProfilRepository();
      var response = repository.getCarInformation(
        teachPassportSeria,
        teachPassportNumber,
        carNumber,
      );
    } catch (e) {
      emit(CarErrorState(e.toString()));
    }
  }

  Future<void> onpushScreen(
      RegisterCertificateNumberEvent event, Emitter<MyCarState> emit) async {
    Get.to(() => RegisterCertnumberScreen());
  }
}


// getCarInformation