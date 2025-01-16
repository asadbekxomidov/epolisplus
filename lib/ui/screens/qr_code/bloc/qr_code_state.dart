part of 'qr_code_bloc.dart';

abstract class QrCodeState extends Equatable {
  const QrCodeState();

  @override
  List<Object?> get props => [];
}

class QrCodeInitialState extends QrCodeState {}

class QrCodeScanningState extends QrCodeState {}

class QrCodeScannedState extends QrCodeState {
  final String scannedData;

  const QrCodeScannedState({required this.scannedData});

  @override
  List<Object?> get props => [scannedData];
}

class QrCodeNavigatedState extends QrCodeState {
  final String scannedData;

  const QrCodeNavigatedState({required this.scannedData});

  @override
  List<Object?> get props => [scannedData];
}

class QrCodePausedState extends QrCodeState {}

class QrCodeResumedState extends QrCodeState {}

class QrCodeDisposedState extends QrCodeState {}

class QrCodeErrorState extends QrCodeState {
  Failure failure;

  QrCodeErrorState(this.failure);
}
