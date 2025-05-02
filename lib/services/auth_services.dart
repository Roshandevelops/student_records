import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  AuthServices.internal();
  static AuthServices instance = AuthServices.internal();
  factory AuthServices() {
    return AuthServices.instance;
  }

  Future<GoogleSignInAccount?> googleLogin(context) async {
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

  Future<bool> logout() async {
    final googleSignIn = GoogleSignIn();
    final user = FirebaseAuth.instance.currentUser;
    try {
      if (user != null) {
        final providerId = user.providerData.first.providerId;
        if (providerId == "google.com") {
          await googleSignIn.disconnect();
          await FirebaseAuth.instance.signOut();
        } else {
          await FirebaseAuth.instance.signOut();
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
