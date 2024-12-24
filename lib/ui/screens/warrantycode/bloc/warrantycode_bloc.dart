import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'warrantycode_event.dart';
part 'warrantycode_state.dart';

class WarrantycodeBloc extends Bloc<WarrantycodeEvent, WarrantycodeState> {
  WarrantycodeBloc() : super(WarrantycodeInitialState()) {}
}
