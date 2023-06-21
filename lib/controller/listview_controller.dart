import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/controller/model/note_data.dart';
import 'package:to_do/controller/shared_preference_controller.dart';

class ListviewController extends GetxController {
  SharedPreferenceController sharedPreferenceController =
      Get.put(SharedPreferenceController());
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  RxList valueList = RxList([]);
}
