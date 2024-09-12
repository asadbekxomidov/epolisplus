import 'package:epolisplus/ui/screens/auth/phone_password_screen.dart';
import 'package:epolisplus/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/bloc/auth/auth_bloc.dart';
import 'package:epolisplus/ui/screens/auth/login_screen.dart';
import 'package:epolisplus/ui/screens/phone_login_screen.dart';
import 'package:epolisplus/ui/screens/auth/reset_password_screen.dart';
import 'package:epolisplus/ui/screens/create_account_screen.dart';
import 'package:epolisplus/ui/screens/verification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PhoneLoginScreen(),
        routes: {
          '/phonelogin': (context) => PhoneLoginScreen(),
          '/login': (context) => LoginScreen(),
          '/create-account': (context) => CreateAccountScreen(),
          '/verification': (context) => VerificationScreen(),
          '/reset-password': (context) => ResetPasswordScreen(),
          '/phone-reset-password': (context) => PhoneRasswordScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
