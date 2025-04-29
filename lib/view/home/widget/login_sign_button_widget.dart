import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class LoginSignButtonWidget extends StatelessWidget {
  const LoginSignButtonWidget({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  

  @override
  Widget build(BuildContext context) {
    return 
    Container(
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

  Future emailPasswordSignin(TextEditingController emailController,TextEditingController passwordController)async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text);

  }
}
