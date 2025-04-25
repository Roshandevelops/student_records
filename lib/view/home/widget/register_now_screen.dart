import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/textformfield_widget.dart';

class RegisterNowScreen extends StatelessWidget {
  const RegisterNowScreen({
    super.key,
    this.confirmRegisterPassController,
    this.registerEmailController,
    this.registerPassController,
  });

  final TextEditingController? registerEmailController;
  final TextEditingController? registerPassController;
  final TextEditingController? confirmRegisterPassController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF08AD9D), Color(0xFF1D8076)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // White curved container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "Create Your Account",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Let’s get started with your journey!",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Email Field
                    TextformfieldWidget(
                      textEditingController: registerEmailController,
                      prefixIcon: const Icon(Icons.email, color: kBlack),
                      hintText: "Email",
                    ),
                    const SizedBox(height: 15),

                    // Password Field
                    TextformfieldWidget(
                      textEditingController: registerPassController,
                      obscureText: true,
                      suffixIcon:
                          const Icon(Icons.remove_red_eye, color: kBlack),
                      prefixIcon: const Icon(Icons.lock, color: kBlack),
                      hintText: "Password",
                    ),
                    const SizedBox(height: 15),

                    // Confirm Password Field
                    TextformfieldWidget(
                      textEditingController: confirmRegisterPassController,
                      obscureText: true,
                      suffixIcon:
                          const Icon(Icons.remove_red_eye, color: kBlack),
                      prefixIcon: const Icon(Icons.lock, color: kBlack),
                      hintText: "Confirm Password",
                    ),
                    const SizedBox(height: 30),

                    // Register Button
                    Container(
                      width: double.infinity,
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
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),

          // Top Back Button
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.of(context).pop(),
                child: const Icon(CupertinoIcons.back,
                    color: Colors.white, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
