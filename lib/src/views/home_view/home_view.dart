import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tractor/src/controller/components/custom_Text.dart';
import 'package:tractor/src/controller/components/home_container.dart';
import 'package:tractor/src/views/fetch_view/fetch_view.dart';
import 'package:tractor/src/views/insert_view/insert_view.dart';

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
                onTap: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=>InsertView()));
                },
                iconData: Icons.add,
                text: "Enter Your Data"),
            SizedBox(height: height*.05,),
            HomeContainer(
                onTap: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=>FetchView()));
                },
                iconData: Icons.remove_red_eye,
                text: "View Your Data",
                color: Colors.blue,
            ),
        ],).animate().scale(duration: Duration(seconds: 1)),
      ),
    );
  }
}
