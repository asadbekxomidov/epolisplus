// ignore_for_file: override_on_non_overriding_member

// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'auth_event.dart';
// part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc() : super(AuthInitial());

//   @override
//   Stream<AuthState> mapEventToState(AuthEvent event) async* {
//     if (event is PhoneNumberChangedEvent) {
//       final phoneNumber = event.phoneNumber;
//       if (isValidPhoneNumber(phoneNumber)) {
//         yield PhoneNumberValidated(phoneNumber);
//       } else {
//         yield AuthFailure('Phone number is invalid');
//       }
//     } else if (event is LoginEvent) {
//       yield AuthLoading();
//       try {
//         // Simulate login process
//         await Future.delayed(Duration(seconds: 2));
//         yield AuthSuccess(event.phone, event.password);
//       } catch (e) {
//         yield AuthFailure('Login error occurred');
//       }
//     }
//   }

//   bool isValidPhoneNumber(String phoneNumber) {
//     // Implement your phone number validation logic here
//     // This example assumes valid phone numbers are exactly 13 characters long (including '+998')
//     return phoneNumber.length == 13 && phoneNumber.startsWith('+998');
//   }
// }

// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(PhoneNumberValidated('')) {
    on<PhoneNumberChangedEvent>((event, emit) {
      final phoneNumber = event.phoneNumber;

      if (isValidPhoneNumber(phoneNumber)) {
        emit(PhoneNumberValidated(phoneNumber));
      } else {
        emit(AuthFailure('Invalid phone number'));
      }
    });
  }

  bool isValidPhoneNumber(String phoneNumber) {
    return phoneNumber.length == 14;
  }
}
