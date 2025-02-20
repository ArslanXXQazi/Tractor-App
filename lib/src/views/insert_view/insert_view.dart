import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tractor/src/controller/components/custom_Text.dart';
import 'package:tractor/src/controller/components/custom_button.dart';
import 'package:tractor/src/controller/components/custom_text_form_field.dart';
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                  text: "Name",
                  hintText: "Enter Name",
                  controller: insertController.nameController
              ),
              CustomTextFormField(
                  text: "Time",
                  hintText: "Enter Time",
                  controller: insertController.timeController
              ),
              Row(children: [
                Expanded(child:  CustomTextFormField(
                    text: "Price",
                    hintText: "Enter Price",
                    controller: insertController.priceController
                ),),
                SizedBox(width: width*.02,),
                Expanded(child:  CustomTextFormField(
                    text: "Total Price",
                    hintText: "Enter Total Price",
                    controller: insertController.totalPriceController
                ),),
              ],),
              CustomTextFormField(
                  text: "Description",
                  hintText: "Descriptions...",
                  maxLines: 3,
                  controller: insertController.descriptionController),
              SizedBox(height: height*.02,),
              Obx((){
                return insertController.isLoading.value?Center(child: CircularProgressIndicator()):
                CustomButton(
                    onTap: (){
                      insertController.insertData();

                    },
                    text: 'Add data').animate().shimmer(duration: Duration(seconds: 5.remainder(10)));
              })
          ],).animate().slideY(duration: Duration(seconds: 1)),
        ),
      ),
    );
  }
}
