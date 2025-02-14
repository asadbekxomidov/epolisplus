import 'package:epolisplus/repository/auth/auth_repository.dart';
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

  Future<void> resetpassword(
      CheckResetPasswordEvent event, Emitter<ResetPasswordState> emit) async {
    emit(ResetPasswordLoadingState());
    await Future.delayed(Duration(seconds: 2));

    var phoneNumber = otpController.text.toString().trim();
    phoneNumber = clearPhoneMask(phoneNumber);

    if (phoneNumber.length != 9) {
      print(phoneNumber);
      emit(ResetPasswordErrorState(InputPhoneFailure()));
      return;
    }

    Get.to(() => PhoneRasswordScreen(phoneNumber));

    emit(ResetPasswordSuccessState());

    var authRepository = AuthRepository();
    var baseResponse = await authRepository.forgotPassword(phoneNumber);

    Get.to(() => PhoneRasswordScreen(phoneNumber));
    if (baseResponse.status == 200) {
      var isUser = baseResponse.response as bool;

      if (isUser) {
        Get.to(() => PhoneRasswordScreen(phoneNumber));
      } else {
        emit(ResetPasswordErrorState(InputPhoneFailure()));
      }
      return;
    }
  }
}
