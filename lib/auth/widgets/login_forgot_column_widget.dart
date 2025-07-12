import 'package:firebase_sample/auth/widgets/login_forgot_container_widget.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class LoginForgotColumnWidget extends StatelessWidget {
  const LoginForgotColumnWidget(
      {super.key,
      required this.forgotEmailController,
      required this.forgotFormKey});
  final GlobalKey<FormState> forgotFormKey;
  final TextEditingController forgotEmailController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forgotFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.lock_reset,
            size: 70,
            color: appColor,
          ),
          kHeight20,
          Text(
            "Forgot Password",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: appColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          kHeight,
          const Text(
            "Enter your registered email below. We’ll send you a link to reset your password.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          kHeight20,
          LoginForgotContainerWidget(
            forgotEmailController: forgotEmailController,
            forgotFormKey: forgotFormKey,
          ),
        ],
      ),
    );
  }
}
