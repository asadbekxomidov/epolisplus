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
        body: BlocConsumer<OsagoBloc, OsagoState>(
          listener: (context, state) {},
          builder: (context, state) {
            bloc = BlocProvider.of<OsagoBloc>(context);

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
