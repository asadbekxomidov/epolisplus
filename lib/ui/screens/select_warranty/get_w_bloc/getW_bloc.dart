import 'package:bloc/bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:equatable/equatable.dart';

part 'getW_event.dart';
part 'getW_state.dart';

class GetWCodeBloc extends Bloc<GetWCodeEvent, GetWCodeState> {
  GetWCodeBloc() : super(SuccessState()) {}
}
