import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'policies_event.dart';
part 'policies_state.dart';

class PoliciesBloc extends Bloc<PoliciesEvent, PoliciesState> {
  PoliciesBloc() : super(PoliciesInitialState()) {}
}
