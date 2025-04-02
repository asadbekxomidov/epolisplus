import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/resource.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/litro/bloc/litro_ser_bloc.dart';
import 'package:epolisplus/ui/screens/litro/widget/item_litro_wid.dart';

class LitroScreen extends StatefulWidget {
  @override
  State<LitroScreen> createState() => _LitroScreenState();
}

class _LitroScreenState extends State<LitroScreen> {
  late Dimens dimens;
  late LitroBloc litroBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => LitroBloc()
        ..add(LitroServiceGetEvent())
        ..add(LitroCallServiceGetEvent()),
      child: Scaffold(
        body: Stack(
          children: [
            green_background(dimens),
            ui(),
            loading(),
          ],
        ),
      ),
    );
  }

  loading() {
    return BlocBuilder<LitroBloc, LitroState>(
      builder: (context, state) {
        return LoadingIndicator2(
          isLoading: state is LoadingState,
        );
      },
    );
  }

  ui() {
    return SafeArea(
      child: BlocConsumer<LitroBloc, LitroState>(
        listener: (context, state) {
          if (state is ErrorState) {
            return showMessage2(
              context,
              state.failure.getErrorMessage(context),
            );
          }
        },
        builder: (context, state) {
          litroBloc = BlocProvider.of<LitroBloc>(context);

          return Container(
            height: dimens.screenHeight,
            width: dimens.screenWidth,
            padding: EdgeInsets.symmetric(
              horizontal: dimens.paddingWidth,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(dimens.paddingVerticalItem10),
                NaviGatePopButton(
                  onClick: () {
                    Get.back();
                  },
                  appColors: AppColors.whiteColor,
                ),
                Gap(dimens.paddingVerticalItem10),
                Text(
                  AppStrings.servicesText2,
                  style: dimens.font30Whitew600Sty,
                ),
                Gap(dimens.paddingVerticalItem10),
                service_select_button(),
                Gap(dimens.paddingVerticalItem10),
                service_scroll(),
              ],
            ),
          );
        },
      ),
    );
  }

  service_select_button() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: GestureDetector(
                onTap: () {
                  print('object1');
                  litroBloc.add(SelectLitroCategoryEvent());
                },
                child: Container(
                  height: dimens.height40,
                  decoration: BoxDecoration(
                    color: litroBloc.selectLitro
                        ? AppColors.transparentColor
                        : AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(
                      litroBloc.selectLitro ? dimens.radius50 : dimens.radius14,
                    ),
                    border: Border.all(color: AppColors.whiteColor),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.annual,
                      style: litroBloc.selectLitro
                          ? dimens.font16Whitew600Sty
                          : dimens.font16Blackw600Sty,
                    ),
                  ),
                ),
              ),
            ),
            Gap(dimens.paddingHorizontal8),
            Expanded(
              flex: 5,
              child: GestureDetector(
                onTap: () {
                  litroBloc.add(SelectLitroCategoryEvent());
                },
                child: Container(
                  height: dimens.height40,
                  decoration: BoxDecoration(
                    color: litroBloc.selectLitro
                        ? AppColors.whiteColor
                        : AppColors.transparentColor,
                    borderRadius: BorderRadius.circular(
                      litroBloc.selectLitro ? dimens.radius16 : dimens.radius50,
                    ),
                    border: Border.all(color: AppColors.whiteColor),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.emergency,
                      style: litroBloc.selectLitro
                          ? dimens.font16Blackw600Sty
                          : dimens.font16Whitew600Sty,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  service_scroll() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            litroBloc.selectLitro
                ? Column(
                    children: [
                      GridView.builder(
                        primary: false,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: dimens.height10,
                          mainAxisSpacing: dimens.height10,
                          mainAxisExtent: dimens.height124 * 2,
                        ),
                        itemCount: litroBloc.callService.risk.length,
                        itemBuilder: (context, index) {
                          LitroRiskLst model =
                              litroBloc.callService.risk[index];
                          return GestureDetector(
                            onTap: () {
                              context.read<LitroBloc>().onSelectItem(index);
                              // litroBloc.onSelectItem(index);
                              print(
                                  'SELECT ON TAP PRINT       ${model.isSelect!} 111111111');
                            },
                            child: ItemLitRoWidget(
                              model: model,
                              index: index,
                              isExpress: true,
                              listener: litroBloc,
                              isVertical: false,
                              isSelect: litroBloc.isSelectSer,
                            ),
                          );
                        },
                      ),
                    ],
                  )
                : Column(
                    children: [
                      litroBloc.isShowSale
                          ? service_sale_widget()
                          : Container(),
                      Gap(dimens.paddingVerticalItem8),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: dimens.height10,
                          mainAxisSpacing: dimens.height10,
                          mainAxisExtent: dimens.height124 * 2,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: litroBloc.litroServise.risk.length,
                        itemBuilder: (context, index) {
                          LitroRiskLst model =
                              litroBloc.litroServise.risk[index];
                          return GestureDetector(
                            onTap: () {
                              context.read<LitroBloc>().onSelectItem(index);
                              // litroBloc.onSelectItem(index);
                              print(
                                  'SELECT ON TAP PRINT      ${model.isSelect!} 2222222');
                            },
                            child: ItemLitRoWidget(
                              model: model,
                              index: index,
                              isExpress: true,
                              listener: litroBloc,
                              isVertical: false,
                              isSelect: model.isSelect!,
                              // isVertical: litroBloc.selectLitro,
                            ),
                          );
                        },
                      ),
                      Gap(dimens.paddingVerticalItem8),
                      buy_service_wid(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  service_sale_widget() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: dimens.paddingWidth,
        vertical: dimens.paddingHeight,
      ),
      decoration: selectServiceDecoration(dimens),
      child: Row(
        children: [
          SvgPicture.asset(Resource.NEW_IC_SALE),
          Gap(dimens.paddingWidth),
          Column(
            children: [
              Text(
                "${litroBloc.litroServise.discount_title}",
                style: dimens.textStyle,
              ),
              Gap(dimens.height10 / 2),
              Text(
                "${litroBloc.litroServise.discount_body}",
                style: dimens.textStyle.copyWith(
                  color: AppColors.red_color,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  buy_service_wid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dashed_line(dimens),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.total,
              style: dimens.font14Black400Sty,
            ),
            Text(
              '${0} сум',
              style: dimens.font14Black400Sty,
            ),
          ],
        ),
        dashed_line(dimens),
        Text(
          AppStrings.totalsubscriptionAmount,
          style: dimens.font14Greyw400Sty,
        ),
        Gap(dimens.paddingVerticalItem4),
        MyRowImageWidget(
          text: '0',
          // text: "${percentAmount.toInt().toString()}",
          image: AppImage.amoutCoinIcon,
        ),
        Gap(dimens.paddingVerticalItem8),
        DynamicBtn(
          isCheck: true,
          onClick: () {},
          text: AppStrings.payText,
        ),
        Gap(dimens.paddingVerticalItem16),
      ],
    );
  }
}
