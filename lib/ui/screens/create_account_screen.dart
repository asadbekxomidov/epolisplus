import 'package:epolisplus/ui/widgets/phone_textfield_filter.dart';
import 'package:epolisplus/ui/widgets/textfiedl_widget.dart';
import 'package:epolisplus/ui/widgets/username_textfield_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/bloc/auth/auth_bloc.dart';
import 'package:epolisplus/utils/app_text.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _isAgreeChecked = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamed(context, '/verification');
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          height: screenHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.04),
                TextButton.icon(
                  style: IconButton.styleFrom(
                    highlightColor: Colors.transparent,
                  ),
                  icon: Icon(
                    Icons.arrow_circle_left_outlined,
                    color: Color(0xFF00A070),
                    size: screenHeight * 24 / 852,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: Text(
                    AppStrings.back,
                    style: TextStyle(
                      fontSize: screenHeight * 16 / 852,
                      color: Color(0xFF00A070),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.017),
                Text(
                  AppStrings.createAccount,
                  style: TextStyle(
                    fontSize: screenHeight * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.023),
                Row(
                  children: [
                    Text(
                      AppStrings.yourname,
                      style: TextStyle(
                        fontSize: screenHeight * 0.016,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      '*',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: screenHeight * 0.017,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.006),
                UsernameTextfieldDart(
                    controller: fullNameController,
                    hintText: AppStrings.theName,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    Text(
                      AppStrings.phoneNumberHint,
                      style: TextStyle(
                        fontSize: screenHeight * 0.016,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      '*',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: screenHeight * 0.017,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.006),
                PhoneTextfieldFilter(controller: phoneController),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  AppStrings.passwordHintP,
                  style: TextStyle(
                    fontSize: screenHeight * 0.016,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(height: screenHeight * 0.006),
                PasswordTextField(
                  controller: passwordController,
                  hintText: AppStrings.passwordHint,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  AppStrings.confirmPassword,
                  style: TextStyle(
                    fontSize: screenHeight * 0.016,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(height: screenHeight * 0.006),
                PasswordTextField(
                  controller: confirmPasswordController,
                  hintText: AppStrings.confirmPasswordHint,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          _isAgreeChecked = !_isAgreeChecked;
                        });
                      },
                      icon: Icon(
                        _isAgreeChecked
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color:
                            _isAgreeChecked ? Color(0xFF00A070) : Colors.grey,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.agreeProcessing,
                          style: TextStyle(
                            fontSize: screenHeight * 0.019,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          AppStrings.personalData,
                          style: TextStyle(
                            fontSize: screenHeight * 0.019,
                            color: Color(0xFF00A070),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                        vertical: screenHeight * 0.013,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/verification');
                    },
                    child: Text(
                      AppStrings.signUpbutton,
                      style: TextStyle(
                        fontSize: screenHeight * 0.018,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
