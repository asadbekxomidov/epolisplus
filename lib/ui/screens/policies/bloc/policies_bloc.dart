import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/constanta.dart';
import 'package:epolisplus/models/models_export.dart';

part 'policies_event.dart';
part 'policies_state.dart';

class PoliciesBloc extends Bloc<PoliciesEvent, PoliciesState> {
  var policyCategoryId = IConstanta.CATEGORY_ACTIVE;

  var listAll = <MyPolicyModel>[];
  var listActive = <MyPolicyModel>[];
  var listPayload = <MyPolicyModel>[];
  var listArchive = <MyPolicyModel>[];
  PoliciesBloc() : super(PoliciesInitialState()) {
    on<SelectPolicyCategoryEvent>((event, emit) {
      policyCategoryId = event.categoryId;
      emit(PoliciesCategoryChangedState(policyCategoryId));
    });
  }

  // Future<void> selectPolicy(
  //     SelectPolicyCategoryEvent event, Emitter<PoliciesState> emit) async {
  //   policyCategoryId = event.categoryId;
  //   emit(PoliciesCategoryChangedState(policyCategoryId));
  // }
}
