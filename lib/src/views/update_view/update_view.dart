import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tractor/src/controller/components/custom_Text.dart';
import 'package:tractor/src/controller/components/custom_button.dart';
import 'package:tractor/src/controller/components/custom_text_form_field.dart';
import 'package:tractor/src/views/insert_view/insert_controller.dart';
import 'package:tractor/src/views/update_view/update_controller.dart';

class UpdateView extends StatefulWidget {

  String customar_name;
  String time;
  String price;
  String total_price;
  int  id;
  String? date;
  String description;

   UpdateView({super.key,
     required this.customar_name,
     required this.time,
     required this.price,
     required this.total_price,
     required this.id,
     this.date,
     required this.description,
   });

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  @override

  TextEditingController nameController=       TextEditingController();
  TextEditingController timeController=       TextEditingController();
  TextEditingController priceController=      TextEditingController();
  TextEditingController totalPriceController= TextEditingController();
  TextEditingController descriptionController=TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text=widget.customar_name;
    timeController.text=widget.time;
    priceController.text=widget.price;
    totalPriceController.text=widget.total_price;

  }







  Widget build(BuildContext context) {
    final height= MediaQuery.sizeOf(context).height;
    final width= MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: BoldText(text: "Update Your Data"),
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
                  controller: updateController.nameController
              ),
              CustomTextFormField(
                  text: "Time",
                  hintText: "Enter Time",
                  controller: updateController.timeController
              ),
              Row(children: [
                Expanded(child:  CustomTextFormField(
                    text: "Price",
                    hintText: "Enter Price",
                    controller: updateController.priceController
                ),),
                SizedBox(width: width*.02,),
                Expanded(child:  CustomTextFormField(
                    text: "Total Price",
                    hintText: "Enter Total Price",
                    controller: updateController.totalPriceController
                ),),
              ],),
              CustomTextFormField(
                  text: "Description",
                  hintText: "Descriptions...",
                  maxLines: 3,
                  controller: updateController.descriptionController),
              SizedBox(height: height*.02,),
              CustomButton(
                  onTap: (){
                    updateController.updateData(widget.id);
                  },
                  text: "Update Data")
            ],),
        ),
      ),
    );
  }
}
