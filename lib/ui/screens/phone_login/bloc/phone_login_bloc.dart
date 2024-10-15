import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'phone_login_event.dart';
part 'phone_login_state.dart';

class PhoneLoginBloc extends Bloc<PhoneLoginEvent, PhoneLoginState> {
  TextEditingController phoneController = TextEditingController();

  PhoneLoginBloc() : super(SuccessState()) {
    on<CheckAuthEvent>(phonelogin);
    on<TogglePhoneWidgetActiveEvent>(onTogglePhoneWidgetActive);
  }

  phonelogin(CheckAuthEvent event, Emitter<PhoneLoginState> emit) async {
    emit(LoadingState());
    await Future.delayed(Duration(seconds: 100));

    var phoneNumber = phoneController.text.toString().trim();
    phoneNumber = clearPhoneMask(phoneNumber);

    if (phoneNumber.length != 9) {
      print(phoneNumber);
      emit(ErrorState(InputPhoneFailure()));
      return;
    }
    emit(SuccessState());
    if (phoneNumber == "900000000") {
      Get.to(() => LoginScreen(phoneNumber: phoneNumber));
    } else {
      Get.to(() => RegisterScreen(phoneNumber: phoneNumber));
    }
  }

  void onTogglePhoneWidgetActive(
      TogglePhoneWidgetActiveEvent event, Emitter<PhoneLoginState> emit) {
    final currentState = state;
    if (currentState is PhoneSuccessState) {
      emit(PhoneSuccessState(isActive: !currentState.isActive));
    }
  }
}
