import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'phone_login_event.dart';
part 'phone_login_state.dart';

class PhoneLoginBloc extends Bloc<PhoneLoginEvent, PhoneLoginState> {
  TextEditingController phoneController = TextEditingController();

  PhoneLoginBloc() : super(SuccessState()) {
    on<CheckAuthEvent>(phonelogin);
  }

  phonelogin(
    CheckAuthEvent event,
    Emitter<PhoneLoginState> emit,
  ) {
    var phoneNumber = phoneController.text.toString().trim();
    phoneNumber = clearPhoneMask(phoneNumber);

    if (phoneNumber.length != 9) {
      print(phoneNumber);
      emit(ErrorState(InputPhoneFailure()));
      return;
    }

    if (phoneNumber == "900000000") {
      Get.to(() => LoginScreen(phoneNumber: phoneNumber));
    } else {
      Get.to(() => RegisterScreen(phoneNumber: phoneNumber));
    }
    emit(SuccessState());
  }
}
