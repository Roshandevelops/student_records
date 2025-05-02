import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  AuthServices.internal();
  static AuthServices instance = AuthServices.internal();
  factory AuthServices() {
    return AuthServices.instance;
  }

  Future<GoogleSignInAccount?> googleLoginService(context) async {
    final googleSignIn = GoogleSignIn();
    GoogleSignInAccount? user;

    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }
      user = googleUser;
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<String?> logOutService() async {
    final googleSignIn = GoogleSignIn();
    final user = FirebaseAuth.instance.currentUser;
    try {
      final providerId = user!.providerData.first.providerId;
      if (providerId == "google.com") {
        await googleSignIn.disconnect();
        await FirebaseAuth.instance.signOut();
      } else {
        await FirebaseAuth.instance.signOut();
      }
      return null;
    } on SocketException catch (_) {
      return "Please try again later";
    } on FirebaseException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }
}
