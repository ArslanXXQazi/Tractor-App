import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color color;

   CustomText({super.key,
     required this.text,
     this.fontSize=14,
     this.fontWeight=FontWeight.normal,
     this.color=Colors.black,

   });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
        fontSize:fontSize ,
        fontWeight:fontWeight ,
        color: color,
      ),
    );
  }
}

class BoldText extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color color;

 BoldText({super.key,
    required this.text,
    this.fontSize=18,
    this.fontWeight=FontWeight.bold,
    this.color=Colors.black,

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
        fontSize:fontSize ,
        fontWeight:fontWeight ,
        color: color,
      ),
    );
  }
}
