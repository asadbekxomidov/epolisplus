part of 'verification_bloc.dart';

abstract class VerificationState extends Equatable {
  @override
  List<Object?> get props => [];
}
class VerificationInitialState extends VerificationState {}

class VerificationSuccessState extends VerificationState {}

class VerificationLoadingState extends VerificationState {}

class VerificationErrorState extends VerificationState {
  Failure failure;

  VerificationErrorState(this.failure);
}
