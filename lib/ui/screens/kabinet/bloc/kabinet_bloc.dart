import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'kabinet_event.dart';
part 'kabinet_state.dart';

class KabinetBloc extends Bloc<KabinetEvent, KabinetState> {
  KabinetBloc() : super(KabinetInitialState()) {}
}
