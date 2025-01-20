import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'casko_event.dart';
part 'casko_state.dart';

class CaskoBloc extends Bloc<CaskoEvent, CaskoState> {
  CaskoBloc() : super(SuccessState());
}
