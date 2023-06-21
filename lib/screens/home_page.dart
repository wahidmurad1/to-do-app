import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:to_do/const/custom_button.dart';
import 'package:to_do/controller/listview_controller.dart';
import 'package:to_do/controller/model/note_data.dart';
import 'package:to_do/controller/search_controller.dart';
import 'package:to_do/controller/shared_preference_controller.dart';
import 'package:to_do/screens/add_to_do.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ListviewController listviewController = Get.put(ListviewController());
  SearchController searchController = Get.put(SearchController());
  SharedPreferenceController sharedPreferenceController =
      Get.put(SharedPreferenceController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 237, 235, 235),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20),
                  child: CustomButton(
                    width: 120,
                    heiht: 45,
                    title: 'Add ToDo',
                    onPressed: () {
                      Get.to(() => AddToDo());
                      //print(sharedPreferenceController.myList);
                    },
                  ),
                ),
              ],
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
                                  Text(
                                    '${listviewController.valueList[index].startDate} at ${listviewController.valueList[index].startTime} - ${listviewController.valueList[index].endDate} at ${listviewController.valueList[index].endTime}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0XFF8A8A8A)),
                                  ),
                                  // Text(
                                  //   '${listviewController.valueList[index].endDate}',
                                  //   style: TextStyle(
                                  //       fontSize: 16,
                                  //       fontWeight: FontWeight.w400,
                                  //       color: Color(0XFF8A8A8A)),
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
