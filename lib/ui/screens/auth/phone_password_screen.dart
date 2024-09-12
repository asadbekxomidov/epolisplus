import 'package:epolisplus/bloc/auth/auth_bloc.dart';
import 'package:epolisplus/ui/widgets/phonecode_textfield_widget.dart';
import 'package:epolisplus/ui/widgets/textfiedl_widget.dart';
import 'package:epolisplus/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneRasswordScreen extends StatefulWidget {
  const PhoneRasswordScreen({super.key});

  @override
  State<PhoneRasswordScreen> createState() => _PhoneRasswordScreenState();
}

class _PhoneRasswordScreenState extends State<PhoneRasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is PhoneNumberValidated) {
              Navigator.pushNamed(context, '/home',
                  arguments: state.phoneNumber);
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('password invalid')),
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
                SizedBox(height: screenHeight * 0.04),
                TextButton.icon(
                    style: IconButton.styleFrom(
                        highlightColor: Colors.transparent),
                    icon: Icon(Icons.arrow_circle_left_outlined,
                        color: Color(0xFF00A070), size: screenHeight * 0.028),
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
                SizedBox(height: screenHeight * 0.025),
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
                SizedBox(height: screenHeight * 0.03),
                Text(
                  AppStrings.passwordHintP,
                  style: TextStyle(
                      fontSize: screenHeight * 0.017,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700),
                ),
                SizedBox(height: screenHeight * 0.006),
                PasswordTextField(
                  controller: passwordController,
                  hintText: AppStrings.passwordHint,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),
                Text(
                  AppStrings.minimumCharacters,
                  style: TextStyle(
                      fontSize: screenHeight * 0.016,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  AppStrings.confirmPassword,
                  style: TextStyle(
                      fontSize: screenHeight * 0.017,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700),
                ),
                SizedBox(height: screenHeight * 0.006),
                PasswordTextField(
                  controller: passwordController,
                  hintText: AppStrings.passwordHint,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.12,
                      vertical: screenWidth * 0.01),
                  child: PhonecodeTextfieldWidget(),
                ),
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
                      context.read<AuthBloc>().add(
                          PhoneNumberChangedEvent(passwordController.text));
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      AppStrings.verifyAndProceed,
                      style: TextStyle(fontSize: screenHeight * 0.018),
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
