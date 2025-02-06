import 'package:epolisplus/ui/screens/casko/bloc/casko_bloc.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CaskoScreen extends StatefulWidget {
  @override
  State<CaskoScreen> createState() => _CaskoScreenState();
}

class _CaskoScreenState extends State<CaskoScreen> {
  late Dimens dimens;
  late CaskoBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => CaskoBloc(),
      child: Scaffold(
        body: GreenImageBackground(
          child: SafeArea(
            child: Stack(
              children: [
                ui(),
                BlocBuilder<CaskoBloc, CaskoState>(
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
      ),
    );
  }

  ui() {
    return BlocConsumer<CaskoBloc, CaskoState>(
      listener: (context, state) {},
      builder: (context, state) {
        bloc = BlocProvider.of<CaskoBloc>(context);
        return Container(
          height: dimens.screenHeight,
          width: dimens.screenWidth,
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
            vertical: dimens.paddingHeight,
          ),
          child: Column(
            children: [
              Gap(dimens.paddingVerticalItem10),
              NaviGatePopButton(
                onClick: () {
                  Get.back();
                },
                appColors: AppColors.whiteColor,
              ),
              Gap(dimens.paddingVerticalItem8),
              Text(
                AppStrings.caskoinsurancePrograms,
                style: dimens.font30Whitew600Sty,
              ),
            ],
          ),
        );
      },
    );
  }
}
