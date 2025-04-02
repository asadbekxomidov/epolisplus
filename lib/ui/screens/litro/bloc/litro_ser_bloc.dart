import 'dart:async';
import 'package:get/get.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/screens/litro/listener/litro_item_listener.dart';
import 'package:epolisplus/repository/servises/litro/litro_service_repository.dart';

part 'litro_ser_event.dart';
part 'litro_ser_state.dart';

class LitroBloc extends Bloc<LitroEvent, LitroState>
    implements OnLitroItemListener {
  LitroBloc() : super(SuccessState()) {
    on<LitroServiceGetEvent>(getLitroSer);
    on<LitroCallServiceGetEvent>(getLitroCallSer);
    on<SelectLitroCategoryEvent>(selectLitroSer);
    on<SelectServiceEvent>(selectService);
  }

  bool selectLitro = false;
  bool isSelectSer = false;
  List<LitroRiskLst> listService = [];
  var litroServise = LitroResponse(risk: []);
  var callService = LitroCallService(risk: []);
  var riskLst = LitroRiskLst();

  bool get isShowSale {
    return litroServise.discount_title != "";
  }

  @override
  void onTapItemInfo(LitroRiskLst model, int index, bool isExpress,
      {bool isBuy = false}) {}

  @override
  void onTapLitroInfo(LitroRiskLst model, int index) {}

  Future<void> getLitroSer(
      LitroServiceGetEvent event, Emitter<LitroState> emit) async {
    emit(LoadingState());

    try {
      final repository = LitroRepository();
      final response = await repository.litroServise();
      emit(SuccessState());

      if (response.status == 200) {
        litroServise = response.response;
        listService = litroServise.risk;
        emit(SuccessState());
      } else if (response.status == 401) {
        final lStorage = SharedPreferencesManager();
        await lStorage.clearUserInfo();
        Get.offAll(() => CheckAuthScreen());
        emit(SuccessState());
      } else {
        emit(ErrorState(ServerFailure(message: response.message!)));
      }
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState(ServerFailure(message: e.toString())));
    }
  }

  Future<void> getLitroCallSer(
      LitroCallServiceGetEvent event, Emitter<LitroState> emit) async {
    emit(LoadingState());

    try {
      final repository = LitroRepository();
      final response = await repository.litroCallService();
      emit(SuccessState());

      if (response.status == 200) {
        callService = response.response;
        listService = callService.risk;
        emit(SuccessState());
      } else if (response.status == 401) {
        final lStorage = SharedPreferencesManager();
        await lStorage.clearUserInfo();
        Get.offAll(() => CheckAuthScreen());
        emit(SuccessState());
      } else {
        emit(ErrorState(ServerFailure(message: response.message!)));
      }
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState(ServerFailure(message: e.toString())));
    }
  }

  Future<void> selectLitroSer(
      SelectLitroCategoryEvent event, Emitter<LitroState> emit) async {
    emit(LoadedState());
    selectLitro = !selectLitro;
    emit(SuccessState());
  }

  void onSelectItem(int index) {
    print("OLD LIST: ${listService.map((e) => e.isSelect).toList()}");

    listService = listService.asMap().entries.map((entry) {
      final i = entry.key;
      final model = entry.value;
      return model.copyWith(isSelect: i == index);
    }).toList();

    print("NEW LIST: ${listService.map((e) => e.isSelect).toList()}");

    // emit(BuilderState(models: List.from(listService)));
  }

  Future<void> selectService(
      SelectServiceEvent event, Emitter<LitroState> emit) async {
    emit(LoadingState());
    isSelectSer = !isSelectSer;
    print('ISSELECTISSELECTISSELECTISSELECTISSELECT${isSelectSer}');
    riskLst = event.model;
    emit(SuccessState());
  }
}
