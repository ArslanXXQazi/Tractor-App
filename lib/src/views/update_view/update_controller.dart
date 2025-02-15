
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




}