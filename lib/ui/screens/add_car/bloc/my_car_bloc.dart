import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_car_event.dart';
part 'my_car_state.dart';

class MyCarBloc extends Bloc<MyCarEvent, MyCarState> {
  MyCarBloc() : super(CarInitialState()) {
    on<AddCarEvent>(onaddCar);
  }

  Future<void> onaddCar(AddCarEvent event, Emitter<MyCarState> emit) async {
    emit(CarLoadingState());

    try {} catch (e) {}
  }
}
