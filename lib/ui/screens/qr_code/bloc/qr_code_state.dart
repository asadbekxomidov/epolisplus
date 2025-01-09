part of 'qr_code_bloc.dart';

abstract class QrCodeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class QrCodeInitialState extends QrCodeState {}

class QrCodeScanningState extends QrCodeState {}

class QrCodeScannedSuccessState extends QrCodeState {
  final String data;

  QrCodeScannedSuccessState(this.data);

  @override
  List<Object?> get props => [data];
}

class QrCodeErrorState extends QrCodeState {
  final String error;

  QrCodeErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
