import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget(
      {super.key,
      this.formKey,
      this.emailController,
      this.passwordController,
      required this.buttonText,
      required this.onPressed,
      this.nameController,
      this.ageController,
      this.classController,
      this.domainController,
      this.materialButtonColor,
      required this.buttonTextColor,
      required this.buttonWidth
      });
  final GlobalKey<FormState>? formKey;
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
  final double? buttonWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:buttonWidth,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            offset: Offset(0, 2),
            color: Color(0xFFD6D3D3),
          ),
        ],
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
