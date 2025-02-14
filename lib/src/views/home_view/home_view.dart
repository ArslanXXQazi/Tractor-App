import 'package:flutter/material.dart';
import 'package:tractor/src/controller/components/custom_Text.dart';
import 'package:tractor/src/controller/components/home_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
   final height= MediaQuery.sizeOf(context).height;
   final width= MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeContainer(
                onTap: (){},
                iconData: Icons.add,
                text: "Enter Your Data"),
            SizedBox(height: height*.05,),
            HomeContainer(
                onTap: (){},
                iconData: Icons.remove_red_eye,
                text: "View Your Data",
                color: Colors.blue,
            ),
        ],),
      ),
    );
  }
}
