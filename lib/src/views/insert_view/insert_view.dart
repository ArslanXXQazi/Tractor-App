import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tractor/src/controller/components/custom_Text.dart';
import 'package:tractor/src/controller/custom_text_form_field.dart';
import 'package:tractor/src/views/insert_view/insert_controller.dart';

class InsertView extends StatelessWidget {
  const InsertView({super.key});

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.sizeOf(context).height;
    final width= MediaQuery.sizeOf(context).width;
    InsertController insertController= Get.put(InsertController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: BoldText(text: "Enter Your Data"),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*.03,vertical: height*.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
                text: "Enter Your Name",
                hintText: "Enter Your Name",
                controller: insertController.nameController
            ),
            CustomTextFormField(
                text: "Enter Time",
                hintText: "Enter Time",
                controller: insertController.timeController
            ),
            Row(children: [
              Expanded(child:  CustomTextFormField(
                  text: "Enter Price",
                  hintText: "Enter Price",
                  controller: insertController.priceController
              ),),
              SizedBox(width: width*.02,),
              Expanded(child:  CustomTextFormField(
                  text: "Enter Total Price",
                  hintText: "Enter Total Price",
                  controller: insertController.totalPriceController
              ),),
            ],),
            SizedBox(height: height*.02,),
            ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: CupertinoColors.activeGreen,
                  minimumSize: Size(width*1, height*.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: BoldText(text: 'Add Data',color: Colors.white,))


        ],),
      ),
    );
  }
}
