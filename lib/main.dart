import 'package:firebase_sample/controller/google_sign_in_provider.dart';
import 'package:firebase_sample/view/home/login_screen.dart';

import 'package:firebase_sample/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_sample/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return GoogleSignInProvider();
          },
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: kwhite,
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      ),
    );
  }
}
