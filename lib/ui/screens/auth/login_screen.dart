import 'package:epolisplus/bloc/auth/auth_bloc.dart';
import 'package:epolisplus/ui/widgets/phone_textfield_filter.dart';
import 'package:epolisplus/ui/widgets/textfiedl_widget.dart';
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.022),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.022),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
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
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.04),
                          Image.asset('assets/logo.png',
                              height: screenHeight * 32 / 852),
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
                                fontSize: screenHeight * 16 / 852,
                                color: Colors.black),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.passwordHintP,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: screenHeight * 14 / 852,
                                ),
                              ),
                            ],
                          ),
                          PasswordTextField(
                              controller: passwordController,
                              hintText: AppStrings.passwordHint,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth),
                          SizedBox(height: screenHeight * 0.006),
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
                                  fontSize: screenHeight * 16 / 852,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.03,
                                    vertical: screenHeight * 0.013),
                              ),
                              onPressed: () {
                                context.read<AuthBloc>().add(
                                    PhoneNumberChangedEvent(
                                        phoneController.text));

                                Navigator.pushNamed(context, '/create-account');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppStrings.loginButton,
                                    style: TextStyle(
                                        fontSize: screenHeight * 16 / 852),
                                  ),
                                  SizedBox(width: screenWidth * 0.01),
                                  Icon(
                                    Icons.arrow_forward_outlined,
                                    size: screenHeight * 20 / 852,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
