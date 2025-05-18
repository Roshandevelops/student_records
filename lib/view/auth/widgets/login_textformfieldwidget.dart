import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';

class LoginEmailTextformfieldwidget extends StatelessWidget {
  const LoginEmailTextformfieldwidget({
    super.key,
    required this.emailController,
    required this.passController,
  });
  final TextEditingController emailController;
  final TextEditingController passController;

  final String email = "";
  final String password = "";

  final String passwordDialogue = "Please Enter password of min length 6";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextformfieldWidget(
          validator: (value) {
            if (value!.isEmpty || !value.contains("@")) {
              return emailErrorDialogue;
            } else {
              return null;
            }
          },
          hintStyle: const TextStyle(
            color: kwhite,
          ),
          color: kwhite,
          padding: const EdgeInsets.symmetric(horizontal: 0),
          fillColor: appColor,
          // Colors.red,
          // Colors.teal.withOpacity(0.1),
          hintText: "Email",
          controller: emailController,
          labelText: "Email",
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: kwhite,
          ),
          labelStyle: textStyleWhite,
          enabledBorder: customOutlineBorder(color: Colors.white60, width: 2),
          focusedBorder: customOutlineBorder(color: kwhite, width: 2),
        ),
        kHeight,
        TextformfieldWidget(
          obscureText: true,
          suffixIcon: const Icon(Icons.remove_red_eye_outlined),
          validator: (value) {
            if (value!.length < 6) {
              return passwordDialogue;
            } else {
              return null;
            }
          },
          hintStyle: const TextStyle(
            color: kwhite,
          ),
          color: kwhite,
          padding: const EdgeInsets.symmetric(horizontal: 0),
          fillColor: appColor,
          // Colors.teal.withOpacity(0.1),
          hintText: "Password",
          controller: passController,
          labelText: "Password",
          prefixIcon: const Icon(
            Icons.email_outlined,
            // color: kwhite,
          ),
          labelStyle: textStyleWhite,
          enabledBorder: customOutlineBorder(color: Colors.white60, width: 2),
          focusedBorder: customOutlineBorder(color: kwhite, width: 2),
        ),
      ],
    );
  }
}
