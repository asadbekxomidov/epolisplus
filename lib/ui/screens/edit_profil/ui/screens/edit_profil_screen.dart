import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/edit_profil/bloc/edit_profil_bloc.dart';

class EditProfilScreen extends StatefulWidget {
  final String userName;

  EditProfilScreen(this.userName);

  @override
  State<EditProfilScreen> createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => EditProfilBloc(widget.userName),
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
          child: Stack(
            children: [
              ui(),
              loading(),
            ],
          ),
        ),
      ),
    );
  }

  loading() {
    return BlocBuilder<EditProfilBloc, EditProfilState>(
      builder: (context, state) {
        return LoadingIndicator2(
          isLoading: state is EditProfileLoadingState,
        );
      },
    );
  }

  ui() {
    return BlocConsumer<EditProfilBloc, EditProfilState>(
      listener: (context, state) {
        if (state is EditProfileErrorState) {
          return showErrorMessageSnackBar(
            context,
            state.failure.getErrorMessage(context),
          );
        }
      },
      builder: (context, state) {
        final editProfilBloc = context.read<EditProfilBloc>();

        return Container(
          height: dimens.screenHeight,
          decoration: backgroundPagesDecorations(dimens),
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingWidth,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(dimens.paddingVerticalItem10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContainerGreyWidget(),
                    ],
                  ),
                  Gap(dimens.paddingVerticalItem10),
                  ButtonPagesBtn(
                    appColors: AppColors.mainColor,
                    iconData: Icons.close,
                    text: AppStrings.closeText,
                    onClick: () {
                      Navigator.pop(context);
                    },
                    // onClick: () => Get.back(),
                  ),
                  Gap(dimens.paddingVerticalItem8),
                  Text(
                    AppStrings.personalInformation,
                    style: dimens.pagesBlackTitleSty,
                  ),
                  PagesTextFieldProfil(
                    controller: editProfilBloc.userNameController,
                    titleText: AppStrings.name,
                    showStar: true,
                    screenHeight: dimens.screenHeight,
                    screenWidth: dimens.screenWidth,

                    // on: (value) {
                    //   editProfilBloc.add(EditProfilTextChangedEvent(value));
                    // },
                  ),
                  Gap(dimens.paddingVerticalItem16),
                  PagesPushButton(
                    isLoading: state is EditProfileLoadingState,
                    onClick: () {
                      editProfilBloc.add(EditProfilUpdateEvent());
                    },
                    text: AppStrings.saveChanges,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: dimens.height48,
                    width: dimens.screenWidth,
                    decoration: cardContainerDecoration(dimens),
                    child: DeleteAccountButton(
                      image: AppImage.deleteEditIcon,
                      onClick: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return DeleteAccountShowDialog(
                              onClick: () {
                                editProfilBloc.add(DeleteAccountEvent());
                              },
                            );
                          },
                        );

                        // showDialog(
                        //   context: context,
                        //   barrierDismissible: true,
                        //   builder: (context) {
                        //     return DeleteAccountShowDilog(
                        //       onClick: () {
                        //         editProfilBloc.add(DeleteAccountEvent());
                        //       },
                        //     );
                        //   },
                        // );
                        // editProfilBloc.add(DeleteAccountEvent());
                      },
                      text: AppStrings.deleteAccountText,
                      dimens: dimens,
                    ),
                  ),
                  Gap(dimens.paddingVerticalItem16),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
