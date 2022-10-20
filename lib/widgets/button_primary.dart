import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonStyleWidget extends StatelessWidget{
  final String text;
  final VoidCallback? onPressed;

  const ButtonStyleWidget({
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
          backgroundColor: Colors.white,
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
            color: const Color.fromRGBO(5, 59, 167, 1),
            fontSize: size.width * 0.045,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            letterSpacing: 1.5,
          ),
        ),
    );
  }
}