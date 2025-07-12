import 'package:firebase_sample/auth/view/login_forgot_password_screen.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class LoginCheckboxRowWidget extends StatefulWidget {
  const LoginCheckboxRowWidget(
      {super.key,
      required this.forgotEmailController,
      required this.forgotFormKey});
  final TextEditingController forgotEmailController;
  final GlobalKey<FormState> forgotFormKey;

  @override
  State<LoginCheckboxRowWidget> createState() => _LoginCheckboxRowWidgetState();
}

class _LoginCheckboxRowWidgetState extends State<LoginCheckboxRowWidget> {
  bool isRemembered = true;
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
                  value: isRemembered,
                  onChanged: (value) {
                    setState(() {
                      isRemembered = !isRemembered;
                    });
                  },
                  activeColor: kwhite,
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
                    forgotEmailController: widget.forgotEmailController,
                    forgotFormKey: widget.forgotFormKey,
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
