import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';

class LoginEmailTextformfieldwidget extends StatefulWidget {
  const LoginEmailTextformfieldwidget({super.key});

  @override
  State<LoginEmailTextformfieldwidget> createState() =>
      _LoginEmailTextformfieldwidgetState();
}

class _LoginEmailTextformfieldwidgetState
    extends State<LoginEmailTextformfieldwidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  String email = "";
  String password = "";
  String emailDialogue = "Please Enter Valid Email";
  String passwordDialogue = "Please Enter password of min length 6";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextformfieldWidget(
          validator: (value) {
            if (value!.isEmpty || !value.contains("@")) {
              return emailDialogue;
            } else {
              return null;
            }
          },
          onSaved: (value) {
            setState(() {
              email = value!;
            });
          },
          hintStyle: const TextStyle(
            color: kwhite,
          ),
          color: kwhite,
          padding: const EdgeInsets.symmetric(horizontal: 0),
          fillColor: Colors.teal.withOpacity(0.1),
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
          validator: (value) {
            if (value!.length < 6) {
              return passwordDialogue;
            } else {
              return null;
            }
          },
          onSaved: (value) {
            setState(() {
              password = value!;
            });
          },
          hintStyle: const TextStyle(
            color: kwhite,
          ),
          color: kwhite,
          padding: const EdgeInsets.symmetric(horizontal: 0),
          fillColor: Colors.teal.withOpacity(0.1),
          hintText: "Paaword",
          controller: passController,
          labelText: "Password",
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: kwhite,
          ),
          labelStyle: textStyleWhite,
          enabledBorder: customOutlineBorder(color: Colors.white60, width: 2),
          focusedBorder: customOutlineBorder(color: kwhite, width: 2),
        ),
        // ElevatedButton(
        //   onPressed: () {
        //     emailPasswordSignin();
        //   },
        //   child: const Text("sample"),
        // )
      ],
    );
  }

  // Future emailPasswordSignin() async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passController.text.trim(),
  //     );
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }


}
