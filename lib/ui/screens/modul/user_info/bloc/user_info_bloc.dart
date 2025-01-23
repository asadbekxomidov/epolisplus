import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  TextEditingController seriaController = TextEditingController();
  TextEditingController pasportIdController = TextEditingController();

  UserInfoBloc() : super(SuccessState()) {
    on<UserInfoGetEvent>(getUserInfo);
  }

  Future<void> getUserInfo(
      UserInfoGetEvent event, Emitter<UserInfoState> emit) async {
    emit(LoadingState());
    try {
      var seria = seriaController.text.trim();
      var pasportId = pasportIdController.text.trim();

      if (seria.length == 2 && pasportId.length == 7) {
        emit(SuccessState());
      } else {
        emit(ErrorState());
      }
    } catch (e) {
      emit(ErrorState());
    }
  }
}
