import 'package:epolisplus/ui/widgets/phone_textfield_filter.dart';
import 'package:epolisplus/utils/app_image.dart';
import 'package:epolisplus/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/bloc/auth/auth_bloc.dart';

class PhoneLoginScreen extends StatefulWidget {
  @override
  _PhoneLoginScreenState createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is PhoneNumberValidatedState) {
            Navigator.pushNamed(context, '/login',
                arguments: phoneController.text);
          } else if (state is AuthFailureState) {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(content: Text(state.errorMessage)),
            // );
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.022),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImage.appmainImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.16),
              Image.asset(AppImage.appImagelogo, height: screenHeight * 32 / 852),
              SizedBox(height: screenHeight * 0.02),
              Text(
                AppStrings.loginWelcome,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: screenHeight * 24 / 852,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                AppStrings.loginEnter,
                style: TextStyle(
                    fontSize: screenHeight * 16 / 852, color: Colors.black),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.phoneNumberHint,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: screenHeight * 14 / 852,
                    ),
                  ),
                ],
              ),
              PhoneTextfieldFilter(controller: phoneController),
              SizedBox(height: screenHeight * 0.02),
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
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.loginButton,
                        style: TextStyle(fontSize: screenHeight * 16 / 852),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Icon(Icons.arrow_forward_outlined,
                          size: screenHeight * 20 / 852),
                    ],
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
