import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tractor/src/views/home_view/home_view.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>HomeView()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image(image: AssetImage('assets/tractor1.png')),),
    );
  }
}
