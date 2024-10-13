import 'package:epolisplus/ui/screens/home/home_screen.dart';
import 'package:epolisplus/utils/errors.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'phone_password_event.dart';
part 'phone_password_state.dart';

class PhonePasswordBloc extends Bloc<PhonePasswordEvent, PhonePasswordState> {
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  PhonePasswordBloc() : super(PhonePasswordSuccessState()) {
    on<CheckPhonePasswordEvent>(phonepassword);
  }

  phonepassword(
      CheckPhonePasswordEvent event, Emitter<PhonePasswordState> emit) async {
    emit(PhonePasswordLoadingState());
    await Future.delayed(Duration(seconds: 2));

    var phoneCode = otpController.text.toString().trim();
    var password = passwordController.text.toString().trim();
    var passwordConfirm = passwordConfirmController.text.toString().trim();

    if (phoneCode.length != 5 &&
        password.length != 8 &&
        passwordConfirm.length != 8 &&
        passwordConfirm != password) {
      print(phoneCode);
      print(password);
      print(passwordConfirm);
      emit(PhonePasswordErrorState(PaaswordPhoneCodeFailure()));
      return;
    }

    emit(PhonePasswordSuccessState());
    if (phoneCode == "00000" &&
        password == "asadbek2006" &&
        password == passwordConfirm) {
      Get.to(() => HomeScreen());
    } else {
      emit(PhonePasswordErrorState(PaaswordPhoneCodeFailure()));
    }
  }
}
