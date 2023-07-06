import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do/controller/date_picker_controller.dart';
import 'package:to_do/controller/date_time_controller.dart';
import 'package:to_do/controller/listview_controller.dart';

class TimePickerController extends GetxController {
  var hour = 0.obs;
  var minute = 0.obs;
  var endHour = 0.obs;
  var endMinute = 0.obs;
  RxString startTime = "".obs;
  RxString endTime = "".obs;
  var selectedText = "";
  RxString titleText = RxString("");
  var presentHour = DateTime.now().hour.obs;
  var presentMin = DateTime.now().minute.obs;

  Rx<DateTime> pickStartTime = Rx<DateTime>(DateTime.now());
  Rx<DateTime> pickEndTime = Rx<DateTime>(DateTime.now());
  Rx<DateTime> tempStartTime = Rx<DateTime>(DateTime.now());
  Rx<DateTime> tempEndTime = Rx<DateTime>(DateTime.now());

  DateTimeHandler dateTimeHandler = Get.put(DateTimeHandler());
  DatePickerController datePickerController = Get.put(DatePickerController());
  ListviewController listviewController = Get.put(ListviewController());

  setStartHourMin() {
    // dateTimeHandler.startTime.value =
    //     "${hour.value.toString().padLeft(2, '0')}:${minute.value.toString().padLeft(2, '0')}";
    // dateTimeHandler.addDateTime(dateTimeHandler.startTime);
    // Get.back();
    if (datePickerController.dateortimepicker.value == '') {
      return Get.snackbar('Startdate Empty', 'Please Select Start date',
          duration: Duration(milliseconds: 500),
          colorText: Colors.amberAccent,
          snackPosition: SnackPosition.BOTTOM);
    }
    if (datePickerController.dateortimepicker.value ==
        formatDate(DateTime.now(), [dd, ".", " ", MM, " ", yyyy])) {
      var initialTime = DateTime.now().hour + (DateTime.now().minute / 60);
      var selecetedTime = presentHour.value + (presentMin.value / 60);
      print(presentHour);
      if (selecetedTime - initialTime < 0) {
        dateTimeHandler.startTime.value = '';
        print(presentHour);
        return Get.snackbar('Incorrect Time', 'Please Select a valid Time',
            colorText: Colors.amberAccent, snackPosition: SnackPosition.BOTTOM);
      } else {
        dateTimeHandler.startTime.value =
            "${presentHour.value.toString().padLeft(2, '0')}:${presentMin.value.toString().padLeft(2, '0')}";
        // print(presentHour);
      }
    } else {
      dateTimeHandler.startTime.value =
          "${hour.value.toString().padLeft(2, '0')}:${minute.value.toString().padLeft(2, '0')}";
      //print(presentHour);
    }

    //dateTimeHandler.startTime.value = dateTimeHandler.startTime.value;
    Get.back();
  }

  setEndHourMin() {
    // dateTimeHandler.endTime.value =
    //     "${endHour.value.toString().padLeft(2, '0')}:${endMinute.value.toString().padLeft(2, '0')}";
    // dateTimeHandler.addDateTime(dateTimeHandler.endTime);
    // Get.back();
    if (datePickerController.dateortimepicker.value == '') {
      return Get.snackbar('Startdate Empty', 'Please Select Start date',
          duration: Duration(milliseconds: 500),
          colorText: Colors.amberAccent,
          snackPosition: SnackPosition.BOTTOM);
    }

    if (datePickerController.dateortimepicker.value ==
            datePickerController.dateortimepicker2.value ||
        datePickerController.dateortimepicker2.value == '') {
      var forTodayDate = presentHour.value + (presentMin.value / 60);
      var forFutureDate = hour.value + (minute.value / 60);
      var forEndTime = endHour.value + (endMinute.value / 60);
      if (forEndTime - forFutureDate < 0) {
        //|| forEndTime - forTodayDate < 0
        dateTimeHandler.endTime.value = '';
        print(forEndTime);
        print(forFutureDate);
        return Get.snackbar(
            'Incorrect EndTime', 'Please select a valid EndTime',
            duration: Duration(milliseconds: 500),
            colorText: Colors.amberAccent,
            snackPosition: SnackPosition.BOTTOM);
      } else if (datePickerController.dateortimepicker.value ==
              formatDate(DateTime.now(), [dd, ".", " ", MM, " ", yyyy]) &&
          forEndTime - forTodayDate < 0) {
        return Get.snackbar(
            'Incorrect EndTime', 'Please select a valid EndTime',
            duration: Duration(milliseconds: 500),
            colorText: Colors.amberAccent,
            snackPosition: SnackPosition.BOTTOM);
        // dateTimeHandler.endTime.value =
        //     "${endHour.value.toString().padLeft(2, '0')}:${endMinute.value.toString().padLeft(2, '0')}";
      } else {
        // print(forEndTime);
        // print(forFutureDate);
        dateTimeHandler.endTime.value =
            "${endHour.value.toString().padLeft(2, '0')}:${endMinute.value.toString().padLeft(2, '0')}";
      }
    } else {
      dateTimeHandler.endTime.value =
          "${endHour.value.toString().padLeft(2, '0')}:${endMinute.value.toString().padLeft(2, '0')}";
    }
    Get.back();
  }

  // void timeValidation() {
  //   var et = endHour.value + (endMinute.value / 60);
  //   var st = hour.value + (minute.value / 60);
  // if (datePickerController.dateortimepicker ==
  //         datePickerController.dateortimepicker2 &&
  //     (et - st) < 0) {
  //   dateTimeHandler.endTime.value = '';
  //   Get.snackbar('Time Invalid', 'Plesae Enter a valid Time',
  //       // titleText: Text(
  //       //   "Not Selected",
  //       //   style: TextStyle(color: Colors.red),
  //       // ),
  //       // messageText: Text(
  //       //   "Firstly Select The Start Date",
  //       //   style: TextStyle(color: Colors.redAccent),
  //       // ),
  //       colorText: Colors.red,
  //       // backgroundColor: Colors.black54,
  //       snackPosition: SnackPosition.BOTTOM);
  // } else {
  //     setEndHourMin();
  //   }
  // }

  timeValidation() {
    var et = pickEndTime.value.hour + (pickEndTime.value.minute / 60);
    var st = pickStartTime.value.hour + (pickStartTime.value.minute / 60);
    if (datePickerController.dateortimepicker.value ==
            datePickerController.dateortimepicker2.value ||
        datePickerController.dateortimepicker2.value == '' && (et - st) < 0) {
      print(st);
      print(et);
      dateTimeHandler.endTime.value = '';
      return Get.snackbar('Time Invalid', 'Plesae Enter a valid Time',
          duration: Duration(milliseconds: 1000),
          colorText: Colors.amberAccent,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      dateTimeHandler.endTime.value =
          pickEndTime.value.hour.toString().padLeft(2, '0') +
              ':' +
              pickEndTime.value.minute.toString().padLeft(2, '0');
      // Get.back();
    }
  }

  startOrEndTime(String startOrEnd) {
    var todayTime = DateTime.now().hour + (DateTime.now().minute / 60);
    var st = pickStartTime.value.hour + (pickStartTime.value.minute / 60);
    var et = pickEndTime.value.hour + (pickEndTime.value.minute / 60);
    // print(it);
    // print(st);
    // print(datePickerController.dateortimepicker.value);
    if (startOrEnd == "Start Time") {
      if (datePickerController.dateortimepicker.value ==
              formatDate(DateTime.now(), [dd, ".", " ", MM, " ", yyyy]) &&
          todayTime - st > 0) {
        Get.snackbar('Start Time Invalid', 'Plesae Enter a Valid Start Time',
            duration: Duration(milliseconds: 500),
            colorText: Colors.amberAccent,
            snackPosition: SnackPosition.BOTTOM);
      } else {
        dateTimeHandler.startTime.value =
            pickStartTime.value.hour.toString().padLeft(2, '0') +
                ':' +
                pickStartTime.value.minute.toString().padLeft(2, '0');
               
        Get.back();
      }
    } else {
      if (datePickerController.dateortimepicker.value ==
              datePickerController.dateortimepicker2.value ||
          datePickerController.dateortimepicker2.value == '' && (et - st) < 0) {
        // print(st);
        // print(et);
        dateTimeHandler.endTime.value = '';
        Get.snackbar('End Time Invalid', 'Plesae Enter a valid End Time',
            duration: Duration(milliseconds: 500),
            colorText: Colors.amberAccent,
            snackPosition: SnackPosition.BOTTOM);
      } else {
        dateTimeHandler.endTime.value =
            pickEndTime.value.hour.toString().padLeft(2, '0') +
                ':' +
                pickEndTime.value.minute.toString().padLeft(2, '0');
        Get.back();
      }
    }
  }
  selectedTimeValue(String boxString){
     // print(boxString);
    if(boxString=='Start Time'){
      // print(datePickerController.dateortimepicker.value);
      //  String formattedDate = DateFormat('yyyy-MM-dd').format(datePickerController.dateortimepicker.value);
       //print(formattedDate);
     final DateFormat formatter2 = DateFormat("dd. MMMM yyyy");
     final DateFormat formatter1 = DateFormat("yyyy-MM-dd");
          var data1 =
              formatter2.parse(datePickerController.dateortimepicker.value);
          var data2 = formatter1.format(data1);
      tempStartTime.value = DateFormat('yyyy-MM-dd HH:mm').parse(data2+" "+ dateTimeHandler.startTime.value);//
      //print( tempStartTime.value);
      return tempStartTime.value;
    }
    else{
       final DateFormat formatter2 = DateFormat("dd. MMMM yyyy");
     final DateFormat formatter1 = DateFormat("yyyy-MM-dd");
          var data1 =
              formatter2.parse(datePickerController.dateortimepicker2.value);
          var data2 = formatter1.format(data1);
      tempEndTime.value = DateFormat('yyyy-MM-dd HH:mm').parse(data2+" "+ dateTimeHandler.endTime.value);
      //print(tempEndTime.value);
      return tempEndTime.value;
    }
  }
   //tempEndTime.value = DateFormat('HH:mm').parse(dateTimeHandler.endTime.value);
    //tempStartTime.value = DateFormat('HH:mm').parse(dateTimeHandler.startTime.value);
   //print( tempStartTime.value);
}
