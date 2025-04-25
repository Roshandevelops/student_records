import 'dart:developer';

import 'package:firebase_sample/controller/google_sign_in_provider.dart';
import 'package:firebase_sample/view/home/widget/register_now_screen.dart';
import 'package:firebase_sample/widgets/outlined_button_widget.dart';
import 'package:firebase_sample/view/home/widget/number_screen.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
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
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF1D8076),
                      blurRadius: 1,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextformfieldWidget(
                      prefixIcon: const Icon(
                        Icons.supervised_user_circle_rounded,
                        color: kBlack,
                      ),
                      hintText: "Email",
                      textEditingController: emailController,
                    ),
                    const SizedBox(height: 16),
                    TextformfieldWidget(
                      obscureText: true,
                      onDoubleTap: () {
                        print("eye button pressed");
                      },
                      suffixIcon: const Icon(
                        Icons.remove_red_eye,
                        color: kBlack,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: kBlack,
                      ),
                      hintText: "Password",
                      textEditingController: passController,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (value) {},
                              activeColor: kBlack,
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
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: MaterialButton(
                        onPressed: () {},
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
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) {
                          return const RegisterNowScreen();
                        }),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButtonWidget(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const NumberScreen(),
                        ),
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.phone, color: kBlack),
                        SizedBox(width: 6),
                        // Text("Phone")
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButtonWidget(
                      onPressed: () {
                        Provider.of<GoogleSignInProvider>(context,
                                listen: false)
                            .googleLogin();

                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (ctx) {
                        //       return GoogleAccountScreen();
                        //     },
                        //   ),
                        // );
                        log("Google sign in pressed");
                      },
                      child: const FaIcon(FontAwesomeIcons.google)
                      // Image.asset(
                      //   "assets/OIP.jpeg",
                      //   height: 25,
                      // ),
                      ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
