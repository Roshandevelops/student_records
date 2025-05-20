import 'package:firebase_sample/view/auth/view/login_screen.dart';
import 'package:firebase_sample/view/auth/widgets/login_forgot_column_widget.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class LoginForgotPasswordScreen extends StatelessWidget {
  const LoginForgotPasswordScreen({
    super.key,
    required this.forgotFormKey,
    required this.forgotEmailController,
  });

  final GlobalKey<FormState> forgotFormKey;
  final TextEditingController forgotEmailController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kwhite,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 20,
              right: 0,
              bottom: 0,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (ctx) {
                    return LoginScreen();
                  }),
                  (route) => false,
                );
              },
              icon: Icon(
                Icons.arrow_back,
                color: appColor,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: LoginForgotColumnWidget(
                forgotEmailController: forgotEmailController,
                forgotFormKey: forgotFormKey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
