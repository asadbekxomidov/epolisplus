import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'qr_code_event.dart';
part 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QRViewController? controller;

  QrCodeBloc() : super(QrCodeInitialState()) {
    on<QrCodeInitializeEvent>(_onInitialize);
    on<QrCodePauseEvent>(_onPause);
    on<QrCodeResumeEvent>(_onResume);
    on<QrCodeDisposeEvent>(_onDispose);
    on<QrCodeScannedEvent>(_onScanned);
  }

  void _onInitialize(QrCodeInitializeEvent event, Emitter<QrCodeState> emit) {
    emit(QrCodeScanningState());
  }

  void _onPause(QrCodePauseEvent event, Emitter<QrCodeState> emit) {
    controller?.pauseCamera();
  }

  void _onResume(QrCodeResumeEvent event, Emitter<QrCodeState> emit) {
    controller?.resumeCamera();
  }

  void _onDispose(QrCodeDisposeEvent event, Emitter<QrCodeState> emit) {
    controller?.dispose();
  }

  void _onScanned(QrCodeScannedEvent event, Emitter<QrCodeState> emit) {
    emit(QrCodeScannedSuccessState(event.scannedData));
  }

  void setController(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      add(QrCodeScannedEvent(scanData.code ?? ''));
    });
  }
}
