// import 'package:epolisplus/ui/screens/screns_export.dart';
// import 'package:epolisplus/ui/widgets/widgets_export.dart';
// import 'package:epolisplus/utils/utils_export.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';

// class PhoneRasswordScreen extends StatefulWidget {
//   const PhoneRasswordScreen({super.key});

//   @override
//   State<PhoneRasswordScreen> createState() => _PhoneRasswordScreenState();
// }

// class _PhoneRasswordScreenState extends State<PhoneRasswordScreen> {
//   late PhonePasswordBloc bloc;
//   late Dimens dimens;
//   late MyDecorations myDecorations;

//   @override
//   Widget build(BuildContext context) {
//     myDecorations = MyDecorations();
//     dimens = Dimens(context);
//     return Scaffold(
//       body: BlocConsumer<PhonePasswordBloc, PhonePasswordState>(
//         listener: (context, state) {
//           if (state is PhonePasswordErrorState) {
//             showErrorMessageDialog(
//               context,
//               state.failure.getErrorMessage(context),
//             );
//           }
//         },
//         builder: (context, state) {
//           bloc = BlocProvider.of<PhonePasswordBloc>(context);
//           return Container(
//             padding: EdgeInsets.symmetric(horizontal: dimens.width10),
//             decoration: myDecorations.mainDecarations,
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Gap(dimens.height70),
//                   LeftBackIconBtn(),
//                   Gap(dimens.height20),
//                   Text(
//                     AppStrings.verification,
//                     // style: dimens.titleStyle,
//                     style: dimens.titleStyle.copyWith(
//                       fontSize: dimens.font30,
//                     ),
//                   ),
//                   Gap(dimens.height10),
//                   Text(
//                     AppStrings.yourphonenumbernewpassword,
//                     style: dimens.textStyle,
//                   ),
//                   Gap(dimens.height24),
//                   Text(
//                     AppStrings.passwordHintP,
//                     style: dimens.hintStyle,
//                   ),
//                   Gap(dimens.height6),
//                   PasswordTextField(
//                     controller: bloc.passwordController,
//                     hintText: AppStrings.passwordHint,
//                     screenHeight: dimens.screenHeight,
//                     screenWidth: dimens.screenWidth,
//                   ),
//                   Text(
//                     AppStrings.minimumCharacters,
//                     style: dimens.hintStyle,
//                   ),
//                   Gap(dimens.height18),
//                   Text(
//                     AppStrings.confirmPassword,
//                     style: dimens.hintStyle,
//                   ),
//                   Gap(dimens.height6),
//                   PasswordTextField(
//                     controller: bloc.passwordConfirmController,
//                     hintText: AppStrings.passwordHint,
//                     screenHeight: dimens.screenHeight,
//                     screenWidth: dimens.screenWidth,
//                   ),
//                   Gap(dimens.height18),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       PhonecodeTextfieldWidget(controller: bloc.otpController),
//                     ],
//                   ),
//                   Gap(dimens.height16),
//                   SizedBox(
//                     width: double.infinity,
//                     child: RegisterPushButton(
//                       onClick: () {
//                         bloc.add(CheckPhonePasswordEvent());
//                       },
//                       text: AppStrings.verifyAndProceed,
//                     ),
//                   ),
//                   Gap(dimens.height20),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PhoneRasswordScreen extends StatefulWidget {
  const PhoneRasswordScreen({super.key});

  @override
  State<PhoneRasswordScreen> createState() => _PhoneRasswordScreenState();
}

class _PhoneRasswordScreenState extends State<PhoneRasswordScreen> {
  late PhonePasswordBloc bloc;
  late Dimens dimens;

  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final FocusNode otpFocusNode = FocusNode();

  @override
  void dispose() {
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    otpFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return Scaffold(
      body: BlocConsumer<PhonePasswordBloc, PhonePasswordState>(
        listener: (context, state) {
          if (state is PhonePasswordErrorState) {
            showErrorMessageDialog(
              context,
              state.failure.getErrorMessage(context),
            );
          }
        },
        builder: (context, state) {
          bloc = BlocProvider.of<PhonePasswordBloc>(context);
          return Container(
            padding: EdgeInsets.symmetric(horizontal: dimens.width10),
            decoration: mainDecorations(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(dimens.height70),
                  LeftBackIconBtn(),
                  Gap(dimens.height20),
                  Text(
                    AppStrings.verification,
                    style: dimens.titleStyle.copyWith(
                      fontSize: dimens.font30,
                    ),
                  ),
                  Gap(dimens.height10),
                  Text(
                    AppStrings.yourphonenumbernewpassword,
                    style: dimens.textStyle,
                  ),
                  Gap(dimens.height24),
                  Text(
                    AppStrings.passwordHintP,
                    style: dimens.hintStyle,
                  ),
                  Gap(dimens.height6),
                  PasswordWidget(
                    controller: bloc.passwordController,
                    hintText: AppStrings.passwordHint,

                    focusNode: passwordFocusNode,
                  ),
                  Text(
                    AppStrings.minimumCharacters,
                    style: dimens.hintStyle,
                  ),
                  Gap(dimens.height18),
                  Text(
                    AppStrings.confirmPassword,
                    style: dimens.hintStyle,
                  ),
                  Gap(dimens.height6),
                  PasswordWidget(
                    controller: bloc.passwordConfirmController,
                    hintText: AppStrings.passwordHint,
                    focusNode: confirmPasswordFocusNode,
                  ),
                  Gap(dimens.height18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PhonecodeTextfieldWidget(
                        controller: bloc.otpController,
                        // focusNode: otpFocusNode,
                      ),
                    ],
                  ),
                  Gap(dimens.height16),
                  SizedBox(
                    width: double.infinity,
                    child: RegisterPushButton(
                      onClick: () {
                        bloc.add(CheckPhonePasswordEvent());
                      },
                      text: AppStrings.verifyAndProceed,
                    ),
                  ),
                  Gap(dimens.height20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
