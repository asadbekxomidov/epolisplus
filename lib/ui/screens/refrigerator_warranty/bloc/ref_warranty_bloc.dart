// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'ref_warranty_event.dart';
part 'ref_warranty_state.dart';

class RefWarrantyBloc extends Bloc<RefWarrantyEvent, RefWarrantyState> {
  var listActivateCode = <ActivateCodeModels>[
    ActivateCodeModels(
      models: ActivateCodeResponse(
        id: -1,
        code: '',
        info: '',
        status: -1,
        status_label: '',
        partners: [],
      ),
      controller: TextEditingController(),
    ),
  ];

  bool isHaveQrCodeInfo(int position) {
    return listActivateCode[position].models.code.isNotEmpty;
  }

  isHaveActivatePartnersInfo(int position) {
    final activateCodeResponse =
        listActivateCode[position].models as ActivateCodeResponse;

    // partners ro'yxatiga kirish
    return activateCodeResponse.partners; // partners ro'yxatini qaytarish
  }

  String? partnerName;
  final int maxWidgets = 4;
  RefWarrantyBloc() : super(SuccessState()) {
    on<OpenScanningQrCodeEvent>(openScaningPage);
    on<DeleteActiveCodeEvent>(deleteItem);
    on<AddActivateCodeEvent>(addItem);
  }


  void openScaningPage(
      OpenScanningQrCodeEvent event, Emitter<RefWarrantyState> emit) async {
    var code = await Get.to(() => QrCodeScanerScreen());
    if (code != "") {
      listActivateCode[event.position].controller.text = code;
      emit(SuccessState());
      var response = checkingServerCode(
        listActivateCode[event.position].controller.text,
      );

      if (response.error == 0) {
        listActivateCode[event.position].models = response;
        emit(SuccessState());
      } else {
        emit(ErrorState(ServerFailure(message: response.partnerName)));
      }
    }
  }

  Future<void> deleteItem(
      DeleteActiveCodeEvent event, Emitter<RefWarrantyState> emit) async {
    emit(LoadingState());
    listActivateCode.removeAt(event.position);
    emit(SuccessState());
  }

  Future<void> addItem(
      AddActivateCodeEvent event, Emitter<RefWarrantyState> emit) async {
    emit(LoadingState());
    listActivateCode.add(
      ActivateCodeModels(
        models: ActivateCodeResponse(
          id: -1,
          code: '',
          info: '',
          status: -1,
          status_label: '',
          partners: [],
        ),
        controller: TextEditingController(),
      ),
    );
    emit(SuccessState());
  }

  checkingServerCode(String text) async {
    emit(LoadingState());

    try {
      // var qrcode = qrCodeController.text.trim();

      if (text.isNotEmpty) {
        // final repository = WarrantyCodeRepository();
        // final response = await repository.warrantyInfo(text);

        // if (response.status == 200) {
        //   return ActivateCodeResponse(
        //     code: '',
        //     id: 1,
        //     info: '',
        //     partners: [],
        //     status: 2,
        //     status_label: '',
        //   );
        // } else if (response.status == 401) {
        //   final preferense = SharedPreferencesManager();
        //   await preferense.clearUserInfo();
        //   emit(SuccessState());
        // }
      } else {
        emit(ErrorState(QrCodemaybeerror()));
      }
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState(QrCodemaybeerror()));
    }
  }
}
