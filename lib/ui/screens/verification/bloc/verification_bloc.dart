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
      CheckVerificationEvent event, Emitter<VerificationState> emit) async {
    emit(VerificationLoadingState());
    await Future.delayed(Duration(seconds: 2));

    var phoneCode = otpController.text.toString().trim();
    phoneCode = clearPhoneMask(phoneCode);

    if (phoneCode.length != 5) {
      emit(VerificationErrorState(InputPhoneCodeFailure()));
      return;
    }

    emit(VerificationSuccessState());
    if (phoneCode == "00000") {
      Get.to(() => ResetPasswordScreen());
    } else {
      emit(VerificationErrorState(InputPhoneCodeFailure()));
      // Get.to(() => ResetPasswordScreen());
    }
  }
}
