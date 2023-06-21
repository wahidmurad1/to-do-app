import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/controller/date_picker_controller.dart';
import 'package:to_do/controller/date_time_controller.dart';

class TimePickerController extends GetxController {
  var hour = 0.obs;
  var minute = 0.obs;
  var endHour = 0.obs;
  var endMinute = 0.obs;
  RxString startTime = "".obs;
  RxString endTime = "".obs;
  var selectedText = "";
  RxString titleText = RxString("");

  DateTimeHandler dateTimeHandler = Get.put(DateTimeHandler());
  DatePickerController datePickerController = Get.put(DatePickerController());

  void setStartHourMin() {
    dateTimeHandler.startTime.value =
        "${hour.value.toString().padLeft(2, '0')}:${minute.value.toString().padLeft(2, '0')}";
    dateTimeHandler.addDateTime(dateTimeHandler.startTime);
    Get.back();
  }

  void setEndHourMin() {
    dateTimeHandler.endTime.value =
        "${endHour.value.toString().padLeft(2, '0')}:${endMinute.value.toString().padLeft(2, '0')}";
    dateTimeHandler.addDateTime(dateTimeHandler.endTime);
    Get.back();
  }

  void timeValidation() {
    var et = endHour.value + (endMinute.value / 60);
    var st = hour.value + (minute.value / 60);
    if (datePickerController.dateortimepicker ==
            datePickerController.dateortimepicker2 &&
        (et - st) < 0) {
      dateTimeHandler.endTime.value = '';
      Get.snackbar('Required Data Not Filled Properly',
          'Plesae Fill all Required fields',
          // titleText: Text(
          //   "Not Selected",
          //   style: TextStyle(color: Colors.red),
          // ),
          // messageText: Text(
          //   "Firstly Select The Start Date",
          //   style: TextStyle(color: Colors.redAccent),
          // ),
          colorText: Colors.red,
          // backgroundColor: Colors.black54,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      setEndHourMin();
    }
  }
}
