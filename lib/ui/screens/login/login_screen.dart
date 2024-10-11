// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:epolisplus/utils/utils_export.dart';
// import 'package:epolisplus/ui/screens/screns_export.dart';
// import 'package:epolisplus/ui/widgets/widgets_export.dart';

// class LoginScreen extends StatefulWidget {
//   final String phoneNumber;

//   LoginScreen({super.key, required this.phoneNumber});

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   late Dimens dimens;
//   late LoginBloc bloc;

//   @override
//   Widget build(BuildContext context) {
//     dimens = Dimens(context);
//     return BlocProvider(
//       create: (context) => LoginBloc()
//         ..add(
//           SetPhoneNumberEvent(widget.phoneNumber),
//         ),
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Stack(
//           children: [
//             backimage(),
//             ui(),
//           ],
//         ),
//       ),
//     );
//   }

//   ui() {
//     return BlocListener<LoginBloc, LoginState>(
//       listener: (context, state) {
//         if (state is LoginErrorState) {
//           showErrorMessageSnackBar(
//             context,
//             state.failure.getErrorMessage(context),
//           );
//         }
//       },
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           bloc = BlocProvider.of<LoginBloc>(context);
//           return SingleChildScrollView(
//             child: Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: dimens.paddingHorizontal,
//               ),
//               child: Column(
//                 children: [
//                   Gap(dimens.paddingVerticalItem137),
//                   Image.asset(
//                     AppImage.appImageLogo,
//                     height: dimens.height32,
//                   ),
//                   Gap(dimens.paddingVerticalItem44),
//                   Text(
//                     AppStrings.loginWelcome,
//                     style: dimens.titleStyle.copyWith(
//                       fontSize: dimens.font30,
//                     ),
//                   ),
//                   Gap(dimens.paddingVerticalItem7),
//                   Text(
//                     AppStrings.loginEnter,
//                     style: dimens.textStyle,
//                   ),
//                   Gap(dimens.paddingVerticalItem32),
//                   PhoneWidget(
//                     controller: bloc.phoneController,
//                   ),
//                   Gap(dimens.paddingVerticalItem16),
//                   PasswordWidget(
//                     text: AppStrings.passwordHintP,
//                     controller: bloc.passwordController,
//                     hintText: AppStrings.passwordHint,
//                   ),
//                   Gap(dimens.paddingVerticalItem16),
//                   ResetPasswordButton(
//                     onClick: () {},
//                     text: AppStrings.forgotPassword,
//                   ),
//                   Gap(dimens.paddingVerticalItem16),
//                   RightIconBtn(
//                     onClick: () {
//                       bloc.add(CheckLoginEvent());
//                     },
//                     text: AppStrings.loginButton,
//                   ),
//                   Gap(dimens.paddingVerticalItem16),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';

class LoginScreen extends StatefulWidget {
  final String phoneNumber;

  LoginScreen({super.key, required this.phoneNumber});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Dimens dimens;
  late LoginBloc bloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return BlocProvider(
      create: (context) => LoginBloc()
        ..add(
          SetPhoneNumberEvent(widget.phoneNumber),
        ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: mainDecorations(),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginErrorState) {
                showErrorMessageSnackBar(
                  context,
                  state.failure.getErrorMessage(context),
                );
              }
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                bloc = BlocProvider.of<LoginBloc>(context);
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: dimens.paddingHorizontal,
                    ),
                    child: Column(
                      children: [
                        Gap(dimens.paddingVerticalItem137),
                        Image.asset(
                          AppImage.appImageLogo,
                          height: dimens.height32,
                        ),
                        Gap(dimens.paddingVerticalItem44),
                        Text(
                          AppStrings.loginWelcome,
                          style: dimens.titleStyle.copyWith(
                            fontSize: dimens.font30,
                          ),
                        ),
                        Gap(dimens.paddingVerticalItem7),
                        Text(
                          AppStrings.loginEnter,
                          style: dimens.textStyle,
                        ),
                        Gap(dimens.paddingVerticalItem32),
                        PhoneWidget(
                          controller: bloc.phoneController,
                          isActive: false,
                        ),
                        Gap(dimens.paddingVerticalItem16),
                        PasswordWidget(
                          text: AppStrings.passwordHintP,
                          controller: bloc.passwordController,
                          hintText: AppStrings.passwordHint,
                        ),
                        Gap(dimens.paddingVerticalItem16),
                        ResetPasswordButton(
                          onClick: () {},
                          text: AppStrings.forgotPassword,
                        ),
                        Gap(dimens.paddingVerticalItem16),
                        RightIconBtn(
                          onClick: () {
                            bloc.add(CheckLoginEvent());
                          },
                          text: AppStrings.loginButton,
                        ),
                        Gap(dimens.paddingVerticalItem16),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
