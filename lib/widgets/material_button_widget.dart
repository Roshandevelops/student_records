import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget(
      {super.key,
      required this.formKey,
      this.emailController,
      this.passwordController,
      required this.buttonText,
      required this.onPressed,
      this.nameController,
      this.ageController,
      this.classController,
      this.domainController,
      required this.materialButtonColor,
      required this.buttonTextColor
      });
  final GlobalKey<FormState> formKey;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? nameController;
  final TextEditingController? classController;
  final TextEditingController? ageController;
  final TextEditingController? domainController;
  final String buttonText;
  final void Function()? onPressed;
  final Color? materialButtonColor;
  final Color? buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: materialButtonColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: buttonTextColor,
          ),
        ),
      ),
    );
  }
}
