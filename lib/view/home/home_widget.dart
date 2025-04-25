import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/view/home/widget/home_screen.dart';
import 'package:firebase_sample/view/loggedin/loggedin_widget.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

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
          return const LoggedinWidget();
        }
        return const HomeScreen();
      },
    );
  }
}
