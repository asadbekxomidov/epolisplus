part of 'osago_bloc.dart';

abstract class OsagoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OsagoInfoGetEvent extends OsagoEvent {}
