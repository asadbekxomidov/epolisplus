import 'package:get/get.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/utils/errors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/sharedPreferencesManager.dart';
import 'package:epolisplus/repository/servises/notification/notification_repository.dart';

part 'notification_state.dart';
part 'notification_event.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  late List<NotificationResponse> data = [];

   bool get isHaveNotificationInfoName {
    bool hasEmptyName = data.any((item) => item.id != -1);
    print('WWWWWWWWWWWWWWWWWWWWWWWWw $hasEmptyName');
    return hasEmptyName;
  }

  NotificationBloc() : super(SuccesState()) {
    on<GetNotificationEvent>(getNotification);
  }

  Future<void> getNotification(
      GetNotificationEvent event, Emitter<NotificationState> emit) async {
    emit(LoadingState());

    try {
      final repository = NotificationRepository();
      var response = await repository.getNotification();

      if (response.status == 200) {
        data = response.response!;
        emit(SuccesState());
      } else if (response.status == 401) {
        final storage = SharedPreferencesManager();
        await storage.clearUserInfo();
        Get.offAll(() => CheckAuthScreen());
      } else {
        emit(ErrorState(failure: ServerFailure(message: response.message!)));
      }
    } catch (e) {
      emit(ErrorState(failure: ServerFailure(message: '')));
    }
  }
}
