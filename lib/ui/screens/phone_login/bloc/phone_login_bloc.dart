import 'package:bloc/bloc.dart';
import 'package:epolisplus/repository/auth_repository.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'phone_login_event.dart';
part 'phone_login_state.dart';

class PhoneLoginBloc extends Bloc<PhoneLoginEvent, PhoneLoginState> {
  TextEditingController phoneController = TextEditingController();
  bool isActive = true;

  PhoneLoginBloc() : super(PhoneWidgetState(isActive: true)) {
    on<CheckAuthEvent>(phonelogin);
    on<TogglePhoneWidgetActiveEvent>(onToggleActive);
  }

  Future<void> phonelogin(
      CheckAuthEvent event, Emitter<PhoneLoginState> emit) async {
    emit(LoadingState());
    await Future.delayed(Duration(seconds: 2));

    var phoneNumber = phoneController.text.trim();
    phoneNumber = clearPhoneMask(phoneNumber);

    if (phoneNumber.length != 9) {
      emit(ErrorState(InputPhoneFailure()));
      return;
    }

    emit(SuccessState());

    var authRepository = AuthRepository();
    var baseResponse = await authRepository.checkAuth(phoneNumber);

    if (baseResponse.status == 200) {
      var isAuthUser = baseResponse.response as bool;

      if (isAuthUser) {
        Get.to(() => LoginScreen(phoneNumber: phoneNumber));
      } else {
        Get.to(() => RegisterScreen(phoneNumber: phoneNumber));
      }
      return;
    }

    emit(ErrorState(ServerFailure(message: baseResponse.message!)));
    return;
  }

  void onToggleActive(
      TogglePhoneWidgetActiveEvent event, Emitter<PhoneLoginState> emit) {
    isActive = event.isActive;
    emit(PhoneWidgetState(isActive: isActive));
  }
}
