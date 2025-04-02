import 'package:bloc/bloc.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

part 'event.dart';
part 'state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  CaskoResponse caskoResponse;
  ProductBloc(this.caskoResponse) : super(SuccessState()) {
    on<OpenCaskoBuyEvent>(caskoBuy);
  }

  Future<void> caskoBuy(
      OpenCaskoBuyEvent event, Emitter<ProductState> emit) async {
    Get.to(() => CaskoBuyScreen(caskoResponse: caskoResponse));
    emit(SuccessState());
  }
}
