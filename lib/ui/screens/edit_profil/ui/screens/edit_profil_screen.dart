import 'package:epolisplus/ui/screens/edit_profil/bloc/edit_profil_bloc.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

// class EditProfilScreen extends StatefulWidget {
//   final String userName;
//   EditProfilScreen(this.userName);

//   @override
//   State<EditProfilScreen> createState() => _EditProfilScreenState();
// }

// class _EditProfilScreenState extends State<EditProfilScreen> {
//   late Dimens dimens;
//   late EditProfilBloc editProfilBloc;

//   late TextEditingController userNameController;

//   @override
//   void initState() {
//     super.initState();
//     userNameController = TextEditingController(text: widget.userName);
//   }

//   @override
//   void dispose() {
//     userNameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     dimens = Dimens(context);

//     return BlocProvider(
//       create: (context) => EditProfilBloc(),
//       // EditProfilBloc()..add(EditProfilUpdateEvent(widget.userName)),
//       child: BlocConsumer<EditProfilBloc, EditProfilState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           editProfilBloc = BlocProvider.of<EditProfilBloc>(context);

//           return Scaffold(
//             body: Container(
//               height: dimens.screenHeight,
//               decoration: mainDecorations(),
//               padding: EdgeInsets.symmetric(
//                 horizontal: dimens.paddingHorizontal16,
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Gap(dimens.paddingVerticalItem59),
//                     ButtonPagesBtn(
//                       appColors: AppColors.mainColor,
//                       iconData: Icons.close,
//                       text: AppStrings.closeText,
//                     ),
//                     Gap(dimens.paddingVerticalItem8),
//                     Text(
//                       AppStrings.personalInformation,
//                       style: dimens.pagesBlackTitleSty,
//                     ),
//                     PagesTextFieldProfil(
//                       controller: userNameController,
//                       titleText: AppStrings.name,
//                       showStar: true,
//                       screenHeight: dimens.screenHeight,
//                       screenWidth: dimens.screenWidth,
//                     ),
//                     Gap(dimens.paddingVerticalItem16),
//                     PagesPushButton(
//                       isLoading: state is EditProfileLoadingState,
//                       onClick: () {
//                         editProfilBloc
//                             .add(EditProfilUpdateEvent(widget.userName));
//                       },
//                       text: AppStrings.saveChanges,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

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
      child: BlocConsumer<EditProfilBloc, EditProfilState>(
        listener: (context, state) {
          if (state is EditProfileErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('')),
            );
          }
        },
        builder: (context, state) {
          final editProfilBloc = context.read<EditProfilBloc>();

          return Scaffold(
            body: Container(
              height: dimens.screenHeight,
              decoration: mainDecorations(),
              padding: EdgeInsets.symmetric(
                horizontal: dimens.paddingHorizontal16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(dimens.paddingVerticalItem59),
                      ButtonPagesBtn(
                        appColors: AppColors.mainColor,
                        iconData: Icons.close,
                        text: AppStrings.closeText,
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
                      Card(
                        color: AppColors.cardContainerColor,
                        child: Container(
                          height: dimens.height48,
                          width: dimens.screenWidth,
                          decoration: cardContainerDecoration(dimens),
                          child: DeleteAccountButton(
                            image: AppImage.deleteEditIcon,
                            onClick: () {
                              editProfilBloc.add(DeleteAccountEvent());
                            },
                            text: AppStrings.deleteAccountText,
                            dimens: dimens,
                          ),
                        ),
                      ),
                      Gap(dimens.paddingVerticalItem16),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
