import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/repository/auth/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SharedPreferencesManager _prefsManager = SharedPreferencesManager();

  LoginBloc() : super(SuccessState()) {
    on<CheckLoginEvent>(login);
    on<SetPhoneNumberEvent>(setData);
    on<LoginResetPasswordEvent>(resetPassword);
  }

  Future<void> login(CheckLoginEvent event, Emitter<LoginState> emit) async {
    var phoneNumber = phoneController.text.trim();
    var password = passwordController.text.trim();
    phoneNumber = clearPhoneMask(phoneNumber);

    // Validate phone number and password
    if (phoneNumber.length != 9 || password.length < 6) {
      emit(LoginErrorState(LoginFailure()));
      return;
    }

    emit(LoginLoadingtate());

    final authRepository = AuthRepository();
    final baseResponse = await authRepository.login(phoneNumber, password);

    if (baseResponse.status == 200 && baseResponse.response != null) {
      // Cast response to LoginResponse
      final loginResponse = LoginResponse(
        baseResponse.response!.access_token,
        baseResponse.response!.phone,
        baseResponse.response!.full_name,
      );

      // Save token in Shared Preferences
      await _prefsManager.saveToken(loginResponse.access_token);
      await _prefsManager.savePhone(phoneNumber);
      await _prefsManager.savePassword(password);

      // Navigate to BottomWidget
      Get.offAll(() => BottomWidget());
      emit(SuccessState());
    } else if (baseResponse.status == 401) {
      // Token muddati o'tgan bo'lsa, tokenni o‘chirib LoginScreen'ga qaytarish
      await _prefsManager.clearToken();
      Get.offAll(() => LoginScreen(phoneNumber: phoneNumber));
      emit(LoginErrorState(LoginFailure()));
    } else {
      emit(LoginErrorState(LoginFailure()));
    }
  }

  FutureOr<void> setData(SetPhoneNumberEvent event, Emitter<LoginState> emit) {
    phoneController.text = Masked.maskPhone
        .formatEditUpdate(
          TextEditingValue(text: ''),
          TextEditingValue(text: event.number),
        )
        .text;
    emit(SuccessState());
  }

  void resetPassword(LoginResetPasswordEvent event, Emitter<LoginState> emit) {
    Get.to(() => ResetPasswordScreen());
    emit(SuccessState());
  }
}
