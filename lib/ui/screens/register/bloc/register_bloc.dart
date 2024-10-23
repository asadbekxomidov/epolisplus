import 'package:epolisplus/repository/auth_repository.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
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

  RegisterBloc() : super(RegisterInitialState()) {
    on<CheckRegisterEvent>(register);
    on<ToggleAgreeEvent>(toggleAgree);
    on<RegisterSetPhoneNumberEvent>(setData);
  }

  Future<void> register(
      CheckRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoadingState());
    await Future.delayed(Duration(seconds: 2));

    var phoneNumber = phoneController.text.toString().trim();
    var fullName = fullNameController.text.toString().trim();
    var password = passwordController.text.toString().trim();
    var confirmPassword = confirmPasswordController.text.toString().trim();
    phoneNumber = clearPhoneMask(phoneNumber);

    if (phoneNumber.length != 9) {
      // if (phoneNumber.length != 9 ||
      //     password.length != 8 ||
      //     confirmPassword.length != 8 ||
      //     password != confirmPassword ||
      //     fullName.length < 5) {

      emit(RegisterErrorState(InputRegisterFailure()));
      return;
    }

    emit(RegisterSuccessState());

    var authRepository = AuthRepository();
    var baseResponse = await authRepository.register(
        fullName, phoneNumber, password, confirmPassword, '', '');

    if (baseResponse.status == 200) {
      var userSignIn = baseResponse.response as bool;
      if (userSignIn) {
        Get.to(() => HomeScreen());
      } else {
        emit(RegisterErrorState(InputRegisterFailure()));
      }
    }

    // if (phoneNumber == "908579552" &&
    //     password.length >= 8 &&
    //     password == confirmPassword &&
    //     fullName.length >= 5) {
    //   Get.to(() => VerificationScreen(phoneNumber: phoneNumber));
    // } else {
    //   emit(RegisterErrorState(InputRegisterFailure()));
    // }
  }

  void toggleAgree(ToggleAgreeEvent event, Emitter<RegisterState> emit) {
    isAgreeChecked = event.isAgreeChecked;
    emit(RegisterAgreeCheckedState(isAgreeChecked));
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
}
