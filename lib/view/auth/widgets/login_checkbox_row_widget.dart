import 'package:firebase_sample/view/auth/view/login_forgot_password_screen.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class LoginCheckboxRowWidget extends StatelessWidget {
  const LoginCheckboxRowWidget(
      {super.key,
      required this.forgotEmailController,
      required this.forgotFormKey});
  final TextEditingController forgotEmailController;
  final GlobalKey<FormState> forgotFormKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Colors.white,
                  checkColor: Colors.teal,
                ),
                const Text(
                  "Remember me",
                  style: TextStyle(color: kwhite),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return LoginForgotPasswordScreen(
                    forgotEmailController: forgotEmailController,
                    forgotFormKey: forgotFormKey,
                  );
                }));
              },
              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        kHeight20,
      ],
    );
  }
}
