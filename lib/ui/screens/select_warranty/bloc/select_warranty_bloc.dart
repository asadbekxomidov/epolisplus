import 'package:get/get.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/sharedPreferencesManager.dart';
import 'package:epolisplus/repository/warranty_code/warranty_code_repository.dart';

part 'select_warranty_event.dart';
part 'select_warranty_state.dart';

class SelectWarrantyBloc
    extends Bloc<SelectWarrantyEvent, SelectWarrantyState> {
  List<WarrantycodeResponse> baseResponse = [];

  SelectWarrantyBloc() : super(SuccessState()) {
    on<GetWarrantyEvent>(getWarranty);
    on<OpenWarrantyCodeEvent>(openWarrantyCode);
  }

  Future<void> getWarranty(
      GetWarrantyEvent event, Emitter<SelectWarrantyState> emit) async {
    emit(LoadingState());

    try {
      final repository = WarrantyCodeRepository();
      var response = await repository.warrantyCodeGet();

      if (response.status == 200) {
        baseResponse = response.response!;
        emit(SuccessState());
      } else if (response.status == 401) {
        final preferense = SharedPreferencesManager();
        await preferense.clearUserInfo();
        Get.offAll(() => CheckAuthScreen());
        emit(SuccessState());
      } else {
        emit(ErrorState());
      }
    } catch (e) {
      emit(ErrorState());
    }
  }

  Future<void> openWarrantyCode(
      OpenWarrantyCodeEvent event, Emitter<SelectWarrantyState> emit) async {
    Get.to(() => WarrantycodeScreen(response: event.response));
    emit(SuccessState());
  }
}
