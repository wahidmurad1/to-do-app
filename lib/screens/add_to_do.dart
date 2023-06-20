import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/const/custom_button.dart';
import 'package:to_do/controller/listview_controller.dart';
import 'package:to_do/controller/shared_preference_controller.dart';
import 'package:to_do/controller/sp_handler.dart';
import 'package:to_do/screens/home_page.dart';

class AddToDo extends StatelessWidget {
  AddToDo({super.key});

  SharedPreferenceController sharedPreferenceController =
      Get.put(SharedPreferenceController());
  ListviewController listviewController = Get.put(ListviewController());

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
                      child: TextField(
                        controller: listviewController.startDateController,
                        style: TextStyle(color: Colors.black),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Start date',
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
                      child: TextField(
                        controller: listviewController.startTimeController,
                        style: TextStyle(color: Colors.black),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Start time',
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
                      child: TextField(
                        controller: listviewController.endDateController,
                        style: TextStyle(color: Colors.black),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'End date',
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
                      child: TextField(
                        controller: listviewController.endTimeController,
                        style: TextStyle(color: Colors.black),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'End time',
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
                  await spHandler.saveData();
                  await spHandler.loadData();
                  // String key = searchController.titleController.text;
                  // String value = searchController.noteController.text;

                  // listviewController.saveDataToSharedPreferences(
                  //     key as Map<String, List<String>>, value);
                  // if (key.isNotEmpty && value.isNotEmpty) {
                  //   if (dataMap.containsKey(key)) {
                  //     dataMap[key]!.add(value);
                  //   } else {
                  //     dataMap[key] = [value];
                  //   }

                  //   if (dataMap[key]!.length >= 2) {
                  //     saveDataToSharedPreferences(dataMap);
                  //     dataMap[key] = [];
                  //   }
                  // }
                  // sharedPreferenceController.addData();
                  // sharedPreferenceController.getData();
                  // saveData(searchController.titleController.text,
                  //   searchController.noteController.text);
                  //sharedPreferenceController.getData();
                  // listviewController.addData();
                  // listviewController.getData();
                  //listviewController.addData();
                  // listviewController.addData();
                  // sharedPreferenceController.getData();
                  // listviewController.saveData(
                  //     searchController.titleController.text,
                  //     searchController.noteController.text);
                  listviewController.titleController.clear();
                  listviewController.noteController.clear();
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

  // Future<void> saveData(String value1, String value2) async {
  //   listviewController.myList = [value1, value2] as RxList;
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('myListKey', listviewController.myList.join('|'));
  // }

  // Future<void> retrieveData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? combinedData = prefs.getString('myListKey');
  //   if (combinedData != null) {
  //     listviewController.myList = combinedData.split('|') as RxList;
  //   }
  //   //setState(() {});
  // }

  // Future<void> saveDataToSharedPreferences(
  //     Map<String, List<String>> dataMap) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String encodedDataMap = jsonEncode(dataMap);
  //   await prefs.setString('dataMap', encodedDataMap);
  // }

  // Future<Map<String, List<String>>> getDataFromSharedPreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? encodedDataMap = prefs.getString('dataMap');

  //   if (encodedDataMap != null) {
  //     Map<String, dynamic> decodedDataMap = jsonDecode(encodedDataMap);

  //     Map<String, List<String>> dataMap = {};

  //     decodedDataMap.forEach((key, value) {
  //       dataMap[key] = List<String>.from(value);
  //     });

  //     return dataMap;
  //   } else {
  //     return {};
  //   }
  // }
}
