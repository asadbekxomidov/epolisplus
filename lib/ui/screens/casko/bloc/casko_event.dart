part of 'casko_bloc.dart';

abstract class CaskoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CaskoGetEvent extends CaskoEvent {}

class OpenCaskoBuyEvent extends CaskoEvent {}

class OpenProductPageEvent extends CaskoEvent {
  CaskoResponse caskoInfo;

  OpenProductPageEvent({
    required this.caskoInfo,
  });
}

class OpenBuyScreenEvent extends CaskoEvent {
  CaskoResponse caskoInfo;

  OpenBuyScreenEvent({
    required this.caskoInfo,
  });
}
