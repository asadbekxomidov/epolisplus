import 'package:get/get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';

part 'qr_code_event.dart';
part 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QRViewController? qrCodeController;
  String? scannedData;

  QrCodeBloc() : super(QrCodeInitialState()) {
    on<QrCodeInitializeEvent>(_onInitialize);
    on<QrCodePauseEvent>(_onPause);
    on<QrCodeResumeEvent>(_onResume);
    on<QrCodeDisposeEvent>(_onDispose);
    on<QrCodeScannedEvent>(_onScanned);
    on<QrCodeNavigateEvent>(_onNavigate);
  }

  void _onInitialize(QrCodeInitializeEvent event, Emitter<QrCodeState> emit) {
    emit(QrCodeScanningState());
  }

  void _onPause(QrCodePauseEvent event, Emitter<QrCodeState> emit) {
    qrCodeController?.pauseCamera();
  }

  void _onResume(QrCodeResumeEvent event, Emitter<QrCodeState> emit) {
    qrCodeController?.resumeCamera();
  }

  void _onDispose(QrCodeDisposeEvent event, Emitter<QrCodeState> emit) {
    qrCodeController?.dispose();
  }

  void _onScanned(QrCodeScannedEvent event, Emitter<QrCodeState> emit) {
    final data = event.scannedData.trim();
    if (data.isNotEmpty) {
      scannedData = data;
      emit(QrCodeScannedState(scannedData: scannedData!));
      add(QrCodeNavigateEvent(scannedData: scannedData!));
    } else {
      emit(QrCodeErrorState(QrCodeNotFound()));
    }
  }

  void _onNavigate(QrCodeNavigateEvent event, Emitter<QrCodeState> emit) {
    if (event.scannedData.isNotEmpty) {
      // Get.off(() => WarrantycodeScreen());
      Get.back(result: WarrantycodeScreen());
    } else {
      emit(QrCodeErrorState(QrCodeNotFound()));
    }
  }

  void setController(QRViewController controllerQrCode) {
    qrCodeController = controllerQrCode;
    controllerQrCode.scannedDataStream.listen((scanData) {
      if (scanData.code != null && scanData.code!.isNotEmpty) {
        add(QrCodeScannedEvent(scannedData: scanData.code!));
      }
    });
  }
}
