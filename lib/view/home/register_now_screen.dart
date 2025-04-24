import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/textformfield_widget.dart';

class RegisterNowScreen extends StatelessWidget {
  const RegisterNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 20),

              // Header text
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                "Register to get started!",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 40),

              // Form container with gradient
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF08AD9D), Color(0xFF1D8076)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextformfieldWidget(
                      prefixIcon: const Icon(Icons.email, color: kBlack),
                      hintText: "Email",
                      // hintStyle: const TextStyle(color: Colors.white70),
                      // fillColor: Colors.white.withOpacity(0.1),
                      // filled: true,
                      // borderColor: Colors.white38,
                      // textColor: Colors.white,
                    ),
                    const SizedBox(height: 15),
                    TextformfieldWidget(
                      obscureText: true,
                      onDoubleTap: () => print("eye pressed"),
                      suffixIcon:
                          const Icon(Icons.remove_red_eye, color: kBlack),
                      prefixIcon: const Icon(Icons.lock, color: kBlack),
                      hintText: "Password",
                      // hintStyle: const TextStyle(color: Colors.white70),
                      // fillColor: Colors.white.withOpacity(0.1),
                      // filled: true,
                      // borderColor: Colors.white38,
                      // textColor: Colors.white,
                    ),
                    const SizedBox(height: 15),
                    TextformfieldWidget(
                      obscureText: true,
                      onDoubleTap: () => print("eye pressed"),
                      suffixIcon:
                          const Icon(Icons.remove_red_eye, color: kBlack),
                      prefixIcon: const Icon(Icons.lock, color: kBlack),
                      hintText: "Confirm Password",
                      // hintStyle: const TextStyle(color: Colors.white70),
                      // fillColor: Colors.white.withOpacity(0.1),
                      // filled: true,
                      // borderColor: Colors.white38,
                      // textColor: Colors.white,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Register Button
              Center(
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF08AD9D), Color(0xFF1D8076)],
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
                    onPressed: () {},
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
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
