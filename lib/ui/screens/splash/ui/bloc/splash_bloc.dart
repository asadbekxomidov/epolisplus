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
  }

  Future<void> _checkToken(
      CheckTokenEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoadingState());

    await Future.delayed(const Duration(seconds: 3));

    final token = await _prefsManager.getToken();

    if (token != null && token.isNotEmpty) {
      Get.offAll(() => HomeScreen());
      emit(SplashSuccessState());
    } else {
      Get.offAll(() => CheckAuthScreen());
      emit(SplashAuthRequiredState());
    }
  }
}
