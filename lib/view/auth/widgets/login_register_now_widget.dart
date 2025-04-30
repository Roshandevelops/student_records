import 'package:firebase_sample/view/auth/view/register_now_screen.dart';
import 'package:flutter/material.dart';

class LoginRegisterNowWidget extends StatelessWidget {
  const LoginRegisterNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) {
                      return const RegisterNowScreen();
                    },
                  ),
                );
              },
              child: const Text(
                "Register Now",
                style: TextStyle(
                  color: Color(0xFF1B9C8F),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        const Text(
          "Or continue with",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
