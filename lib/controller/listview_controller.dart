import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/controller/date_picker_controller.dart';
import 'package:to_do/controller/date_time_controller.dart';
import 'package:to_do/model/note_data.dart';

class ListviewController extends GetxController {
  DatePickerController datePickerController = Get.put(DatePickerController());
  DateTimeHandler dateTimeHandler = Get.put(DateTimeHandler());
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  FocusNode firstTextFieldFocus = FocusNode();
  FocusNode secondTextFieldFocus = FocusNode();
  int titleWordLimit = 50;
  int noteWordLimit = 256;
  RxInt notewordCount = 0.obs;
  RxString noteId = RxString('');
  RxList valueList = RxList([]);

  @override
  void onClose() {
    // TODO: implement onClose
    firstTextFieldFocus.dispose();
    secondTextFieldFocus.dispose();
    super.onClose();
  }

  clearAllData() {
    titleController.clear();
    noteController.clear();
    datePickerController.dateortimepicker.value = "";
    datePickerController.dateortimepicker2.value = "";
    dateTimeHandler.startTime.value = "";
    dateTimeHandler.endTime.value = "";
    datePickerController.selectedStartDate.value = DateTime.now();
  }
}
