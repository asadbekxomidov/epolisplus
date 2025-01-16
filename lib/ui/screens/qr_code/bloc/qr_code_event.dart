part of 'qr_code_bloc.dart';

abstract class QrCodeEvent extends Equatable {
  const QrCodeEvent();

  @override
  List<Object?> get props => [];
}

class QrCodeInitializeEvent extends QrCodeEvent {}

class QrCodePauseEvent extends QrCodeEvent {}

class QrCodeResumeEvent extends QrCodeEvent {}

class QrCodeDisposeEvent extends QrCodeEvent {}

class QrCodeScannedEvent extends QrCodeEvent {
  final String scannedData;

  const QrCodeScannedEvent({required this.scannedData});

  @override
  List<Object?> get props => [scannedData];
}

class QrCodeNavigateEvent extends QrCodeEvent {
  final String scannedData;

  const QrCodeNavigateEvent({required this.scannedData});

  @override
  List<Object?> get props => [scannedData];
}
