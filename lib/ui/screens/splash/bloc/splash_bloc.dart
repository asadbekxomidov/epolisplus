// import 'package:epolisplus/repository/auth/auth_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SharedPreferencesManager _prefsManager = SharedPreferencesManager();

  SplashBloc() : super(SplashInitial()) {
    on<CheckTokenEvent>(_checkToken);
    on<CheckConnectionEvent>(_checkConnection);
  }

  Future<void> _checkToken(
      CheckTokenEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoadingState());

    // Get.off(() => CheckAuthScreen());
    final token = await _prefsManager.getToken();
    // final phone = await _prefsManager.getPhone();
    // final password = await _prefsManager.getPassword();

    // final authRepository = AuthRepository();
    // final baseResponse = await authRepository.login(phone!, password!);

    // if (baseResponse.status == 401) {
    //   await _prefsManager.clearToken();
    //   await _prefsManager.clearPassword();
    //   await _prefsManager.clearPhone();
    // Get.off(() => CheckAuthScreen());
    // emit(SplashAuthRequiredState());
    // } else if (token != null && token.isNotEmpty) {
    //   Get.off(() => HomeScreen());
    //   emit(SplashSuccessState());
    // }
    if (token != null && token.isNotEmpty) {
      // print('${token} SplashSplashSplashSplashSplash');
      await Future.delayed(Duration(seconds: 2));
      Get.off(() => BottomWidget());
      emit(SplashSuccessState());
    } else {
      await Future.delayed(Duration(seconds: 2));
      Get.off(() => CheckAuthScreen());
      emit(SplashAuthRequiredState());
    }
  }

  Future<void> _checkConnection(
      CheckConnectionEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoadingState());

    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult != ConnectivityResult.none) {
      emit(SplashInternetAvailableState());
    } else {
      emit(SplashNoInternetState());
    }
  }
}
