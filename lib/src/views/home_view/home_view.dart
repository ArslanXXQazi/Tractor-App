import 'package:flutter/material.dart';

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
            child: Center(child: Column(children: [
              Icon(Icons.add,color: Colors.white,)
            ],),),
          )

        ],),
      ),
    );
  }
}
