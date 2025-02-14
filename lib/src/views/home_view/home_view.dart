import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
   final height= MediaQuery.sizeOf(context).height;
   final width= MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Column(children: [

        Container
          (
          height: height*3,
          width: width*.8,
          decoration: BoxDecoration(
            
          ),
        )

      ],),
    );
  }
}
