import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/controller/date_picker_controller.dart';
import 'package:to_do/controller/date_time_controller.dart';
import 'package:to_do/controller/listview_controller.dart';
import 'package:to_do/model/note_data.dart';

class SpHandler {
  ListviewController listviewController = ListviewController();
  saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var v = Get.find<ListviewController>();
    var datePickerController = Get.find<DatePickerController>();
    var dateTimeHandler = Get.find<DateTimeHandler>();
    final noteData = {
      "titleText": v.titleController.text,
      "noteText": v.noteController.text,
      "startDate": datePickerController.dateortimepicker.value,
      "endDate": datePickerController.dateortimepicker2.value,
      "startTime": dateTimeHandler.startTime.value,
      "endTime": dateTimeHandler.endTime.value,
    };
    print(noteData);
    var data = await loadData();
    data.add(noteData);
    String json = jsonEncode(data);
    print('Generated Json $json');
    await prefs.setString('NoteData_Key', json);
  }

  //Load data
  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json = prefs.getString('NoteData_Key');
    print('Loaded Json $json');
    if (json == null) {
      print("No data in Shared Preferences");
      return [];
    } else {
      var map = jsonDecode(json);
      print("map $map");
      var v = Get.find<ListviewController>();
      v.valueList.value = map.map((e) => Note.fromJson(e)).toList();
      return map;
    }
  }

  removeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('NoteData_Key');
  }
}
