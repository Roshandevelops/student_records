import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/controller/google_sign_in_provider.dart';
import 'package:firebase_sample/view/home/widget/login_widget.dart';
import 'package:firebase_sample/view/homee/home_screen.dart';
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
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : snapshot.hasError
                    ? Text("Something went wrong")
                    : snapshot.hasData
                        ? HomeScreen()
                        : LoginWidget(),
          );
          //    if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const Center(child: CircularProgressIndicator());
          // } else if (snapshot.hasError) {
          //   return const Center(
          //     child: Text("Something went wrong"),
          //   );
          // } else if (snapshot.hasData) {
          //   return MaterialApp(
          //   theme: ThemeData(
          //     scaffoldBackgroundColor: kwhite,
          //   ),
          //   debugShowCheckedModeBanner: false,
          //   home: const HomeScreen(),
          // );
          // }
          // return const LoginWidget();
        },
      ),
    );
  }
}
