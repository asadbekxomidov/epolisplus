import 'package:bloc/bloc.dart';

class ToggleButtonCubit extends Cubit<bool> {
  ToggleButtonCubit() : super(false);

  void toggle() => emit(!state);
}
