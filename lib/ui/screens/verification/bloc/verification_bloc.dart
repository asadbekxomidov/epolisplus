import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/repository/auth/auth_repository.dart';
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
    on<SendVerificationEvent>(sendcode);
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

    final authRepository = AuthRepository();

    if (phoneNumber.isNotEmpty && phoneCode.isNotEmpty) {
      final baseResponse =
          await authRepository.confirmAccount(phoneNumber, phoneCode);

      if (baseResponse.status == 200) {
        logger(baseResponse.response.toString(), error: "Verification Bloc");
        final forgotPassword = baseResponse.response as bool? ?? false;

        if (forgotPassword) {
          Get.to(() => ResetPasswordScreen());
        } else {
          emit(VerificationErrorState(InputPhoneCodeFailure()));
        }
      } else {
        emit(VerificationErrorState(InputPhoneCodeFailure()));
      }
    } else {
      emit(VerificationErrorState(PhoneCodeFailure()));
    }
  }

  Future<void> sendcode(
      SendVerificationEvent event, Emitter<VerificationState> emit) async {
    emit(VerificationInitialState());

    final authRepository = AuthRepository();

    try {
      print("send Code func");
      final baseResponse = await authRepository.resendSms(phoneNumber);

      if (baseResponse.status == 200) {
        print("send Code func ${baseResponse.status}");
        emit(VerificationSuccessState());
        logger(baseResponse.response.toString(), error: "Verification Bloc");
      } else {
        emit(VerificationErrorState(SmsSendFailure()));
      }
    } catch (e) {
      emit(VerificationErrorState(SmsSendFailure()));
    }
  }
}
