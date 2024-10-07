// import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
// import 'package:epolisplus/ui/screens/screns_export.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  RegisterBloc() : super(RegisterSuccessState()) {
    on<CheckRegisterEvent>(register);
  }

  register(
    CheckRegisterEvent event,
    Emitter<RegisterState> emit,
  ) {
    var phoneNumber = phoneController.text.toString().trim();
    var fullName = phoneController.text.toString().trim();
    var password = phoneController.text.toString().trim();
    var confirmPassword = phoneController.text.toString().trim();
    phoneNumber = clearPhoneMask(phoneNumber);

    if (phoneNumber.length != 9 &&
        password.length != 8 &&
        confirmPassword.length != 8 &&
        password != confirmPassword &&
        fullName.length >= 5) {
      print(phoneNumber);
      emit(RegisterErrorState(InputRegisterFailure()));
      return;
    }

    // serverdan telefon number bor yoki yo'qligini tekshirish kerak

    if (phoneNumber == "908579552" &&
        password.length >= 8 &&
        password != confirmPassword &&
        fullName.length >= 5) {
      // Get.to(() => VerificationScreen());
    } else {
      // Get.to(() => VerificationScreen());
    }

    emit(RegisterSuccessState());
  }
}
