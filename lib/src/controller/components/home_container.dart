import 'package:flutter/material.dart';
import 'package:tractor/src/controller/components/custom_Text.dart';

class HomeContainer extends StatelessWidget {
  IconData iconData;
  String text;
  VoidCallback onTap;
   HomeContainer({super.key,required this.onTap,required this.iconData,required this.text});

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
          color: Colors.green,
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
