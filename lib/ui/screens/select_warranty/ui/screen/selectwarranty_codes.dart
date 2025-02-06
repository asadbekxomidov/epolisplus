import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/select_warranty/bloc/select_warranty_bloc.dart';

class SelectwarrantyCodes extends StatefulWidget {
  @override
  State<SelectwarrantyCodes> createState() => _SelectwarrantyCodesState();
}

class _SelectwarrantyCodesState extends State<SelectwarrantyCodes> {
  late Dimens dimens;
  late SelectWarrantyBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => SelectWarrantyBloc()..add(GetWarrantyEvent()),
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
          child: Stack(
            children: [
              ui(),
              BlocBuilder<SelectWarrantyBloc, SelectWarrantyState>(
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
    return BlocConsumer<SelectWarrantyBloc, SelectWarrantyState>(
      listener: (context, state) {},
      builder: (context, state) {
        bloc = BlocProvider.of<SelectWarrantyBloc>(context);

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
              Gap(dimens.paddingVerticalItem16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          AppStrings.activatewarrantyCode,
                          style: dimens.pagesBlackTitleSty2,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    AppImage.activateWIcon,
                    height: dimens.height40,
                  ),
                ],
              ),
              Gap(dimens.paddingVerticalItem16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: dimens.height100,
                    crossAxisSpacing: dimens.paddingAll12,
                    mainAxisSpacing: dimens.paddingAll12,
                  ),
                  shrinkWrap: true,
                  primary: false,
                  itemCount: bloc.baseResponse.length,
                  itemBuilder: (context, index) {
                    final warranty = bloc.baseResponse[index];

                    return GestureDetector(
                      onTap: () {
                        bloc.add(OpenWarrantyCodeEvent(warranty));
                      },
                      child: Container(
                        height: dimens.height88,
                        width: dimens.width172,
                        padding: EdgeInsets.all(
                          dimens.paddingAll12,
                        ),
                        decoration: mybuttonDeco(
                          dimens,
                          dimens.radius12,
                          AppColors.redColorFill,
                          AppColors.redColorStoke,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            warranty.icon.endsWith('.svg')
                                ? SvgPicture.network(
                                    "${ApiConstanta.BASE_URL_EPOLIS_PLUS}${warranty.icon}",
                                    height: dimens.height20,
                                  )
                                : Image.network(
                                    "${ApiConstanta.BASE_URL_EPOLIS_PLUS}${warranty.icon}",
                                    height: dimens.height20,
                                  ),
                            Text(
                              warranty.name,
                              style: dimens.font16Blackw600Sty,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
