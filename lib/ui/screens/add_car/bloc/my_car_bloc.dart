import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'my_car_event.dart';
part 'my_car_state.dart';

class MyCarBloc extends Bloc<MyCarEvent, MyCarState> {
  TextEditingController carNumber = TextEditingController();
  MyCarBloc({required this.carNumber}) : super(CarInitialState()) {
    on<AddCarEvent>(onaddCar);
    on<RegisterCertificateNumberEvent>(onpushScreen);
  }

  Future<void> onaddCar(AddCarEvent event, Emitter<MyCarState> emit) async {
    emit(CarLoadingState());

    try {} catch (e) {}
  }

  Future<void> onpushScreen(
      RegisterCertificateNumberEvent event, Emitter<MyCarState> emit) async {
    Get.to(() => RegisterCertnumberScreen());
  }
}
