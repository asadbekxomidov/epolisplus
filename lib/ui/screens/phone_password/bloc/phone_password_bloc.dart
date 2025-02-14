import 'package:get/get.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/utils/errors.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/repository/auth/auth_repository.dart';

part 'phone_password_event.dart';
part 'phone_password_state.dart';

class PhonePasswordBloc extends Bloc<PhonePasswordEvent, PhonePasswordState> {
  final String phoneNumber;
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  PhonePasswordBloc(this.phoneNumber) : super(PhonePasswordSuccessState()) {
    on<CheckPhonePasswordEvent>(phonepassword);
  }
  Future<void> phonepassword(
      CheckPhonePasswordEvent event, Emitter<PhonePasswordState> emit) async {
    emit(PhonePasswordLoadingState());

    try {
      var phoneCode = otpController.text.trim();
      var password = passwordController.text.trim();
      var passwordConfirm = passwordConfirmController.text.trim();

      if (phoneCode.length != 5 ||
          password.length < 6 ||
          passwordConfirm.length < 6 ||
          password != passwordConfirm) {
        emit(PhonePasswordErrorState(PaaswordPhoneCodeFailure()));
        return;
      }

      var authRepository = AuthRepository();
      var baseResponse = await authRepository.resetPassword(
          phoneNumber, phoneCode, password, passwordConfirm);

      if (baseResponse.status == 200) {
        var isAuthUser = baseResponse.response as bool;

        if (isAuthUser) {
          Get.offAll(() => BottomWidget());
          emit(PhonePasswordSuccessState());
        } else {
          emit(PhonePasswordErrorState(PaaswordPhoneCodeFailure()));
        }
        emit(PhonePasswordSuccessState());
      } else {
        emit(PhonePasswordErrorState(PaaswordPhoneCodeFailure()));
      }
    } catch (e) {
      emit(PhonePasswordErrorState(PaaswordPhoneCodeFailure()));
    }
  }
}
