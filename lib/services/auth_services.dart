import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/utils/utils.dart';
import 'package:firebase_sample/view/auth/view/otp_screen.dart';
import 'package:firebase_sample/view/home/home_screen.dart';
import 'package:firebase_sample/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
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

  Future<String?> emailPasswordSigninService(
      TextEditingController emailController,
      TextEditingController passwordController) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      return null;
    } on FirebaseException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> creatNewEmailAccountService(
      BuildContext context,
      TextEditingController registerEmailController,
      TextEditingController registerPassController,
      TextEditingController confirmRegisterPassController) async {
    try {
      final email = registerEmailController.text.trim();
      final password = registerPassController.text.trim();
      final confirmPassword = confirmRegisterPassController.text.trim();

      // using regex

      final emailRegex =
          RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
      if (!emailRegex.hasMatch(email)) {
        return "Please enter a valid email address";
      }

      final emailDomain = email.split("@").last.toLowerCase();
      if (AppUtils.commonTypos.contains(emailDomain)) {
        return "Did you mean ${AppUtils.suggestDomain(emailDomain)}?";
      }

      if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        return "Please fill all fields";
      }
      if (password != confirmPassword) {
        return "Passwords do not match";
      }
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (context.mounted) {
        snackBarWidget(context, "Account created successfully");
      }
      if (context.mounted) {
        Navigator.of(context).pop();
      }
      return null;
    } on FirebaseException catch (e) {
      if (e.code == "email-already-in-use") {
        return "This email is already registered. Please login or use a different email";
      } else if (e.code == 'invalid-email') {
        return "Invalid email format";
      } else if (e.code == "weak-password") {
        return "Password must be at least 6 characters long";
      } else {
        return "Registration failed: ${e.message}";
      }
    } catch (e) {
      log("Register Error: $e");
      if (context.mounted) {
        snackBarWidget(context, "something went wrong:${e.toString()}");
      }
    }
    return null;
  }

  Future<String?> logOutService(BuildContext context) async {
    final googleSignIn = GoogleSignIn();
    final user = FirebaseAuth.instance.currentUser;
    try {
      if (user != null && user.providerData.isNotEmpty) {
        final providerId = user.providerData.first.providerId;

        if (providerId == "google.com") {
          await googleSignIn.disconnect();
          await FirebaseAuth.instance.signOut();
        } else {
          await FirebaseAuth.instance.signOut();
        }
      } else {
        await FirebaseAuth.instance.signOut();
      }

      return null;
    } on SocketException catch (_) {
      return "Please check your Internet connection try again later";
    } on FirebaseException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> verifyNumberService(
      BuildContext context, String? completePhoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException exception) {
          log("checking ${exception.message!}");
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => OtpScreen(
                verificationId: verificationId,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        phoneNumber: completePhoneNumber,
      );

      log("hello${completePhoneNumber.toString()}");
    } on SocketException catch (_) {
      return "Please check your Internet connection try again later";
    } on FirebaseException catch (e) {
      return e.message;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<String?> otpValidating(
      BuildContext context, String verificationId, String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      if (context.mounted) {
        snackBarWidget(context, "Login Successful");
      }

      if (context.mounted) {
        await Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) {
              return const HomeScreen();
            },
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        snackBarWidget(context, e.message ?? "Invalid OTP");
      }
    } catch (e) {
      log("OTP verification error: $e");
      if (context.mounted) {
        snackBarWidget(context, "An error occurred. Please try again.");
      }
    }
    return null;
  }
}
