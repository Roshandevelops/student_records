import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({super.key,required this.textStyle,required this.onPressed,required this.text,required this.style});
  final void Function()? onPressed;
  final String text;
  final ButtonStyle? style;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(),
      
      onPressed: onPressed,
      child: Text(text,style: textStyle,),
    );
  }
}
