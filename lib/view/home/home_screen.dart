import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/controller/authentication_provider.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name :${userName.email!}"),
            Text("Email :${userName.email!}"),
            kHeight20,
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () async {
                await Provider.of<AuthenticationProvider>(context,
                        listen: false)
                    .logOut();
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
