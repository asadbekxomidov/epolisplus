import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/services/api_constanta.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/casko/product_bloc/bloc.dart';

class CaskoProductScreen extends StatelessWidget {
  CaskoResponse caskoInfo;

  CaskoProductScreen({
    required this.caskoInfo,
  });

  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => ProductBloc(),
      child: SafeArea(
        child: Stack(
          children: [
            ui(),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return LoadingIndicator2(
                  isLoading: state is LoadingState,
                );
              },
            )
          ],
        ),
      ),
    );
  }

  ui() {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ErrorState) {}
        return Container(
          width: dimens.screenWidth,
          height: dimens.screenHeight,
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
          ),
          decoration: backgroundPagesDecorations(dimens),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(dimens.paddingVerticalItem10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContainerGreyWidget(),
                  ],
                ),
                Gap(dimens.paddingVerticalItem26),
                NaviGatePopButton(
                  appColors: AppColors.mainColor,
                  onClick: () {
                    Get.back();
                  },
                ),
                Gap(dimens.paddingVerticalItem12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.network(
                      '${ApiConstanta.BASE_URL_EPOLIS_PLUS}${caskoInfo.icon}',
                      height: dimens.height40,
                    ),
                    Gap(dimens.paddingHorizontal8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.rateText,
                          style: dimens.font14Greyw400Sty,
                        ),
                        Gap(dimens.paddingVerticalItem4),
                        Text(
                          caskoInfo.name!,
                          style: dimens.font16Blackw600Sty,
                        ),
                      ],
                    ),
                  ],
                ),
                dashed_line(dimens),
                Text(
                  AppStrings.totalreimLimit,
                  style: dimens.font14Greyw400Sty,
                ),
                Gap(dimens.paddingVerticalItem2),
                Text(
                  caskoInfo.total_price.toString(),
                  style: dimens.font24Redw600Sty,
                ),
                dashed_line(dimens),
                Text(
                  AppStrings.insuranceCoverage,
                  style: dimens.font14Greyw400Sty,
                ),
                Gap(dimens.paddingVerticalItem16),
                typeList(
                  caskoInfo.type
                      .expand((typeProduct) =>
                          typeProduct.list.map((e) => CaskoListProduct(
                                name: e.name,
                                info: e.info,
                                description: e.description,
                                icon_svg: e.icon_svg,
                              )))
                      .toList(),
                  dimens,
                ),
                dashed_line(dimens),
                Gap(dimens.paddingVerticalItem12),
                Text(
                  AppStrings.paymentAmount,
                  style: dimens.font14Greyw400Sty,
                ),
                Gap(dimens.paddingVerticalItem4),
                MyRowImageWidget(
                  text: '${caskoInfo.bonus_price}',
                  image: AppImage.amoutCoinIcon,
                ),
                Gap(dimens.paddingVerticalItem16),
                CustomButton(
                  text: AppStrings.applyforPolicy,
                  isCheck: true,
                ),
                Gap(dimens.paddingVerticalItem8),
                CustomButton2(
                  text: AppStrings.insuranceConditions,
                  isCheck: false,
                ),
                Gap(dimens.paddingVerticalItem10),
              ],
            ),
          ),
        );
      },
    );
  }

  typeList(List<CaskoListProduct> productList, Dimens dimens) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: productList.map(
        (product) {
          return Column(
            children: [
              Row(
                children: [
                  SvgPicture.network(
                    '${ApiConstanta.BASE_URL_EPOLIS_PLUS}${product.icon_svg}',
                    height: dimens.height20,
                  ),
                  Gap(dimens.paddingHorizontal8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name!,
                        style: dimens.font16Blackw600Sty,
                      ),
                    ],
                  ),
                ],
              ),
              Gap(dimens.paddingVerticalItem4),
              Text(
                product.info!,
                style: dimens.font16Blackw400StyNeE,
              ),
              Gap(dimens.paddingVerticalItem16),
            ],
          );
        },
      ).toList(),
    );
  }
}
