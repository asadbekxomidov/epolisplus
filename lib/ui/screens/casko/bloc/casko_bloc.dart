import 'package:get/get.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/repository/servises/casko/casko_repository.dart';

part 'casko_event.dart';
part 'casko_state.dart';

class CaskoBloc extends Bloc<CaskoEvent, CaskoState> {
  late List<CaskoResponse> caskoInfo = [];

  bool get isHaveCaskoName {
    bool hasEmptyName = caskoInfo.any((item) => item.id != -1);
    print('WWWWWWWWWWWWWWWWWWWWWWWWw $hasEmptyName');
    return hasEmptyName;
  }

  CaskoBloc() : super(SuccessState()) {
    on<CaskoGetEvent>(getCaskoF);
    on<OpenProductPageEvent>(openPPage);
    on<OpenBuyScreenEvent>(caskoBuy);
  }

  Future<void> getCaskoF(CaskoGetEvent event, Emitter<CaskoState> emit) async {
    emit(LoadingState());

    try {
      final repository = CaskoRepository();
      var response = await repository.getCasko();

      if (response.status == 200) {
        caskoInfo = response.response;
        emit(SuccessState());
      } else if (response.status == 401) {
        final preManager = SharedPreferencesManager();
        await preManager.clearUserInfo();
        Get.offAll(() => CheckAuthScreen());
        emit(SuccessState());
      } else {
        emit(ErrorState(failure: ServerFailure(message: response.message!)));
      }
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState(failure: ServerFailure(message: '$e')));
    }
  }

  Future<void> openPPage(
      OpenProductPageEvent event, Emitter<CaskoState> emit) async {
    Get.to(() => CaskoProductScreen(caskoInfo: event.caskoInfo));
    emit(SuccessState());
  }

  Future<void> caskoBuy(
      OpenBuyScreenEvent event, Emitter<CaskoState> emit) async {
    Get.to(() => CaskoBuyScreen(caskoResponse: event.caskoInfo));
    emit(SuccessState());
  }
}
