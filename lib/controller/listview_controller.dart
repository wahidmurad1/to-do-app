import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/controller/model/note_data.dart';
import 'package:to_do/controller/shared_preference_controller.dart';

class ListviewController extends GetxController {
  SharedPreferenceController sharedPreferenceController =
      Get.put(SharedPreferenceController());
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  //RxList addTodo = [].obs;
  //RxList myList = RxList([]);
  RxList valueList = RxList([]);
  // List<String> dataList = [];
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   getData();
  //   //addData();
  // }

  // Future<void> saveData(String value1, String value2) async {
  //   dataList = [value1, value2];
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.setString("myListKey", dataList.join('|'));
  //   update();
  // }

  // Future<void> retrieveData() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String? combinedData = sharedPreferences.getString('myListKey');
  //   if (combinedData != null) {
  //     dataList = combinedData.split('|');
  //     update();
  //   }
  // }

  //Save Data

//   //List of map Encode
//   Future<void> saveDataToSharedPreferences(
//       Map<String, List<String>> dataMap, String value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     Map<String, dynamic> encodedDataMap = {};

//     dataMap.forEach((key, value) {
//       encodedDataMap[key] = value.toList();
//     });
//     await prefs.setString('dataMap', jsonEncode(encodedDataMap));
//     print("Data Saved in Shared Preferences");
//   }

// //decode
//   Future<Map<String, List<String>>> getDataFromSharedPreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? encodedDataMap = prefs.getString('dataMap');

//     if (encodedDataMap != null) {
//       Map<String, dynamic> decodedDataMap = jsonDecode(encodedDataMap);

//       Map<String, List<String>> dataMap = {};

//       decodedDataMap.forEach((key, value) {
//         dataMap[key] = List<String>.from(value);
//         print("Data Saved to Shared Preferences");
//       });

//       return dataMap;
//     } else {
//       return {};
//     }
//   }

  // void addData() async {
  // {
  //   'titler':searchController.titleController.text,
  //   'note':searchController.noteController.text,
  // }
  // options.add(newData);
  // if (newData.toString().trim() != '') {
  //String data = await sharedPreferenceController.getData();
  //print(data);
  // myList.add(searchController.titleController.toString().trim());
  // }
  // sharedPreferenceController.myList
  //     .add(searchController.titleController.text);
  // sharedPreferenceController.myList.add(searchController.noteController.text);
  // myList.add(searchController.titleController.text);
  // myList.add(searchController.noteController.text);
  // String
  //   update();
  // }

  // void saveDataToSharedPreferences() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   //sharedPreferences.setStringList('myList', myList.toList());
  //   update();
  //   print("Hi2");
  // }

  // void addToRxList() {
  //   String value = searchController.titleController.text;
  //   myList.add(value);
  //   searchController.titleController.clear();
  //   saveDataToSharedPreferences(); // Save the updated list to SharedPreferences
  //   print("Hi3");
  // }

  // addData2() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String data = searchController.titleController.text;
  //   String data2 = searchController.noteController.text;
  //   // myList.add(searchController.titleController.text);
  //   // myList.add(searchController.noteController.text);
  //   // print(data);
  //   // print(data2);
  //   await sharedPreferences.setString(
  //       'titleData', searchController.titleController.text);
  //   await sharedPreferences.setString(
  //       'noteData', searchController.noteController.text);
  //   myList.add(searchController.titleController.text);
  //   myList.add(searchController.noteController.text);
  //   print('Data saved to SharedPreferences: $data');
  //   print('Data saved to SharedPreferences: $data2');
  //   //update();
  // }

  // getData() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  //   // String? value100 = await sharedPreferences.getString('titleData');
  //   // String? value200 = await sharedPreferences.getString('noteData');
  //   // print(await sharedPreferences.getString('titleData'));
  // }
}
