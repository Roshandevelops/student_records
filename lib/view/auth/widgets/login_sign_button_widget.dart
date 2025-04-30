import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class LoginSignButtonWidget extends StatelessWidget {
  const LoginSignButtonWidget({super.key, required this.formKey,this.emailCont,this.passCont});
  final GlobalKey<FormState> formKey;

  final TextEditingController? emailCont;
  final TextEditingController? passCont;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
          }
          // emailPasswordSignin();




        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: const Text(
          "Sign In",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: appColor,
          ),
        ),
      ),
    );
  }

  //   Future emailPasswordSignin() async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailCont!.text.trim(),
  //       password: passCont!.text.trim(),
  //     );
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}
