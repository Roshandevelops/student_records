import 'package:firebase_sample/view/home/widgets/outlined_button.dart';
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "Student Home",
              style: TextStyle(
                fontSize: 25,
                color: kBlack,
              ),
            ),
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            kHeight20,
            TextformfieldWidget(
              hintText: "Email",
              textEditingController: emailController,
            ),
            kHeight,
            TextformfieldWidget(
              hintText: "Password",
              textEditingController: passController,
            ),
            kHeight20,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kwhite,
              ),
              onPressed: () {},
              child: Text(
                "Sign in",
                style: textStyleBlack,
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
                const OutlinedButtonWidget(
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: kBlack,
                      ),
                    ],
                  ),
                ),
                OutlinedButtonWidget(
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
