import 'package:flutter/material.dart';
import 'package:tractor/src/controller/components/custom_Text.dart';
import 'package:tractor/src/dbhelper/dbhelper.dart';
import 'package:tractor/src/model/main_model.dart';

class FetchView extends StatefulWidget {
  const FetchView({super.key});

  @override
  State<FetchView> createState() => _FetchViewState();
}

class _FetchViewState extends State<FetchView> {
  @override
  DbClass dbClass=DbClass.instance;
  List<MainModel> data = [];



  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: BoldText(text: 'Customar Detail'),
      ),
    );
  }
}
