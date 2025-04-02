import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:epolisplus/repository/servises/add_referall/add_referall_code_repository.dart';
import 'package:epolisplus/ui/screens/modul/add_code_referral/listener/ref_code_listener.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/errors.dart';
import 'package:epolisplus/utils/sharedPreferencesManager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'add_code_event.dart';
part 'add_code_state.dart';

class AddCodeBloc extends Bloc<AddCodeEvent, AddCodeState>
    implements OnRefCodeListener {
  bool isCheck = false;
  bool isCheckInput = false;
  TextEditingController refController = TextEditingController();

  @override
  void onRefRefCode() {
    // TODO: implement onChange
  }
  @override
  void onProgress(bool isProgress) {
    // TODO: implement onProgress
  }

  AddCodeBloc() : super(SuccessState()) {
    on<OpenInputPolEvent>(onpenInput);
    on<GetReferallEvent>(checkInput);
  }

  Future<void> onpenInput(
      OpenInputPolEvent event, Emitter<AddCodeState> emit) async {
    emit(LoadingState());
    isCheck = !isCheck;
    emit(SuccessState());
  }

  Future<void> checkInput(
      GetReferallEvent event, Emitter<AddCodeState> emit) async {
    await Future.delayed(Duration(milliseconds: 500));
    emit(LoadingState());
    await Future.delayed(Duration(seconds: 2));

    try {
      var refCode = refController.text.trim();
      final repository = AddReferallCodeRepository();
      var response = await repository.getRefCode(refCode);

      if (response.status == 200) {
        isCheckInput = !isCheckInput;
      } else if (response.status == 401) {
        final storage = SharedPreferencesManager();
        await storage.clearUserInfo();
        Get.offAll(() => CheckAuthScreen());
        emit(SuccessState());
      } else {
        emit(ErrorState(ServerFailure(message: response.message!)));
      }
    } catch (e) {
      emit(ErrorState(ServerFailure(message: '$e')));
    }

    emit(SuccessState());
  }
}
