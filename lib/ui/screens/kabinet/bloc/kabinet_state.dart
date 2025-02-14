part of 'kabinet_bloc.dart';

abstract class KabinetState extends Equatable {
  @override
  List<Object?> get props => [];
}

class KabinetInitialState extends KabinetState {}

class KabinetLoadingState extends KabinetState {}

class KabinetInformationGetState extends KabinetState {
  final ProfilResponse profilResponse;

  KabinetInformationGetState({required this.profilResponse});

  @override
  List<Object?> get props => [profilResponse];
}

class KabinetErrorState extends KabinetState {
  Failure failure;

  KabinetErrorState(this.failure);
}

class KabinetSuccesState extends KabinetState {}
