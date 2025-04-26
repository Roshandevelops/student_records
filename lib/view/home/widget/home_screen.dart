import 'dart:developer';
import 'package:firebase_sample/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:firebase_sample/controller/google_sign_in_provider.dart';
import 'package:firebase_sample/view/home/widget/register_now_screen.dart';
import 'package:firebase_sample/view/home/widget/number_screen.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/outlined_button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            // Make the screen scrollable
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sup, Genius?",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B9C8F),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Login to your account",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF08AD9D),
                          Color(0xFF1D8076),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.shade700.withOpacity(0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        TextformfieldWidget(
                          hintStyle: TextStyle(
                            color: kwhite,
                          ),
                          color: kwhite,
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          fillColor: Colors.teal.withOpacity(0.1),
                          hintText: "Email",
                          textEditingController: emailController,
                          labelText: "Email",
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: kwhite,
                          ),
                          labelStyle: TextStyle(
                            color: kwhite,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(color: Colors.white60, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: kwhite, width: 2),
                          ),
                        ),
                        kHeight20,
                        TextformfieldWidget(
                          hintStyle: TextStyle(
                            color: kwhite,
                          ),
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: kwhite,
                          ),
                          obscureText: true,
                          color: kwhite,
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          fillColor: Colors.teal.withOpacity(0.1),
                          hintText: "Password",
                          textEditingController: passController,
                          labelText: "password",
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: kwhite,
                          ),
                          labelStyle: TextStyle(
                            color: kwhite,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(color: Colors.white60, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: kwhite, width: 2),
                          ),
                        ),
                        const SizedBox(height: 12),
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
                                const Text("Remember me",
                                    style: TextStyle(color: Colors.white)),
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
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              // Handle sign-in
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return RegisterNowScreen();
                          }));
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButtonWidget(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const NumberScreen()),
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.phone, color: Colors.black),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButtonWidget(
                        onPressed: () {
                          Provider.of<GoogleSignInProvider>(context,
                                  listen: false)
                              .googleLogin();
                          log("Google sign in pressed");
                        },
                        child: const FaIcon(FontAwesomeIcons.google),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
