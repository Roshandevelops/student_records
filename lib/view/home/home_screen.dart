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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              "Welcome !",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: kBlack,
              ),
            ),
            const Text(
              "Student Home",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            kHeight20,
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
                        ),
                        Text(
                          "Remember me",
                        ),
                      ],
                    ),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Create New Account",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            kHeight,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xED012542),
              ),
              onPressed: () {
                print("pressed");
              },
              child: Text(
                "Sign in",
                style: textStyleWhite,
              ),
            ),
            kHeight,
            Text(
              "Or",
              style: textStyleBlack,
            ),
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
