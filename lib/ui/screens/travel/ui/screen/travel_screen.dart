import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/travel/bloc/travel_bloc.dart';

class TravelScreen extends StatefulWidget {
  @override
  State<TravelScreen> createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  late Dimens dimens;
  late TravelBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => TravelBloc(),
      child: Scaffold(
        body: BlocConsumer<TravelBloc, TravelState>(
          listener: (context, state) {},
          builder: (context, state) {
            bloc = BlocProvider.of<TravelBloc>(context);

            return Container(
              height: dimens.screenHeight,
              width: dimens.screenWidth,
              padding: EdgeInsets.all(
                dimens.paddingAll18,
              ),
              decoration: whitePagesDecorations(),
              child: Column(
                children: [
                  Gap(dimens.paddingVerticalItem59),
                  NaviGatePopButton(
                    onClick: () {
                      Get.back();
                    },
                    appColors: AppColors.mainColor,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
