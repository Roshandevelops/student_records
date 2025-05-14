import 'package:firebase_sample/services/auth_services.dart';
import 'package:firebase_sample/view/auth/view/login_screen.dart';
import 'package:firebase_sample/view/home/home_screen.dart';
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
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        ),
      );
    }
    notifyListeners();
  }

  Future<void> logOut(BuildContext context) async {
    final errorMessage = await AuthServices.instance.logOutService(context);
    if (errorMessage == null) {
      if (context.mounted) {
        snackBarWidget(context, "Logout Successfull");
      }
      await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) {
            return LoginScreen();
          },
        ),
        (route) {
          return false;
        },
      );
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
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen();
            },
          ),
        );
      }
    } else {
      if (context.mounted) {
        snackBarWidget(context, errorMessage);
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
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen();
            },
          ),
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
