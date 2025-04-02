part of 'litro_ser_bloc.dart';

abstract class LitroState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends LitroState {}

class LoadedState extends LitroState {}

class ErrorState extends LitroState {
  Failure failure;

  ErrorState(this.failure);
}

class SuccessState extends LitroState {}

class BuilderState extends LitroState {
  final List<LitroRiskLst> models;

  BuilderState({required this.models});

  @override
  List<Object?> get props => [models]; // UI-ni yangilash uchun

  BuilderState copyWith({List<LitroRiskLst>? models}) {
    return BuilderState(models: models ?? this.models);
  }
}
