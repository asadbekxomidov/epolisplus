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

  LoginBloc() : super(LoginSuccessState()) {
    on<CheckLoginEvent>(login);
  }

  login(
    CheckLoginEvent event,
    Emitter<LoginState> emit,
  ) {
    var phoneNumber = phoneController.text.toString().trim();
    var password = passwordController.text.toString().trim();
    phoneNumber = clearPhoneMask(phoneNumber);
    phoneNumber = clearPhoneMask(phoneNumber);

    if (phoneNumber.length != 9 && password.length != 8) {
      print(phoneNumber);
      emit(LoginErrorState(LoginFailure()));
      return;
    }

    // serverdan telefon number bor yoki yo'qligini tekshirish kerak

    if (phoneNumber == "900000000" && password == "asadbek2006") {
      Get.to(() => VerificationScreen(phoneNumber: phoneController.text));
      // Get.to(() => RegisterScreen());
    } else {
      emit(LoginErrorState(LoginFailure()));
    }

    emit(LoginSuccessState());
  }
}
