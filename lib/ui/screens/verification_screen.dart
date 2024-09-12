import 'package:epolisplus/bloc/auth/auth_bloc.dart';
import 'package:epolisplus/ui/widgets/phonecode_textfield_widget.dart';
import 'package:epolisplus/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  int _secondsRemaining = 58;
  bool _isResendVisible = false;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void startCountdown() {
    Future.delayed(Duration(seconds: 1), () {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
        startCountdown();
      } else {
        setState(() {
          _isResendVisible = true;
        });
      }
    });
  }

  void resetTimer() {
    setState(() {
      _secondsRemaining = 58;
      _isResendVisible = false;
    });
    startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamed(context, '/reset-password');
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.04),
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
              Text(
                AppStrings.verification,
                style: TextStyle(
                  fontSize: screenHeight * 0.034,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.018),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.phoneNumbercode,
                          style: TextStyle(
                            fontSize: screenHeight * 0.018,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          AppStrings.phoneNumber,
                          style: TextStyle(
                              color: Color(0xFF00A070),
                              fontSize: screenHeight * 0.018),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.12,
                    vertical: screenWidth * 0.01),
                child: PhonecodeTextfieldWidget(),
              ),
              SizedBox(height: screenHeight * 0.018),
              FilledButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/reset-password');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00A070),
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                      vertical: screenHeight * 0.013),
                ),
                child: Text(
                  AppStrings.verifyAndProceed,
                  style: TextStyle(fontSize: screenHeight * 0.017),
                ),
              ),
              SizedBox(height: screenHeight * 0.016),
              Center(
                child: _isResendVisible
                    ? TextButton.icon(
                        onPressed: resetTimer,
                        icon: Icon(Icons.refresh,
                            color: Color(0xFF00A070),
                            size: screenHeight * 0.028),
                        label: Text(
                          AppStrings.sendCodeAgain,
                          style: TextStyle(
                              fontSize: screenHeight * 0.018,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF00A070)),
                        ),
                      )
                    : Text(
                        '00:${_secondsRemaining.toString().padLeft(2, '0')}',
                        style: TextStyle(
                            fontSize: screenHeight * 0.02, color: Colors.black),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
