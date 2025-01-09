import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'warrantycode_event.dart';
part 'warrantycode_state.dart';

class WarrantycodeBloc extends Bloc<WarrantycodeEvent, WarrantycodeState> {
  WarrantycodeBloc() : super(WarrantycodeInitialState()) {
    on<WarrantycodePushScreenEvent>(onQrCodeScreen);
  }

  void onQrCodeScreen(
      WarrantycodePushScreenEvent event, Emitter<WarrantycodeState> emit) {
    Get.to(() => QrCodeScanerScreen());
  }
}
