part of 'user_info_bloc.dart';

abstract class UserInfoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends UserInfoState {}

class LoadedState extends UserInfoState {}

class ErrorState extends UserInfoState {
  Failure failure;

  ErrorState(this.failure);
}

class SuccessState extends UserInfoState {}
