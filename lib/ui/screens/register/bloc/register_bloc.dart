import 'package:epolisplus/repository/auth_repository.dart';
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

  // String phoneNumber;

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
    await Future.delayed(const Duration(seconds: 2));

    var phoneNumber = phoneController.text.trim();
    var fullName = fullNameController.text.trim();
    var password = passwordController.text.trim();
    var password_repeat = confirmPasswordController.text.trim();
    phoneNumber = clearPhoneMask(phoneNumber);

    if (phoneNumber.length != 9) {
      print('object');
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

    emit(RegisterSuccessState());
    if (baseResponse.status == 200) {
/*      print('object2');
      final loginResponse = RegisterResponse(
        baseResponse.response!.first_name as String? ?? '',
        baseResponse.response!.phone as String? ?? '',
        baseResponse.response!.password as String? ?? '',
        baseResponse.response!.password_repeat as String? ?? '',
        baseResponse.response!.email as String? ?? '',
        baseResponse.response!.last_name as String? ?? '',
      );*/
      print('object3');

      Get.to(
        () => VerificationScreen(
          phoneNumber: "",
        ),
      );
      print('object4');
      emit(RegisterSuccessState());
      print('object5');
    } else {
      print('object6');
      emit(RegisterErrorState(InputRegisterFailure()));
    }
  }

  toggleAgree(ToggleAgreeEvent event, Emitter<RegisterState> emit) {
    print("object1");
    print(isAgreeChecked);
    isAgreeChecked = !isAgreeChecked;
    //  emit(RegisterLoadingState());
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
}
