import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/phone_warranty/bloc/phone_warranty_bloc.dart';

class PhoneWarrantyScreen extends StatefulWidget {
  @override
  State<PhoneWarrantyScreen> createState() => _PhoneWarrantyScreenState();
}

class _PhoneWarrantyScreenState extends State<PhoneWarrantyScreen> {
  late Dimens dimens;
  late PhoneWarrantyBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => PhoneWarrantyBloc(),
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Stack(
          children: [
            Positioned(
              top: dimens.paddingVerticalItem59,
              child: ui(),
            ),
          ],
        ),
      ),
    );
  }

  ui() {
    return BlocConsumer<PhoneWarrantyBloc, PhoneWarrantyState>(
      listener: (context, state) {},
      builder: (context, state) {
        bloc = BlocProvider.of<PhoneWarrantyBloc>(context);
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
