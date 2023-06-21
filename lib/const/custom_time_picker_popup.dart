import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:to_do/const/custom_button2.dart';
import 'package:to_do/controller/time_picker_controller.dart';

class CustomSpinnerTimePickerPopUP {
  TimePickerController timePickerController = Get.put(TimePickerController());
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
            height: height - 450,
            width: width - 40,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumberPicker(
                          minValue: 0,
                          maxValue: 23,
                          value: timePickerController.hour.value,
                          zeroPad: true,
                          infiniteLoop: true,
                          itemWidth: 70,
                          itemHeight: 60,
                          onChanged: (value) {
                            timePickerController.hour.value = value;
                          },
                          textStyle:
                              const TextStyle(color: Colors.grey, fontSize: 20),
                          selectedTextStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'Euclid Regular',
                              fontWeight: FontWeight.bold),
                          decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                ),
                                bottom: BorderSide(color: Colors.grey)),
                          ),
                        ),
                        NumberPicker(
                          minValue: 0,
                          step: 5,
                          maxValue: 59,
                          value: timePickerController.minute.value,
                          zeroPad: true,
                          infiniteLoop: true,
                          itemWidth: 70,
                          itemHeight: 60,
                          onChanged: (value) {
                            timePickerController.minute.value = value;
                          },
                          textStyle:
                              const TextStyle(color: Colors.grey, fontSize: 20),
                          selectedTextStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'Euclid Regular',
                              fontWeight: FontWeight.bold),
                          decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                ),
                                bottom: BorderSide(color: Colors.grey)),
                          ),
                        ),
                      ],
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
