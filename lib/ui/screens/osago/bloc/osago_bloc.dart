import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'osago_event.dart';
part 'osago_state.dart';

class OsagoBloc extends Bloc<OsagoEvent, OsagoState> {
  OsagoBloc() : super(SuccessState()) {}
}
