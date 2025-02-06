import 'package:epolisplus/ui/screens/select_warranty/get_w_bloc/getW_bloc.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class GetWCodeScreen extends StatefulWidget {
  final int warrantyId;

  GetWCodeScreen({required this.warrantyId});
  @override
  State<GetWCodeScreen> createState() => _GetWCodeScreenState();
}

class _GetWCodeScreenState extends State<GetWCodeScreen> {
  late Dimens dimens;
  late GetWCodeBloc bloc;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => GetWCodeBloc(),
      child: Scaffold(
        body: GreenImageBackground2(
          child: SafeArea(
            child: Stack(
              children: [
                ui(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ui() {
    return BlocConsumer<GetWCodeBloc, GetWCodeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
            vertical: dimens.paddingHeight,
          ),
          child: Column(
            children: [
              Gap(dimens.paddingVerticalItem10),
              NaviGatePopButton(
                appColors: AppColors.whiteColor255,
                onClick: () {
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
