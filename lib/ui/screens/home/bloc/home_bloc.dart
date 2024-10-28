import 'package:get/get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SharedPreferencesManager _prefsManager = SharedPreferencesManager();

  HomeBloc() : super(HomeInitialState()) {
    on<LogoutEvent>(_handleLogout);
  }

  Future<void> _handleLogout(LogoutEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    try {
      await _prefsManager.clearToken();
      Get.offAll(() => CheckAuthScreen());
      emit(LogoutSuccessState());
    } catch (e) {
      emit(HomeErrorState('Logout failed: $e'));
    }
  }
}
