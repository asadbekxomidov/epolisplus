import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_ser_event.dart';
part 'add_ser_state.dart';

class AddSerBloc extends Bloc<AddSerEvent, AddSerState> {
  AddSerBloc() : super(SuccessState()) {
    on<AddiontalServiseGetEvent>(getAddiontalSer);
  }

  Future<void> getAddiontalSer(
      AddiontalServiseGetEvent event, Emitter<AddSerState> emit) async {
    emit(LoadingState());
    try {} catch (e) {
      emit(ErrorState());
    }
  }
}
