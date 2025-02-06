import 'package:get/get.dart';
import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/repository/user_info/user_info_repository.dart';
import 'package:epolisplus/ui/widgets/select_birthdate/widget/select_birth_date_widget.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  OnUserInforListener listener;
  UserInfoResponse userinfomation;

  String? userBirthDateNow;
  String currentDate = DateFormat('dd.MM.yyyy').format(DateTime.now());
  TextEditingController seriaController = TextEditingController();
  TextEditingController pasportIdController = TextEditingController();

  bool get isHaveUserInformation {
    return userinfomation.error == "0";
  }

  String get isHaveUserFullName {
    return userinfomation.fullNameTMR;
  }

  String get isHaveUserJSHSHR {
    return userinfomation.pinfl;
  }

  UserInfoBloc({
    required this.listener,
    required this.userinfomation,
  }) : super(SuccessState()) {
    on<UserInfoGetEvent>(getUserInfo);
    on<UserBirhDateEvent>(selectBirthDate);
  }

  String get formetersBirthDate {
    // return userBirthDateNow ?? "дд.мм.гггг";
    return userBirthDateNow ?? currentDate;
  }

  void onClickHandler() {
    if (formetersBirthDate == "дд.мм.гггг" ||
        formetersBirthDate == currentDate) {
      add(UserBirhDateEvent());
    }
  }

  Future<void> getUserInfo(
      UserInfoGetEvent event, Emitter<UserInfoState> emit) async {
    emit(LoadingState());
    try {
      var seria = seriaController.text.trim();
      var pasportId = pasportIdController.text.trim();

      if (seria.length == 2 &&
          pasportId.length == 7 &&
          formetersBirthDate != '') {
        listener.onWait(true);
        final repository = UserInfoRepository();
        final response = await repository.userInfo(
          seria,
          pasportId,
          formetersBirthDate,
        );
        listener.onWait(false);

        if (response.status == 200) {
          userinfomation = response.response!;
          listener.onUserInfo(userinfomation);
          emit(SuccessState());
        } else if (response.status == 401) {
          final preferens = SharedPreferencesManager();
          await preferens.clearUserInfo();
        } else if (response.status == 500) {
          emit(ErrorState(ServerFailure(message: response.message!)));
        }
      }
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState(UserInfometionError()));
    }
  }

  Future<void> selectBirthDate(
      UserBirhDateEvent event, Emitter<UserInfoState> emit) async {
    String userBirthDate = DateTime.now().toString();

    DateTime? selectedDate = await showDialog<DateTime>(
      context: Get.context!,
      builder: (context) {
        return SelectBirthDateDialog(birthDate: userBirthDate);
      },
    );

    if (selectedDate != null) {
      print("Foydalanuvchi tanlagan sana: ${selectedDate.toString()}");
      userBirthDateNow = DateFormat('dd.MM.yyyy').format(selectedDate);
      print('FormatLangan Sana ${userBirthDateNow}');
      emit(SuccessState());
    }
  }
}

abstract class OnUserInforListener {
  void onUserInfo(UserInfoResponse userInfo);
  void onWait(bool isProgressbar) {}
}
