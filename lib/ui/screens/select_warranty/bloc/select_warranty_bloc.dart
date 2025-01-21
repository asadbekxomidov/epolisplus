import 'package:get/get.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';

part 'select_warranty_event.dart';
part 'select_warranty_state.dart';

class SelectWarrantyBloc
    extends Bloc<SelectWarrantyEvent, SelectWarrantyState> {
  SelectWarrantyBloc() : super(SuccessState()) {
    on<OpenWarrantyScreen>(openWarranty);
  }

  Future<void> openWarranty(
      OpenWarrantyScreen event, Emitter<SelectWarrantyState> emit) async {
    emit(LoadedState());
    Get.to(() => WarrantycodeScreen());
    emit(SuccessState());
  }
}
