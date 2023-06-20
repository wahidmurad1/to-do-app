import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:to_do/const/custom_button.dart';
import 'package:to_do/const/list_view_data.dart';
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
            // ListViewData(),
            Expanded(
              child: ListView.builder(
                  itemCount: listviewController.valueList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${listviewController.valueList[index].titleText}'),
                            Text(
                                '${listviewController.valueList[index].noteText}\n'),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
