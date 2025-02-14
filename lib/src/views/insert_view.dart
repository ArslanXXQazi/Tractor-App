import 'package:flutter/material.dart';
import 'package:tractor/src/controller/components/custom_Text.dart';

class InsertView extends StatelessWidget {
  const InsertView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: BoldText(text: "Enter Your Data"),
        centerTitle: true,
      ),
      body: Column(children: [
        TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              
            )
          ),
        )
      ],),
    );
  }
}
