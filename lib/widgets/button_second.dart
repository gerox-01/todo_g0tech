import 'package:flutter/material.dart';

class ButtonStyleNormalWidget extends StatelessWidget{
  final String text;
  final VoidCallback? onPressed;

  const ButtonStyleNormalWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.1,
            vertical: size.height * 0.01,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: size.width * 0.045,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
            letterSpacing: 1.5,
          ),
        ),
    );
  }
}