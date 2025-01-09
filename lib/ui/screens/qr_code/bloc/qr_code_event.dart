part of 'qr_code_bloc.dart';

abstract class QrCodeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class QrCodeInitializeEvent extends QrCodeEvent {}

class QrCodePauseEvent extends QrCodeEvent {}

class QrCodeResumeEvent extends QrCodeEvent {}

class QrCodeDisposeEvent extends QrCodeEvent {}

class QrCodeScannedEvent extends QrCodeEvent {
  final String scannedData;

  QrCodeScannedEvent(this.scannedData);

  @override
  List<Object?> get props => [scannedData];
}
