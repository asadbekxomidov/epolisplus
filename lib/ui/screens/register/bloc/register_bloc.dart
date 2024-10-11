import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/masks.dart';
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

  register(
    CheckRegisterEvent event,
    Emitter<RegisterState> emit,
  ) {
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
      print(phoneNumber);
      print(password);
      print(confirmPassword);
      print(fullName);
      emit(RegisterErrorState(InputRegisterFailure()));
      return;
    }

    if (phoneNumber == "908579552" &&
        password.length >= 8 &&
        password == confirmPassword &&
        fullName.length >= 5) {
      print('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
      Get.to(() => VerificationScreen(phoneNumber: phoneNumber));
    } else {
      print('---------------------------------------------------------');
      emit(RegisterErrorState(InputRegisterFailure()));
    }
    emit(RegisterSuccessState());
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
