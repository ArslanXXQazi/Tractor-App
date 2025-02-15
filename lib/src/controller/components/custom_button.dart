import 'package:flutter/material.dart';
import 'package:tractor/src/controller/components/custom_Text.dart';

class CustomButton extends StatelessWidget {

  String text;
  Color color;
  VoidCallback onTap;

 CustomButton({super.key,
   required this.onTap,
   required this.text,
   this.color=Colors.green
 });

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.sizeOf(context).height;
    final width= MediaQuery.sizeOf(context).width;
    return  ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(width*1, height*.07),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: BoldText(text: text,color: Colors.white,));
  }
}
