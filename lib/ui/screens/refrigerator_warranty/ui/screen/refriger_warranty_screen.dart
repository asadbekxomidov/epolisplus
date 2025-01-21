import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/refrigerator_warranty/bloc/ref_warranty_bloc.dart';

class RefrigerWarrantyScreen extends StatefulWidget {
  @override
  State<RefrigerWarrantyScreen> createState() => _RefrigerWarrantyScreenState();
}

class _RefrigerWarrantyScreenState extends State<RefrigerWarrantyScreen> {
  late Dimens dimens;
  late RefWarrantyBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => RefWarrantyBloc(),
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Stack(
          children: [
            Positioned(
              top: dimens.paddingVerticalItem59,
              child: ui(),
            )
          ],
        ),
      ),
    );
  }

  ui() {
    return BlocConsumer<RefWarrantyBloc, RefWarrantyState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: dimens.screenHeight,
          width: dimens.screenWidth,
          decoration: backgroundPagesDecorations(dimens),
          padding: EdgeInsets.all(
            dimens.paddingHorizontal16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerGreyWidget(),
                ],
              ),
              Gap(dimens.paddingVerticalItem26),
              LeftBackIconBtn(
                appColors: AppColors.greenColorDefault,
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
