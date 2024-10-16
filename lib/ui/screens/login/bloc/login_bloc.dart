import 'dart:async';
import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginBloc() : super(SuccessState()) {
    on<CheckLoginEvent>(login);
    on<SetPhoneNumberEvent>(setData);
  }

  login(CheckLoginEvent event, Emitter<LoginState> emit) async {
    var phoneNumber = phoneController.text.toString().trim();
    var password = passwordController.text.toString().trim();
    phoneNumber = clearPhoneMask(phoneNumber);
    phoneNumber = clearPhoneMask(phoneNumber);
    logger(phoneNumber);
    if (phoneNumber.length != 9 && password.length != 8) {
      emit(LoginErrorState(LoginFailure()));
      return;
    }

    emit(LoginLoadingtate());
    await Future.delayed(Duration(seconds: 2));

    // serverdan telefon number bor yoki yo'qligini tekshirish kerak
    emit(SuccessState());
    if (phoneNumber == "900000000" && password == "asadbek2006") {
      Get.to(() => VerificationScreen(phoneNumber: phoneController.text));
      // Get.to(() => RegisterScreen());
    } else {
      emit(LoginErrorState(LoginFailure()));
    }
  }

  FutureOr<void> setData(SetPhoneNumberEvent event, Emitter<LoginState> emit) {
    phoneController.text = Masked.maskPhone
        .formatEditUpdate(
          TextEditingValue(text: ''),
          TextEditingValue(text: event.number),
        )
        .text;
    emit(SuccessState());
  }
}
