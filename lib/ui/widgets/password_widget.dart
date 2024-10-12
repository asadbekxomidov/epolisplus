// import 'package:epolisplus/utils/utils_export.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// class PasswordWidget extends StatefulWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final String text;
//   final FocusNode? focusNode;

//   const PasswordWidget({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     required this.text,
//     this.focusNode,
//   }) : super(key: key);

//   @override
//   _PasswordWidgetState createState() => _PasswordWidgetState();
// }

// class _PasswordWidgetState extends State<PasswordWidget> {
//   bool _isObscure = true;

//   void _toggleVisibility() {
//     setState(() {
//       _isObscure = !_isObscure;
//     });
//   }

//   late Dimens dimens;

//   @override
//   Widget build(BuildContext context) {
//     dimens = Dimens(context);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           widget.text,
//           style: dimens.textStyleSecondary,
//         ),
//         Gap(dimens.paddingVerticalItem2),
//         TextField(
//           controller: widget.controller,
//           obscureText: _isObscure,
//           decoration: InputDecoration(
//             hintText: widget.hintText,
//             filled: true,
//             fillColor: AppColors.whiteColor,
//             contentPadding: EdgeInsets.only(
//               left: dimens.paddingHorizontal13,
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: AppColors.lineColor),
//               // borderSide: BorderSide(color: Colors.grey.shade300),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: AppColors.lineColor),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             border: OutlineInputBorder(
//               borderSide: BorderSide(color: AppColors.lineColor),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             suffixIcon: IconButton(
//               splashColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//               icon: Icon(
//                 _isObscure ? AppImage.in_visibility : AppImage.visibility,
//                 color: Colors.grey,
//               ),
//               onPressed: _toggleVisibility,
//             ),
//           ),
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w400,
//             fontSize: dimens.screenHeight * 16 / 852,
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:epolisplus/ui/widgets/bloc/password_widget_bloc/password_widget_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PasswordWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String text;
  final FocusNode? focusNode;

  const PasswordWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.text,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens(context);

    return BlocProvider(
      create: (context) => PasswordBloc(),
      child: BlocBuilder<PasswordBloc, PasswordState>(
        builder: (context, state) {
          final passwordBloc = BlocProvider.of<PasswordBloc>(context);
          bool isObscure = (state as PasswordVisible).isObscure;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: dimens.textStyleSecondary,
              ),
              Gap(dimens.paddingVerticalItem2),
              Container(
                padding: EdgeInsets.only(
                  left: dimens.paddingHorizontal13,
                ),
                decoration: inputDecorations(dimens),
                child: TextField(
                  controller: controller,
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    hintText: hintText,
                    // filled: true,
                    // fillColor: AppColors.whiteColor,
                    filled: false,
                    fillColor: AppColors.whiteColor,
                    // hintStyle: dimens.hintStyle.copyWith(
                    //   fontSize: dimens.font16,
                    // ),
                    border: InputBorder.none,
                    // contentPadding: EdgeInsets.only(
                    //   left: dimens.paddingHorizontal13,
                    // ),
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: AppColors.lineColor),
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: AppColors.lineColor),
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                    // border: OutlineInputBorder(
                    //   borderSide: BorderSide(color: AppColors.lineColor),
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                    // border: InputBorder.none,
                    suffixIcon: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: Icon(
                        isObscure
                            ? AppImage.in_visibility
                            : AppImage.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        passwordBloc.add(TogglePasswordVisibility());
                      },
                    ),
                  ),
                  style: dimens.myTextFieldStyle,
                  // style: TextStyle(
                  //   color: Colors.black,
                  //   fontWeight: FontWeight.w400,
                  //   fontSize: dimens.screenHeight * 16 / 852,
                  // ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
