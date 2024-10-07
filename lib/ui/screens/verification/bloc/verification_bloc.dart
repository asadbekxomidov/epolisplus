import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:get/get.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  TextEditingController otpController = TextEditingController();
  FocusNode focusNode = FocusNode();

  VerificationBloc() : super(VerificationSuccessState()) {
    on<CheckVerificationEvent>(verification);
  }

  verification(
    CheckVerificationEvent event,
    Emitter<VerificationState> emit,
  ) {
    var phoneCode = otpController.text.toString().trim();
    phoneCode = clearPhoneMask(phoneCode);

    if (phoneCode.length != 5) {
      emit(VerificationErrorState(InputPhoneCodeFailure()));
      return;
    }

    // serverdan telefon number bor yoki yo'qligini tekshirish kerak

    if (phoneCode == "00000") {
      Get.to(() => ResetPasswordScreen());
    } else {
      emit(VerificationErrorState(InputPhoneCodeFailure()));
      // Get.to(() => ResetPasswordScreen());
    }

    emit(VerificationSuccessState());
  }
}
