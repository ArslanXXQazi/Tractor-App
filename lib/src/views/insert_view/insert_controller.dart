
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
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
           //  Get.snackbar("Success", "Data inserted successfully!",
           //      snackPosition: SnackPosition.TOP,
           //      backgroundColor: Colors.green,
           //      colorText: Colors.white);

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
        ElegantNotification.success(
          width: 360,
          isDismissable: false,
          animationCurve: Curves.easeOut, // Smooth transition
          animationDuration: Duration(milliseconds: 500), // Slow animation
          stackedOptions: StackedOptions(
            key: 'top',
            type: StackedType.same,
            itemOffset: Offset(0, 5), // Smooth offset
          ),
          position: Alignment.topCenter,
          animation: AnimationType.fromTop,
          title: Text('Warning'),
          description: Text('Please fill all fields'),
          onDismiss: () {},
          onNotificationPressed: () {},
        ).show(Get.overlayContext ?? Get.context!);
        // Get.snackbar("Warning", "Please fill all fields",
        //     snackPosition: SnackPosition.TOP,
        //     duration: Duration(seconds: 2),
        //     backgroundColor: Colors.orange,
        //     colorText: Colors.white);
      }
  }

}