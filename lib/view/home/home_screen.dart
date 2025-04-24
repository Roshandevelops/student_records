import 'package:firebase_sample/widgets/outlined_button_widget.dart';
import 'package:firebase_sample/view/phone/number_screen.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';

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
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome Back!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1B9C8F),
              ),
            ),
            const Text(
              "Student Home",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1B9C8F),
              ),
            ),
            kHeight20,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF1B9C8F),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  TextformfieldWidget(
                    prefixIcon: const Icon(Icons.email),
                    hintText: "Email",
                    textEditingController: emailController,
                  ),
                  TextformfieldWidget(
                    obscureText: true,
                    onDoubleTap: () {
                      print("eye button pressed");
                    },
                    suffixIcon: const Icon(Icons.remove_red_eye),
                    prefixIcon: const Icon(Icons.lock),
                    hintText: "Password",
                    textEditingController: passController,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (value) {},
                                activeColor: Colors.deepPurple[700],
                              ),
                              Text(
                                "Remember me",
                                style: textStyleWhite,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, color: kwhite),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, color: kwhite),
                            ),
                            Text(
                              "Register Now",
                              style: TextStyle(
                                  color: Colors.deepPurple[700],
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      kHeight,
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF08AD9D),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 200,
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text("Sign in"),
                        ),
                      )
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Color.fromARGB(255, 5, 179, 162),
                      //   ),
                      //   onPressed: () {
                      //     print("pressed");
                      //   },
                      //   child: Text(
                      //     "Sign in",
                      //     style: textStyleWhite,
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            // kHeight20,

            kHeight,
            Text("Or",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1B9C8F),
                )),
            kHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButtonWidget(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return NumberScreen();
                        },
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: kBlack,
                      ),
                    ],
                  ),
                ),
                OutlinedButtonWidget(
                  onPressed: () {
                    print("pressed");
                  },
                  child: Image.asset(
                    "assets/OIP.jpeg",
                    height: 25,
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
