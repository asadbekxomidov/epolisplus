import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'travel_event.dart';
part 'travel_state.dart';

class TravelBloc extends Bloc<TravelEvent, TravelState> {
  TravelBloc() : super(SuccessState());
}
