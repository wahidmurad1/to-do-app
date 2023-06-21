import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/controller/time_picker_controller.dart';

Widget CustomButton2(width, buttonText, startorEnd) {
  TimePickerController timePickerController = Get.put(TimePickerController());
  return TextButton(
    style: TextButton.styleFrom(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      //backgroundColor: Colors.amber,
      shape: buttonText == "Cancel"
          ? const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
              ),
            )
          : const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
              ),
            ),
    ),
    onPressed: () {
      buttonText == "Cancel"
          ? Get.back()
          : startorEnd == "Start Time"
              ? timePickerController.setStartHourMin()
              : timePickerController.setEndHourMin();
    },
    child: SizedBox(
      height: 50,
      width: (width - 60) / 2,
      child: Center(
        child: Text(buttonText),
      ),
    ),
  );
}
