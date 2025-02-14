import 'package:flutter/material.dart';
import 'package:tractor/src/controller/components/custom_Text.dart';

class CustomTextFormField extends StatelessWidget {

  String text;
  String hintText;
  TextEditingController controller;


   CustomTextFormField({super.key,
     required this.text,
     required this.hintText,
     required this.controller,
   });

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.sizeOf(context).height;
    final width= MediaQuery.sizeOf(context).width;
    return Column(children: [
      CustomText(text: text),
      SizedBox(height: height*.01,),
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.orange),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      )
    ],);
  }
}
