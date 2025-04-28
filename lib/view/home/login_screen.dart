import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/view/home/widget/login_widget.dart';
import 'package:firebase_sample/view/loggedin/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong"),
          );
        } else if (snapshot.hasData) {
          return const HomeScreen();
        }
        return const LoginWidget();
      },
    );
  }
}
