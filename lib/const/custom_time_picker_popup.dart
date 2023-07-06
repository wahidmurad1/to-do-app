import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:to_do/const/custom_button2.dart';
import 'package:to_do/controller/date_picker_controller.dart';
import 'package:to_do/controller/date_time_controller.dart';
import 'package:to_do/controller/listview_controller.dart';
import 'package:to_do/controller/time_picker_controller.dart';

class CustomSpinnerTimePickerPopUP {
  ListviewController listviewController = Get.put(ListviewController());
  TimePickerController timePickerController = Get.put(TimePickerController());
  DatePickerController datePickerController = Get.put(DatePickerController());
  DateTimeHandler dateTimeHandler = Get.put(DateTimeHandler());
  timePickerPopUP(context, boxText) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            height: height / 3,
            width: width - 59,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child:Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Obx(() => Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              //TimePickerSpinner
                                              TimePickerSpinner(
                                                  isShowSeconds: false, 
                                                is24HourMode: true,
                                                normalTextStyle:
                                                    TextStyle(fontSize: 24, color: Colors.black),
                                                highlightedTextStyle:
                                                    TextStyle(fontSize: 24, color: Colors.blue),
                                                itemWidth: 70,
                                                itemHeight: 60,
                                                spacing: 70,
                                                minutesInterval: 5,
                                                isForce2Digits: true,
                                                time: listviewController.noteId.value== '' ? (boxText=="Start Time" ? timePickerController.pickStartTime.value:timePickerController.pickEndTime.value):timePickerController.selectedTimeValue(boxText),
                                              onTimeChange: (value) {
                                                if(boxText=="Start Time"){
                                                   timePickerController.pickStartTime.value = value;
                                                }
                                          else{
                                              timePickerController.pickEndTime.value = value;
                                          }
                            },
                          ),
                         
                        ],
                      ),
                    ),
                 
                  ),
                  
                ),
                Container(
                  color: Colors.black54,
                  height: 0.8,
                  width: width - 40,
                ),
                Row(
                  children: [
                    CustomButton2(width, "Cancel", boxText),
                    Container(
                      width: 0.8,
                      height: 60,
                      color: Colors.black54,
                    ),
                    CustomButton2(width, "Submit", boxText)
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}


// boxText == "Start Time"
//                                 ? (datePickerController
                                //             .dateortimepicker.value ==
                                //         formatDate(DateTime.now(),
                                //             [dd, ".", " ", MM, " ", yyyy])
                                //     ? timePickerController.presentHour.value =
                                //         value
                                //     : timePickerController.hour.value = value)
                                // : timePickerController.endHour.value = value;