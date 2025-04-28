import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';

class LoginCheckboxRowWidget extends StatelessWidget {
  const LoginCheckboxRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Colors.white,
                  checkColor: Colors.teal,
                ),
                const Text(
                  "Remember me",
                  style: TextStyle(color: kwhite),
                ),
              ],
            ),
            const Text(
              "Forgot Password?",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
        kHeight20,
      ],
    );
  }
}
