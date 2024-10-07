part of 'verification_bloc.dart';

abstract class VerificationState extends Equatable {
  @override
  List<Object?> get props => [];
}

// class PhoneNumberValidatedState extends VerificationState {
//   final String phoneNumber;

//   PhoneNumberValidatedState(this.phoneNumber);

//   @override
//   List<Object?> get props => [phoneNumber];
// }

class VerificationSuccessState extends VerificationState {}

class VerificationLoadingState extends VerificationState {}

class VerificationErrorState extends VerificationState {
  Failure failure;

  VerificationErrorState(this.failure);
}
