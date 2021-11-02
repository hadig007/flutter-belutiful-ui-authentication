import 'package:flutter/material.dart';
import 'package:login_signup_ui/login_signup_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Sign-Up UI',
      home: LoginSignUpScreen(),
    );
  }
}