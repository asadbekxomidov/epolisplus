import 'package:get/get.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/repository/auth/auth_repository.dart';

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

    var phoneCode = otpController.text.toString().trim();

    if (phoneCode.length != 5) {
      emit(VerificationErrorState(InputPhoneCodeFailure()));
      return;
    }

    final authRepository = AuthRepository();

    if (phoneNumber.isNotEmpty && phoneCode.isNotEmpty) {
      print(phoneNumber);
      print(phoneCode);
      final baseResponse =
          await authRepository.confirmAccount(phoneNumber, phoneCode);

      if (baseResponse.status == 200) {
        Get.offAll(() => BottomWidget());
        emit(VerificationSuccessState());
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
      final baseResponse = await authRepository.resendSms(phoneNumber);

      if (baseResponse.status == 200) {
        emit(VerificationSuccessState());
      } else {
        emit(VerificationErrorState(SmsSendFailure()));
      }
    } catch (e) {
      emit(VerificationErrorState(SmsSendFailure()));
    }
  }
}
