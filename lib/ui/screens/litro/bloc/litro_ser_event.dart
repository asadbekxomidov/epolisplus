part of 'litro_ser_bloc.dart';

abstract class LitroEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LitroServiceGetEvent extends LitroEvent {}

class LitroCallServiceGetEvent extends LitroEvent {}

class SelectLitroCategoryEvent extends LitroEvent {}

class SelectServiceEvent extends LitroEvent {
  LitroRiskLst model;

  SelectServiceEvent(this.model);
}
