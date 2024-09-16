import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(PhoneNumberValidatedState('')) {
    on<PhoneNumberChangedEvent>((event, emit) {
      final phoneNumber = event.phoneNumber;

      if (isValidPhoneNumber(phoneNumber)) {
        emit(PhoneNumberValidatedState(phoneNumber));
      } else {
        emit(AuthFailureState('Invalid phone number'));
      }
    });
  }

  bool isValidPhoneNumber(String phoneNumber) {
    return phoneNumber.length == 14;
  }
}
