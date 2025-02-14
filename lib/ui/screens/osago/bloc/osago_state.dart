part of 'osago_bloc.dart';

@immutable
abstract class OsagoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends OsagoState {}

class LoadedState extends OsagoState {}

class ErrorState extends OsagoState {}

class SuccessState extends OsagoState {}
