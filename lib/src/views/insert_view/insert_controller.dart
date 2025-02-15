
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractor/src/dbhelper/dbhelper.dart';
import 'package:tractor/src/model/main_model.dart';

class InsertController extends GetxController
{

  TextEditingController nameController=TextEditingController();
  TextEditingController timeController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController totalPriceController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();

  var isLoading = false.obs;

  Future<void> insertData()
  async{
    if(
    nameController.text.isNotEmpty&&
    timeController.text.isNotEmpty&&
    priceController.text.isNotEmpty&&
    totalPriceController.text.isNotEmpty)
      {
       // print('alllllllllllllllllllllllllll oky');
        isLoading.value=true;
        
        DbClass dbClass= DbClass.instance;
        MainModel model=MainModel(
            customar_name: nameController.text,
            time: timeController.text,
            price: priceController.text,
            total_price: totalPriceController.text,
            description: descriptionController.text,
        );

        int check= await dbClass.modelCreate(model);
        isLoading.value=false;
        if(check==1)
          {
           // print('snacake sscschsbcsvcjdc');
            Get.snackbar("Success", "Data inserted successfully!",
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.green,
                colorText: Colors.white);

            nameController.clear();
            timeController.clear();
            priceController.clear();
            totalPriceController.clear();
            descriptionController.clear();

          }
        else
          {
          //  print('snacake errrrroroororrooror');
            Get.snackbar("Error", "Data insertion failed!",
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.red,
                colorText: Colors.white);
          }

      }
    else
      {
        Get.snackbar("Warning", "Please fill all fields",
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 2),
            backgroundColor: Colors.orange,
            colorText: Colors.white);
      }
  }

}