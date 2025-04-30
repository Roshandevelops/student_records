import 'package:flutter/material.dart';

class LoginHeadingWidget extends StatelessWidget {
  const LoginHeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Column(
          children: [
            Text(
              "Sup, Genius?",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B9C8F),
              ),
            ),
             SizedBox(height: 8),
             Text(
              "Login to your account",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
             SizedBox(height: 30),
          ],
        );
  }
}