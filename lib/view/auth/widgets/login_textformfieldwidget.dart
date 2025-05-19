import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';

class LoginEmailTextformfieldwidget extends StatefulWidget {
  const LoginEmailTextformfieldwidget({
    super.key,
    required this.emailController,
    required this.passController,
  });
  final TextEditingController emailController;
  final TextEditingController passController;

  @override
  State<LoginEmailTextformfieldwidget> createState() =>
      _LoginEmailTextformfieldwidgetState();
}

class _LoginEmailTextformfieldwidgetState
    extends State<LoginEmailTextformfieldwidget> {

  bool isPasswordVisible = false;

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
          hintText: "Email",
          controller: widget.emailController,
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
          obscureText: !isPasswordVisible,
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            child: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.white70,
            ),
          ),
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
          controller: widget.passController,
          labelText: "Password",
          prefixIcon: const Icon(
            Icons.lock_outline,
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
