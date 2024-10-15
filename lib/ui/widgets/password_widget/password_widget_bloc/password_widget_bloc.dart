import 'package:flutter_bloc/flutter_bloc.dart';

part 'password_widget_event.dart';
part 'password_widget_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc() : super(PasswordVisible(true)) {
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
  }

  void _onTogglePasswordVisibility(
      TogglePasswordVisibility event, Emitter<PasswordState> emit) {
    final currentState = state as PasswordVisible;
    emit(PasswordVisible(!currentState.isObscure));
  }
}
