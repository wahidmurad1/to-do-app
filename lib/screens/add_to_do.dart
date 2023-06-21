import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/const/custom_button.dart';
import 'package:to_do/const/custom_time_picker.dart';
import 'package:to_do/const/datepicker2.dart';
import 'package:to_do/controller/date_picker_controller.dart';
import 'package:to_do/controller/date_time_controller.dart';
import 'package:to_do/controller/listview_controller.dart';
import 'package:to_do/controller/shared_preference_controller.dart';
import 'package:to_do/controller/sp_handler.dart';
import 'package:to_do/screens/home_page.dart';
import 'package:date_format/date_format.dart';

class AddToDo extends StatelessWidget {
  AddToDo({super.key});

  SharedPreferenceController sharedPreferenceController =
      Get.put(SharedPreferenceController());
  ListviewController listviewController = Get.put(ListviewController());
  DatePickerController datePickerController = Get.put(DatePickerController());
  DateTimeHandler dateTimeHandler = Get.put(DateTimeHandler());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Text(
                        'Add ToDo',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: Divider(
                  thickness: 2,
                  height: 1,
                  color: Color(0XFFDCDCDC),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10)
                        .copyWith(bottom: 0),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0XFFD1D5DB)),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    maxLines: 1,
                    controller: listviewController.titleController,
                    style: TextStyle(color: Colors.black),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Write task title',
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      contentPadding: EdgeInsets.fromLTRB(
                        12,
                        6,
                        10,
                        12,
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10)
                        .copyWith(bottom: 0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0XFFD1D5DB)),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    maxLines: 7,
                    controller: listviewController.noteController,
                    style: TextStyle(color: Colors.black),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Write task note',
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      contentPadding: EdgeInsets.fromLTRB(
                        12,
                        6,
                        10,
                        12,
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              //start date and time
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10)
                        .copyWith(bottom: 0),
                child: Row(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      height: 48,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0XFFD1D5DB)),
                          borderRadius: BorderRadius.circular(10)),
                      child: DatePicker2(
                          isInitialDateTime: true, titleText: 'Start Date'),
                    ),
                    //Start Time
                    SizedBox(
                      width: 10,
                    ),

                    Container(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      height: 48,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0XFFD1D5DB)),
                          borderRadius: BorderRadius.circular(10)),
                      child: CustomTimePicker(
                          boxTextString: 'Start Time',
                          timePicker: dateTimeHandler.startTime),
                    ),
                  ],
                ),
              ),

              //end date and time
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10)
                        .copyWith(bottom: 0),
                child: Row(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      height: 48,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0XFFD1D5DB)),
                          borderRadius: BorderRadius.circular(10)),
                      child: DatePicker2(
                          isInitialDateTime: false, titleText: 'End Date'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      height: 48,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0XFFD1D5DB)),
                          borderRadius: BorderRadius.circular(10)),
                      child: CustomTimePicker(
                          boxTextString: 'End Time',
                          timePicker: dateTimeHandler.endTime),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              CustomButton(
                width: 200,
                heiht: 48,
                title: 'Add',
                onPressed: () async {
                  SpHandler spHandler = SpHandler();

                  if (listviewController.titleController.text == '' ||
                      listviewController.noteController.text == '' ||
                      datePickerController.dateortimepicker.value == "" ||
                      datePickerController.dateortimepicker2.value == "" ||
                      dateTimeHandler.startTime.value == "" ||
                      dateTimeHandler.endTime.value == "") {
                  } else {
                    await spHandler.saveData();
                    await spHandler.loadData();
                  }

                  listviewController.titleController.clear();
                  listviewController.noteController.clear();
                  datePickerController.dateortimepicker.value = "";
                  datePickerController.dateortimepicker2.value = "";
                  datePickerController.selectedStartDate.value = DateTime.now();
                  dateTimeHandler.startTime.value = "";
                  dateTimeHandler.endTime.value = "";
                  Get.to(() => HomePage());
                  // print(listviewController.myList);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
