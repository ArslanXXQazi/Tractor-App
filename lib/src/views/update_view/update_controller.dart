
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractor/src/dbhelper/dbhelper.dart';
import 'package:tractor/src/model/main_model.dart';

class UpdateController extends GetxController
{

  TextEditingController nameController=TextEditingController();
  TextEditingController timeController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController totalPriceController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();

  var isLoading = false.obs;

  void updateData(int id) async {
    isLoading.value = true;

    MainModel updatedModel = MainModel(
      id: id,
      customar_name: nameController.text,
      time: timeController.text,
      price: priceController.text,
      total_price: totalPriceController.text,
      date: dateController.text,
      description: descriptionController.text,
    );

    int result = await dbClass.updateData(id: id, model: updatedModel);

    if (result > 0) {
      Get.snackbar("Success", "Data Updated Successfully", backgroundColor: Colors.green, colorText: Colors.white);
      Get.back(); // Update hone ke baad wapas FetchView pe chale jaye
    } else {
      Get.snackbar("Error", "Failed to Update Data", backgroundColor: Colors.red, colorText: Colors.white);
    }

    isLoading.value = false;
  }


}