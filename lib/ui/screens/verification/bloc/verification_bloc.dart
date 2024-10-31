import 'package:epolisplus/repository/auth_repository.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:get/get.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  final String phoneNumber;

  TextEditingController otpController = TextEditingController();
  FocusNode focusNode = FocusNode();

  VerificationBloc(this.phoneNumber) : super(VerificationSuccessState()) {
    on<CheckVerificationEvent>(verification);
  }

  Future<void> verification(
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

    var authRepository = AuthRepository();
    var baseResponse =
        await authRepository.confirmAccount(phoneNumber, phoneCode);

    if (baseResponse.status == 200) {
      var forgotPassword = baseResponse.response as bool;

      if (forgotPassword) {
        Get.to(() => ResetPasswordScreen());
      } else {
        emit(VerificationErrorState(InputPhoneCodeFailure()));
      }
    }
  }
}
