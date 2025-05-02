import 'package:firebase_sample/services/auth_services.dart';
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
    }
    notifyListeners();
  }

  Future<void> logOut(BuildContext context) async {
    final errorMessage = await AuthServices.instance.logOutService();
    if (errorMessage == null) {
      if (context.mounted) {
        snackBarWidget(context, "Logout Successfull");
      }
    } else {
      if (context.mounted) {
        snackBarWidget(context,errorMessage);
      }
    }
    notifyListeners();
  }
}
