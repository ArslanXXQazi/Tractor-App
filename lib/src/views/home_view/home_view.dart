import 'package:flutter/material.dart';
import 'package:tractor/src/controller/components/custom_Text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
   final height= MediaQuery.sizeOf(context).height;
   final width= MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
          Container
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
              Icon(Icons.add,color: Colors.white,size: width*.2,),
              BoldText(text: 'Enter Your Data',color: Colors.white,),
            ],),
          )

        ],),
      ),
    );
  }
}
