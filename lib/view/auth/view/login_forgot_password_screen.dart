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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: LoginForgotColumnWidget(
              forgotEmailController: forgotEmailController,
              forgotFormKey: forgotFormKey,
            ),
            // Form(
            //   key: forgotFormKey,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       const Icon(
            //         Icons.lock_reset,
            //         size: 70,
            //         color: appColor,
            //       ),
            //       kHeight20,
            //       Text(
            //         "Forgot Password",
            //         style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            //               color: appColor,
            //               fontWeight: FontWeight.bold,
            //             ),
            //       ),
            //       kHeight,

            //       const Text(
            //         "Enter your registered email below. We’ll send you a link to reset your password.",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           fontSize: 15,
            //           color: Colors.black87,
            //           height: 1.5,
            //         ),
            //       ),
            //       kHeight20,
            //       LoginForgotContainerWidget(
            //         forgotEmailController: forgotEmailController,
            //         forgotFormKey: forgotFormKey,
            //       ),

            //     ],
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
