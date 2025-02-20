import 'package:flutter/material.dart';
import 'package:tractor/src/controller/components/custom_Text.dart';

class HomeContainer extends StatelessWidget {
  IconData iconData;
  String text;
  VoidCallback onTap;
 // Color color;
   HomeContainer({super.key,required this.onTap,required this.iconData,required this.text,
    // this.color=Colors.green
   });

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.sizeOf(context).height;
    final width= MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap,
      child: Container
        (
        height: height*.35,
        width: width*.8,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF434343), // Charcoal Gray
              Color(0xFF6D6027), // Warm Brownish Gold
              Color(0xFFD3A42F), // Royal Gold
              Color(0xFFFFD700), // Shiny Gold
              Color(0xFFB8860B), // Dark Gold
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData,color: Colors.white,size: width*.2,),
            BoldText(text: text,color: Colors.white,),
          ],),
      ),
    );
  }
}
