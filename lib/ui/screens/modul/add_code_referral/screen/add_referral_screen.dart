import 'package:epolisplus/ui/screens/modul/add_code_referral/bloc/add_code_bloc.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AddReferralScreen extends StatelessWidget {
  late Dimens dimens;
  late AddCodeBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => AddCodeBloc(),
      child: Stack(
        children: [
          ui(),
          loading(),
        ],
      ),
    );
  }

  loading() {
    return BlocBuilder<AddCodeBloc, AddCodeState>(
      builder: (context, state) {
        return LoadingIndicator2(
          isLoading: state is LoadingState,
        );
      },
    );
  }

  ui() {
    return BlocConsumer<AddCodeBloc, AddCodeState>(
      listener: (context, state) {
        if (state is ErrorState) {
          return showErrorMessageSnackBar(
            context,
            state.failure.getErrorMessage(context),
          );
        }
      },
      builder: (context, state) {
        bloc = BlocProvider.of<AddCodeBloc>(context);

        return Column(
          children: [
            bloc.isCheck
                ? Container()
                : MyTextIconButton(
                    appColors: AppColors.mainColor,
                    iconData: Icons.add,
                    onClick: () {
                      bloc.add(OpenInputPolEvent());
                    },
                    text: AppStrings.addCodeReferral,
                  ),
            bloc.isCheck
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 5,
                        child: RefCodeTextField(
                          isCheck: bloc.isCheckInput,
                          title: 'add_referral',
                          hintText: 'add_code_referral',
                          controller: bloc.refController,
                        ),
                      ),
                      Gap(dimens.paddingHorizontal8),
                      Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () {
                            bloc.add(GetReferallEvent());
                          },
                          child: CheckTextButton(
                            text: bloc.isCheckInput ? 'otmentit' : 'premit',
                          ),
                        ),
                      )
                    ],
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
