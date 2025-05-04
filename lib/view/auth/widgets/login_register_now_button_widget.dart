import 'package:firebase_sample/controller/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginRegisterNowButtonWidget extends StatelessWidget {
  const LoginRegisterNowButtonWidget({
    super.key,
    required this.confirmRegisterPassController,
    required this.registerEmailController,
    required this.registerPassController,
  });

  final TextEditingController registerEmailController;

  final TextEditingController registerPassController;

  final TextEditingController confirmRegisterPassController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF08AD9D),
            Color(0xFF1D8076),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: () {
          Provider.of<AuthenticationProvider>(context, listen: false)
              .createEmailAccount(
            context,
            registerEmailController,
            registerPassController,
            confirmRegisterPassController,
          );
        },
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: const Text(
          "Register Now",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
