import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/repository/auth/auth_repository.dart';
import 'package:epolisplus/repository/profil/profil_repository.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'edit_profil_event.dart';

part 'edit_profil_state.dart';

class EditProfilBloc extends Bloc<EditProfilEvent, EditProfilState> {
  final SharedPreferencesManager _prefsManager = SharedPreferencesManager();
  TextEditingController userNameController = TextEditingController();

  EditProfilBloc(String userName) : super(EditProfileInitialState()) {
    userNameController.text = userName;
    on<EditProfilUpdateEvent>(_onEditUser);
    on<DeleteAccountEvent>(_ondeleteAccount);
  }

  Future<void> _onEditUser(
      EditProfilUpdateEvent event, Emitter<EditProfilState> emit) async {
    emit(EditProfileLoadingState());

    try {
      final repository = ProfilRepository();
      final response =
          await repository.updateProfil(userNameController.text.toString());

      if (response.status == 200) {
        // emit(EditProfileLoadingState());
        Get.back();
        return;
        // emit(EditProfileInitialState());
      } else {
        emit(EditProfileErrorState(UserInfoNotChange()));
      }
    } catch (e) {
      emit(EditProfileErrorState(UserInfoNotChange()));
    }
  }

  Future<void> _ondeleteAccount(
      DeleteAccountEvent event, Emitter<EditProfilState> emit) async {
    emit(EditProfileLoadingState());

    String? token = await _prefsManager.getToken();
    String? phone = await _prefsManager.getPhone();

    if (token == null || phone == null) {
      emit(EditProfileErrorState(UserInfoNotChange()));
      return;
    }

    final baseResponse = await AuthRepository().deleteAccount(
      phone,
      token,
    );

    if (baseResponse.status == 200) {
      await _prefsManager.clearToken();
      await _prefsManager.clearPhone();
      await _prefsManager.clearPassword();

      Get.off(() => CheckAuthScreen());
    } else {
      logger(baseResponse.message.toString());
      emit(EditProfileErrorState(UserInfoNotChange()));
    }
  }
}
