import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/services/auth_services.dart';
import 'package:firebase_sample/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? user;

  Future<void> googleSignInAccount(BuildContext context) async {
    final hello = await AuthServices.instance.googleLogin(context);
    if (hello == null) {
      if (context.mounted) {
        snackBarWidget(context, "Login Failed");
      }
    } else {
      if (context.mounted) {
        snackBarWidget(context, "Login Successfull");
      }
    }
    notifyListeners();
  }

  // Future googleLogin(context) async {
  //   try {
  //     final googleUser = await googleSignIn.signIn();
  //     if (googleUser == null) {
  //       return;
  //     }
  //     user = googleUser;
  //     final googleAuth = await googleUser.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   notifyListeners();
  // }

  Future logOut() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final providerId = user.providerData.first.providerId;
      if (providerId == "google.com") {
        await googleSignIn.disconnect();
        await FirebaseAuth.instance.signOut();
        notifyListeners();
      } else {
        await FirebaseAuth.instance.signOut();
        notifyListeners();
      }
    }
  }
}
