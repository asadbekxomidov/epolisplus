import 'package:epolisplus/ui/widgets/password_widget/password_widget_bloc/password_widget_bloc.dart';
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
                decoration: newInputDecoration(
                  dimens,
                  isActive: true,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        obscureText: isObscure,
                        decoration: InputDecoration(
                          hintText: hintText,
                          hintStyle: dimens.hintStyle,
                          filled: false,
                          fillColor: AppColors.whiteColor,
                          border: InputBorder.none,
                          // suffixIcon:
                        ),
                        style: dimens.myTextFieldStyle,
                      ),
                    ),
                    IconButton(
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
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
