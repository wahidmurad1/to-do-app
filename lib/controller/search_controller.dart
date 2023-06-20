import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  // void noteData() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String data = noteController.text;
  //   await sharedPreferences.setString('titleData', data);
  //   print('Data saved to SharedPreferences: $data');
  // }
}
