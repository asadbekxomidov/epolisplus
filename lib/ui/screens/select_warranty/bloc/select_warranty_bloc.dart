import 'package:get/get.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';

part 'select_warranty_event.dart';
part 'select_warranty_state.dart';

class SelectWarrantyBloc
    extends Bloc<SelectWarrantyEvent, SelectWarrantyState> {
  SelectWarrantyBloc() : super(SuccessState()) {
    on<OpenAvtoSinePageEvent>(openAvtoSine);
    on<OpenPhoneWarrantyEvent>(openPhoneWarranty);
    on<OpenRefrigeratorEvent>(openRefrigeratorWarranty);
  }

  Future<void> openAvtoSine(
      OpenAvtoSinePageEvent event, Emitter<SelectWarrantyState> emit) async {
    emit(LoadedState());
    await Get.to(() => WarrantycodeScreen());
    emit(SuccessState());
  }

  Future<void> openPhoneWarranty(
      OpenPhoneWarrantyEvent event, Emitter<SelectWarrantyState> emit) async {
    emit(LoadedState());
    await Get.to(() => PhoneWarrantyScreen());
    emit(SuccessState());
  }

  Future<void> openRefrigeratorWarranty(
      OpenRefrigeratorEvent event, Emitter<SelectWarrantyState> emit) async {
    emit(LoadedState());
    await Get.to(() => RefrigerWarrantyScreen());
    emit(SuccessState());
  }
}
