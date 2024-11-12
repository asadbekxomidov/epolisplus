import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/showdialog_widget.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'tabbar_event.dart';
part 'tabbar_state.dart';

class TabbarBloc extends Bloc<TabbarEvent, TabbarState> {
  TabbarBloc() : super(const TabbarInitialState(0)) {
    on<TabSelected>((event, emit) {
      emit(TabbarSelectionUpdated(event.index));
    });

    on<TabScreenPushEvent>((event, emit) async {
      await pushScreen(event, emit);
    });
  }

  Future<void> pushScreen(
      TabScreenPushEvent event, Emitter<TabbarState> emit) async {
    switch (event.index) {
      case 0:
        Get.to(() => HomeScreen());
        break;
      case 1:
        Get.to(() => KabinetScreen());
        break;
      case 2:
        showDialog(
          context: Get.context!,
          barrierDismissible: true,
          builder: (context) {
            return ShowdialogWidget();
          },
        );
        break;
      case 3:
        Get.to(() => PoliciesScreen());
        break;
      case 4:
        Get.to(() => PartnersScreen());
        break;
    }
  }
}
