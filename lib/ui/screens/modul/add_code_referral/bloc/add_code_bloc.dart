import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'add_code_event.dart';
part 'add_code_state.dart';

class AddCodeBloc extends Bloc<AddCodeEvent, AddCodeState> {
  bool isCheck = false;
  bool isCheckInput = false;
  TextEditingController refController = TextEditingController();

  AddCodeBloc() : super(SuccessState()) {
    on<OpenInputPolEvent>(onpenInput);
    on<CheckInputPolEvent>(checkInput);
  }

  Future<void> onpenInput(
      OpenInputPolEvent event, Emitter<AddCodeState> emit) async {
    emit(LoadingState());
    isCheck = !isCheck;
    emit(SuccessState());
  }

  Future<void> checkInput(
      CheckInputPolEvent event, Emitter<AddCodeState> emit) async {
    emit(LoadingState());
    isCheckInput = !isCheckInput;
    emit(SuccessState());
  }
}
