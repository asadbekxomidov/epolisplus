import 'package:flutter_bloc/flutter_bloc.dart';

enum BackgroundState { blue, green, red }

class BackgroundBloc extends Cubit<BackgroundState> {
  BackgroundBloc() : super(BackgroundState.blue);

  void changeBackground(BackgroundState state) {
    emit(state);
  }
}
