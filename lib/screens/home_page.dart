import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:to_do/const/custom_button.dart';
import 'package:to_do/const/note_data_format.dart';
import 'package:to_do/controller/date_picker_controller.dart';
import 'package:to_do/controller/date_time_controller.dart';
import 'package:to_do/controller/listview_controller.dart';
import 'package:to_do/controller/time_picker_controller.dart';
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
          children: [
            listviewController.valueList.isEmpty
                ? SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 34,
                      child: Center(
                        child: CustomButton(
                          width: 120,
                          heiht: 45,
                          title: 'Add ToDo',
                          onPressed: () {
                            datePickerController.dateortimepicker2.value = "";
                            listviewController.notewordCount.value = 0;
                            Get.to(() => AddToDo());
                          },
                        ),
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
            NoteDateFormat(),
          ],
        ),
      ),
    );
  }
}
