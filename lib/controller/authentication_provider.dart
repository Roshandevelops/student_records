import 'package:firebase_sample/services/auth_services.dart';
import 'package:firebase_sample/auth/view/login_screen.dart';
import 'package:firebase_sample/view/home/view/home_screen.dart';
import 'package:firebase_sample/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  Future<void> googleSignInAccount(BuildContext context) async {
    final hello = await AuthServices.instance.googleLoginService(context);
    if (hello == null) {
      if (context.mounted) {
        snackBarWidget(context, "Login Failed");
      }
    } else {
      if (context.mounted) {
        snackBarWidget(context, "Login Successfull");
      }
      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ),
          (route) {
            return false;
          },
        );
      }
    }
    notifyListeners();
  }

  Future<void> emailLogin(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    final errorMessage = await AuthServices.instance
        .emailPasswordSigninService(emailController, passwordController);
    if (errorMessage == null) {
      if (context.mounted) {
        snackBarWidget(context, "Login successfull");
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ),
          (route) {
            return false;
          },
        );
      }
    } else {
      if (context.mounted) {
        snackBarWidget(context, errorMessage);
      }
    }
    notifyListeners();
  }

  Future<void> createEmailAccount(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController,
  ) async {
    final errorMessage =
        await AuthServices.instance.creatNewEmailAccountService(
      context,
      emailController,
      passwordController,
      confirmPasswordController,
    );

    if (errorMessage == null) {
      if (context.mounted) {
        snackBarWidget(context, "Login successfull");
        await Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ),
          (route) {
            return false;
          },
        );
      }
    } else {
      if (context.mounted) {
        snackBarWidget(context, errorMessage);
      }
    }
    notifyListeners();
  }

  Future<void> verifyNumber(
    BuildContext context,
    String? completePhoneNumber,
  ) async {
    final errorMessage = await AuthServices.instance
        .verifyNumberService(context, completePhoneNumber);

    if (errorMessage != null && context.mounted) {
      snackBarWidget(context, errorMessage);
    }
    notifyListeners();
  }

  Future<void> pinPutLogin(
      BuildContext context, String? verificationId, String otp) async {
    final errorMessage = await AuthServices.instance
        .otpValidating(context, verificationId!, otp);
    if (errorMessage != null && context.mounted) {
      snackBarWidget(context, errorMessage);
    }
    notifyListeners();
  }

  Future<void> resetPassword(
      BuildContext context, TextEditingController forgotEmailController) async {
    final errorMessage = await AuthServices.instance
        .resetPasswordService(context, forgotEmailController);
    if (errorMessage != null && context.mounted) {
      snackBarWidget(context, errorMessage);
    }
    notifyListeners();
  }

  Future<void> logOut(BuildContext context) async {
    final errorMessage = await AuthServices.instance.logOutService(context);
    if (errorMessage == null) {
      if (context.mounted) {
        snackBarWidget(context, "Logout Successfull");
      }
      if (context.mounted) {
        await Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (ctx) {
              return const LoginScreen();
            },
          ),
          (route) {
            return false;
          },
        );
      }
    } else {
      if (context.mounted) {
        snackBarWidget(context, errorMessage);
      }
    }
    notifyListeners();
  }
}
