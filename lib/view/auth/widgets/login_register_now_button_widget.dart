import 'package:firebase_sample/controller/authentication_provider.dart';
import 'package:firebase_sample/widgets/constants.dart';
import 'package:firebase_sample/widgets/material_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginRegisterNowButtonWidget extends StatelessWidget {
  const LoginRegisterNowButtonWidget({
    super.key,
    required this.confirmRegisterPassController,
    required this.registerEmailController,
    required this.registerPassController,
    required this.formKey
  });

  final TextEditingController registerEmailController;

  final TextEditingController registerPassController;

  final TextEditingController confirmRegisterPassController;
  final GlobalKey<FormState> formKey ;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialButtonWidget(
      buttonWidth: screenWidth * 1 / 2,
      materialButtonColor: appColor,
      buttonText: "Register Now",
      onPressed: () {
        if(formKey.currentState!.validate()){
              Provider.of<AuthenticationProvider>(context, listen: false)
            .createEmailAccount(
          context,
          registerEmailController,
          registerPassController,
          confirmRegisterPassController,
        );

        }else{
          
        }
    
      },
      buttonTextColor: kwhite,
    );
 
  }
}
