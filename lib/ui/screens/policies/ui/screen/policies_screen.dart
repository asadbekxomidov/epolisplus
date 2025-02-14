import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/resource.dart';
import 'package:epolisplus/utils/constanta.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/policies/bloc/policies_bloc.dart';
import 'package:epolisplus/ui/widgets/background/widget/background_widget.dart';

class PoliciesScreen extends StatefulWidget {
  @override
  State<PoliciesScreen> createState() => _PoliciesScreenState();
}

class _PoliciesScreenState extends State<PoliciesScreen> {
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => PoliciesBloc(),
      child: BlocBuilder<PoliciesBloc, PoliciesState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<PoliciesBloc>(context);

          // Gradientni dinamik tarzda tanlash
          Widget background = green_gradient_widget(dimens);
          if (state is PoliciesCategoryChangedState) {
            background = state.categoryId == IConstanta.CATEGORY_ACTIVE
                ? green_gradient_widget(dimens)
                : state.categoryId == IConstanta.CATEGORY_UNPAID
                    ? blue_gradient_widget(dimens)
                    : black_gradient_widget(dimens);
          }

          return Scaffold(
            body: Stack(
              children: [
                background,
                ui(context, bloc),
                loading(),
              ],
            ),
          );
        },
      ),
    );
  }

  loading() {
    return BlocBuilder<PoliciesBloc, PoliciesState>(
      builder: (context, state) {
        return LoadingIndicator2(
          isLoading: state is PoliciesLoadingState,
        );
      },
    );
  }

  ui(BuildContext context, PoliciesBloc bloc) {
    return SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: dimens.paddingWidth,
              ),
              child: Text(
                AppStrings.myPolicies,
                style: dimens.font30Whitew600Sty,
              ),
            ),
            Gap(dimens.paddingHeight),
            select_policy(bloc),
          ],
        ),
      ),
    );
  }

  select_policy(PoliciesBloc bloc) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(dimens.paddingWidth),
          policy_item(
              bloc,
              IConstanta.CATEGORY_ACTIVE,
              Resource.NEW_POLICY_CATEGORY_ACTIVE,
              'Active',
              AppColors.green_color),
          Gap(dimens.paddingWidth),
          policy_item(
              bloc,
              IConstanta.CATEGORY_UNPAID,
              Resource.NEW_POLICY_CATEGORY_UNPAID,
              'On Clearance',
              AppColors.blue_top_color),
          Gap(dimens.paddingWidth),
          policy_item(
              bloc,
              IConstanta.CATEGORY_ARCHIVE,
              Resource.NEW_POLICY_CATEGORY_ARCHIVE,
              'Archive',
              AppColors.black_top_color),
          Gap(dimens.paddingWidth),
        ],
      ),
    );
  }

  policy_item(PoliciesBloc bloc, int categoryId, String icon, String label,
      Color activeColor) {
    final isSelected = bloc.policyCategoryId == categoryId;

    return GestureDetector(
      onTap: () => bloc.add(SelectPolicyCategoryEvent(categoryId)),
      child: Container(
        decoration: isSelected
            ? policy_category_select_decoration(dimens)
            : policy_category_not_select_decoration(
                dimens, bloc.policyCategoryId),
        padding: EdgeInsets.symmetric(
          horizontal: dimens.paddingWidth,
          vertical: dimens.height10,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              // color: Colors.black,
              color: isSelected ? activeColor : AppColors.white,
            ),
            Gap(dimens.width20),
            Text(
              label,
              style: dimens.textStyle.copyWith(
                fontWeight: FontWeight.w700,
                color: isSelected ? AppColors.text_color : AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
