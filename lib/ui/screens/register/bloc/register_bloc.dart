import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/repository/auth/auth_repository.dart';
// import 'package:epolisplus/ui/screens/check_auth/bloc/check_auth_bloc.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  bool isAgreeChecked = false;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final SharedPreferencesManager _prefsManager = SharedPreferencesManager();

  RegisterBloc() : super(RegisterSuccessState()) {
    on<CheckRegisterEvent>(register);
    on<ToggleAgreeEvent>(toggleAgree);
    on<RegisterSetPhoneNumberEvent>(setData);
    on<OfertaPushEvent>(ofertaPush);
  }

  Future<void> register(
      CheckRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoadingState());
    await Future.delayed(const Duration(seconds: 2));

    var phoneNumber = phoneController.text.trim();
    var fullName = fullNameController.text.trim();
    var password = passwordController.text.trim();
    var password_repeat = confirmPasswordController.text.trim();
    phoneNumber = clearPhoneMask(phoneNumber);

    if (isAgreeChecked == true) {
      if (phoneNumber.length != 9) {
        emit(RegisterErrorState(InputRegisterFailure()));
        return;
      }

      if (password != password_repeat) {
        return;
      }

      var authRepository = AuthRepository();
      var baseResponse = await authRepository.register(
        fullName.trim(),
        phoneNumber,
        password,
      );

      await _prefsManager.savePhone(phoneNumber);

      emit(RegisterSuccessState());
      if (baseResponse.status == 200) {
        logger(baseResponse.response.toString(), error: "Register Bloc");
        Get.to(() => VerificationScreen(phoneNumber: phoneNumber));
        emit(RegisterSuccessState());
      } else {
        emit(RegisterErrorState(InputRegisterFailure()));
      }
    } else {
      emit(RegisterErrorState(ButtonRegisterFailure()));
    }
  }

  Future<void> toggleAgree(
      ToggleAgreeEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoadingState());
    isAgreeChecked = !isAgreeChecked;
    emit(RegisterSuccessState());
  }

  void setData(RegisterSetPhoneNumberEvent event, Emitter<RegisterState> emit) {
    phoneController.text = Masked.maskPhone
        .formatEditUpdate(
          TextEditingValue(text: ''),
          TextEditingValue(text: event.number),
        )
        .text;
    emit(RegisterSuccessState());
  }

  Future<void> ofertaPush(
      OfertaPushEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoadingState());
    Get.to(() => OfertaScreen());
    emit(RegisterSuccessState());
  }
}
