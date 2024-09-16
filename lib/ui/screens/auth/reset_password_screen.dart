import 'package:epolisplus/bloc/auth/auth_bloc.dart';
import 'package:epolisplus/ui/widgets/phone_textfield_filter.dart';
import 'package:epolisplus/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is PhoneNumberValidatedState) {
            Navigator.pushNamed(context, '/phone-reset-password');
          } else if (state is AuthFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.022),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.07),
              TextButton.icon(
                  style:
                      IconButton.styleFrom(highlightColor: Colors.transparent),
                  icon: Icon(
                    Icons.arrow_circle_left_outlined,
                    color: Color(0xFF00A070),
                    size: screenHeight * 0.028,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: Text(
                    AppStrings.back,
                    style: TextStyle(
                      fontSize: screenHeight * 0.018,
                      color: Color(0xFF00A070),
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              SizedBox(height: screenHeight * 0.01),
              Text(
                AppStrings.resetPassword,
                style: TextStyle(
                    fontSize: screenHeight * 0.036,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight * 0.013),
              Text(
                AppStrings.phoneNumberCode,
                style: TextStyle(
                    fontSize: screenHeight * 0.018, color: Colors.black),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.phoneNumberHint,
                    style: TextStyle(
                      fontSize: screenHeight * 0.016,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    '*',
                    style: TextStyle(
                        fontSize: screenHeight * 0.02, color: Colors.red),
                  )
                ],
              ),
              SizedBox(height: 5),
              PhoneTextfieldFilter(controller: phoneController),
              SizedBox(height: screenHeight * 0.016),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Color(0xFF00A070),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.03,
                        vertical: screenHeight * 0.013),
                  ),
                  onPressed: () {
                    context
                        .read<AuthBloc>()
                        .add(PhoneNumberChangedEvent(phoneController.text));
                    Navigator.pushNamed(context, '/phone-reset-password');
                  },
                  child: Text(
                    AppStrings.sendSms,
                    style: TextStyle(fontSize: screenHeight * 0.018),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
