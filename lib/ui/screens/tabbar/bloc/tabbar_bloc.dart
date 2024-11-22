import 'package:epolisplus/utils/dialogs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'tabbar_event.dart';
part 'tabbar_state.dart';

class TabbarBloc extends Bloc<TabbarEvent, TabbarState> {
  int currentIndex = 0;

  TabbarBloc() : super(const TabbarInitialState(0)) {
    on<TabSelectedEvent>(onTap);
  }

  onTap(TabSelectedEvent event, Emitter<TabbarState> emit) {
    currentIndex = event.index;
    switch (currentIndex) {
      case 0:
        {
          emit(HomeState2());
          return;
        }
      case 1:
        {
          emit(CabinetState());
          return;
        }
      case 2:
        {
          // SosDilogaScreen
          showDialog(
            context: Get.context!,
            barrierDismissible: true,
            builder: (context) {
              return SosDilogaScreen();
              // return ShowdialogWidget();
            },
          );
          emit(SosState());
          return;
        }
      case 3:
        {
          emit(PolicyState());
          return;
        }
      case 4:
        {
          emit(PartnerState());
          return;
        }
    }
  }
}
