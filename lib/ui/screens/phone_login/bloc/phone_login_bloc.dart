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
  bool isActive = true;

  PhoneLoginBloc() : super(PhoneWidgetState(isActive: true)) {
    on<CheckAuthEvent>(_phonelogin);
    on<TogglePhoneWidgetActiveEvent>(_onToggleActive);
  }

  Future<void> _phonelogin(
      CheckAuthEvent event, Emitter<PhoneLoginState> emit) async {

    add(TogglePhoneWidgetActiveEvent(false));
    emit(LoadingState());
    await Future.delayed(Duration(seconds: 100));

    var phoneNumber = phoneController.text.trim();
    phoneNumber = clearPhoneMask(phoneNumber);

    if (phoneNumber.length != 9) {
      emit(ErrorState(InputPhoneFailure()));
      add(TogglePhoneWidgetActiveEvent(true));
      return;
    }

    emit(SuccessState());

    if (phoneNumber == "900000000") {
      Get.to(() => LoginScreen(phoneNumber: phoneNumber));
    } else {
      Get.to(() => RegisterScreen(phoneNumber: phoneNumber));
    }

    add(TogglePhoneWidgetActiveEvent(true));
  }

  void _onToggleActive(
      TogglePhoneWidgetActiveEvent event, Emitter<PhoneLoginState> emit) {
    isActive = event.isActive;
    emit(PhoneWidgetState(isActive: isActive));
  }
}
