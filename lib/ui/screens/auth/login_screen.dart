import 'package:epolisplus/bloc/auth/auth_bloc.dart';
import 'package:epolisplus/ui/widgets/phone_textfield_filter.dart';
import 'package:epolisplus/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.12),
                Image.asset('assets/logo.png', height: screenHeight * 0.05),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  AppStrings.loginWelcome,
                  style: TextStyle(
                    fontSize: screenHeight * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  AppStrings.loginEnter,
                  style: TextStyle(
                    fontSize: screenHeight * 0.02,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.phoneNumberHint,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: screenHeight * 0.02,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                PhoneTextfieldFilter(controller: phoneController),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.passwordHintP,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: screenHeight * 0.02,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                Stack(
                  children: [
                    TextField(
                      controller: passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: AppStrings.passwordHint,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: screenHeight * 0.019,
                        ),
                        contentPadding: EdgeInsets.only(
                            left: screenWidth * 0.04,
                            right: screenWidth * 0.12),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        suffixIcon: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: screenHeight * 0.019,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: IconButton.styleFrom(
                      highlightColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {},
                    child: Text(
                      AppStrings.forgotPassword,
                      style: TextStyle(
                        color: Color(0xFF00A070),
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
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

                      Navigator.pushNamed(context, '/create-account');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.loginButton,
                          style: TextStyle(fontSize: screenHeight * 0.018),
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Icon(
                          Icons.arrow_forward_outlined,
                          size: screenHeight * 0.022,
                        ),
                      ],
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
