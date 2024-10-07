import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:get/get.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  TextEditingController otpController = TextEditingController();

  ResetPasswordBloc() : super(ResetPasswordSuccessState()) {
    on<CheckResetPasswordEvent>(resetpassword);
  }

  resetpassword(
    CheckResetPasswordEvent event,
    Emitter<ResetPasswordState> emit,
  ) {
    var phoneCode = otpController.text.toString().trim();
    phoneCode = clearPhoneMask(phoneCode);

    if (phoneCode.length != 9) {
      print(phoneCode);
      emit(ResetPasswordErrorState(InputPhoneFailure()));
      return;
    }

    // serverdan telefon number bor yoki yo'qligini tekshirish kerak

    if (phoneCode == "900000000") {
      Get.to(() => PhoneRasswordScreen());
    } else {
      emit(ResetPasswordErrorState(InputPhoneFailure()));
      // Get.to(() => PhoneRasswordScreen());
    }
    emit(ResetPasswordSuccessState());
  }
}
