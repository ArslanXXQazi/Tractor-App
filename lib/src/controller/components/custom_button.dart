import 'package:flutter/material.dart';
import 'package:tractor/src/controller/components/custom_Text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.sizeOf(context).height;
    final width= MediaQuery.sizeOf(context).width;
    return  ElevatedButton(
        onPressed: ()
        {
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ,
          minimumSize: Size(width*1, height*.07),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: BoldText(text: 'Add Data',color: Colors.white,));
  }
}
