import 'package:epolisplus/ui/screens/osago/bloc/osago_bloc.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OsagoScreen extends StatefulWidget {
  @override
  State<OsagoScreen> createState() => _OsagoScreenState();
}

class _OsagoScreenState extends State<OsagoScreen> {
  late Dimens dimens;
  late OsagoBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return BlocProvider(
      create: (context) => OsagoBloc(),
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
          child: Stack(
            children: [
              ui(),
              BlocBuilder<OsagoBloc, OsagoState>(
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
    return BlocConsumer<OsagoBloc, OsagoState>(
      listener: (context, state) {},
      builder: (context, state) {
        bloc = BlocProvider.of<OsagoBloc>(context);

        return Container(
          height: dimens.screenHeight,
          width: dimens.screenWidth,
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
            vertical: dimens.paddingHeight,
          ),
          decoration: backgroundPagesDecorations(dimens),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerGreyWidget(),
                ],
              ),
              Gap(dimens.paddingVerticalItem26),
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
