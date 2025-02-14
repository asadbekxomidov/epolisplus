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
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
          child: Stack(
            children: [
              // backImage2(dimens),
              ui(),
              // backImage2(dimens),
              BlocBuilder<TravelBloc, TravelState>(
                builder: (context, state) {
                  return LoadingIndicator2(
                    isLoading: state is LoadingState,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  ui() {
    return BlocConsumer<TravelBloc, TravelState>(
      listener: (context, state) {},
      builder: (context, state) {
        bloc = BlocProvider.of<TravelBloc>(context);

        return Container(
          height: dimens.screenHeight,
          width: dimens.screenWidth,
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
            vertical: dimens.paddingHeight,
          ),
          // decoration: pagesDeco(dimens),
          decoration: backgroundPagesDecorations(dimens),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerGreyWidget(),
                ],
              ),
              Gap(dimens.paddingVerticalItem10),
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
    );
  }
}
