import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:to_do/const/custom_button.dart';
import 'package:to_do/controller/date_picker_controller.dart';
import 'package:to_do/controller/date_time_controller.dart';
import 'package:to_do/controller/listview_controller.dart';
import 'package:to_do/model/note_data.dart';
import 'package:to_do/controller/shared_preference_controller.dart';
import 'package:to_do/screens/add_to_do.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ListviewController listviewController = Get.put(ListviewController());
  SharedPreferenceController sharedPreferenceController =
      Get.put(SharedPreferenceController());
  DatePickerController datePickerController = Get.put(DatePickerController());
  DateTimeHandler dateTimeHandler = Get.put(DateTimeHandler());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: [
            listviewController.valueList.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height - 34,
                    child: Center(
                      child: CustomButton(
                        width: 120,
                        heiht: 45,
                        title: 'Add ToDo',
                        onPressed: () {
                          listviewController.notewordCount.value = 0;
                          Get.to(() => AddToDo());
                        },
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 20, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomButton(
                          width: 120,
                          heiht: 45,
                          title: 'Add ToDo',
                          onPressed: () {
                            listviewController.notewordCount.value = 0;
                            Get.to(() => AddToDo());
                          },
                        ),
                      ],
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                    itemCount: listviewController.valueList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Card(
                            color: Color(0XFFFFFFFF),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 16, bottom: 16),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${listviewController.valueList[index].titleText}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0XFF212121)),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '${listviewController.valueList[index].noteText}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0XFF8A8A8A)),
                                  ),
                                  //If Endate and Endtime are selected
                                  // if (datePickerController
                                  //         .dateortimepicker2.isNotEmpty &&
                                  //     dateTimeHandler.endTime.isNotEmpty)
                                  Text(
                                    '${listviewController.valueList[index].startDate} at ${listviewController.valueList[index].startTime} - ${listviewController.valueList[index].endDate} at ${listviewController.valueList[index].endTime}',
                                  ),

                                  //If EndDate and End Time are not Selected
                                  // if (datePickerController
                                  //         .dateortimepicker2.value.isEmpty &&
                                  //     dateTimeHandler.endTime.value.isEmpty)
                                  // Text(
                                  //     '${listviewController.valueList[index].startDate} at ${listviewController.valueList[index].startTime} - ${listviewController.valueList[index].startTime}',
                                  //     style: TextStyle(
                                  //         fontSize: 15,
                                  //         fontWeight: FontWeight.w400)),
                                  //If End Date is Not Selected
                                  // if (datePickerController
                                  //         .dateortimepicker2.isEmpty &&
                                  //     dateTimeHandler.endTime.isNotEmpty)
                                  // Text(
                                  //   '${listviewController.valueList[index].startDate} at ${listviewController.valueList[index].startTime.value} - ${listviewController.valueList[index].endTime.value}',
                                  //   style: TextStyle(
                                  //       fontSize: 15,
                                  //       fontWeight: FontWeight.w400),
                                  // ),
                                  //If EndTime is Not Selected
                                  // Text(
                                  //   '${listviewController.valueList[index].startDate} at ${listviewController.valueList[index].startTime.value} - ${listviewController.valueList[index].endDate.value} at ${listviewController.valueList[index].startTime.value}',
                                  //   style: TextStyle(
                                  //       fontSize: 15,
                                  //       fontWeight: FontWeight.w400),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
