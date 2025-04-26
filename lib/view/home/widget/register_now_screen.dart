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
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF08AD9D), Color(0xFF1D8076)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: CupertinoButton(
                  //     padding: EdgeInsets.zero,
                  //     child:
                  //         const Icon(CupertinoIcons.back, color: Colors.white),
                  //     onPressed: () => Navigator.of(context).pop(),
                  //   ),
                  // ),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Ready to Explore?",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: kwhite,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "A few taps away from awesome",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        TextformfieldWidget(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          fillColor: kwhite,
                          textEditingController: registerEmailController,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.teal,
                          ),
                          hintText: "Email",
                        ),
                        const SizedBox(height: 15),
                        TextformfieldWidget(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          fillColor: kwhite,
                          textEditingController: registerPassController,
                          obscureText: true,
                          onDoubleTap: () => print("eye pressed"),
                          suffixIcon: const Icon(Icons.remove_red_eye_outlined,
                              color: Colors.teal),
                          prefixIcon: const Icon(Icons.lock_outline,
                              color: Colors.teal),
                          hintText: "Password",
                        ),
                        const SizedBox(height: 15),
                        TextformfieldWidget(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          fillColor: kwhite,
                          textEditingController: confirmRegisterPassController,
                          obscureText: true,
                          onDoubleTap: () => print("eye pressed"),
                          suffixIcon: const Icon(Icons.remove_red_eye_outlined,
                              color: Colors.teal),
                          prefixIcon: const Icon(Icons.lock_outline,
                              color: Colors.teal),
                          hintText: "Confirm Password",
                        ),
                        const SizedBox(height: 30),
                        Container(
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
