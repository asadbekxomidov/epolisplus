part of 'kabinet_bloc.dart';

abstract class KabinetEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class KabinetGetEvent extends KabinetEvent {}

class AddMyCarEvent extends KabinetEvent {}

class KabinetPushScreenEvent extends KabinetEvent {
  final String userName;


  KabinetPushScreenEvent(this.userName);
}
