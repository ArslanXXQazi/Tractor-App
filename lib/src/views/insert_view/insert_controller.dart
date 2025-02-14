
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
  TextEditingController dateController=TextEditingController();

  var isLoading = false.obs;

  Future<void> insertData()
  async{
    if(
    nameController.text.isNotEmpty&&
    timeController.text.isNotEmpty&&
    priceController.text.isNotEmpty&&
    timeController.text.isNotEmpty)
      {
        isLoading.value=true;
        
        DbClass dbClass= DbClass.instance;
        MainModel model=MainModel(
            customar_name: customar_name
            , time: time,
            price: price,
            total_price: total_price
        )

      }
  }

}