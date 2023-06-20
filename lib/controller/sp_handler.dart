import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/controller/listview_controller.dart';
import 'package:to_do/controller/model/note_data.dart';

class SpHandler {
  saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var v = Get.find<ListviewController>();
    final noteData = {
      "titleText": v.titleController.text,
      "noteText": v.noteController.text
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
      // final note = Note.fromJson(map);
      // print(note);
      // print("title ${note.titleText}, Note ${note.noteText}");
      // List<Map<String, dynamic>> newList = List.from(map);
      var v = Get.find<ListviewController>();
      v.valueList.value = map.map((e) => Note.fromJson(e)).toList();
      return map;
      // List<MapEntry<String, dynamic>> newList = map.entries.toList();
      // valueList.value = newList.map((e) => Note.fromJson(e)).toList();
      // List<MapEntry<String, dynamic>> newList = map.entries.toList();
      // valueList.value = newList.map((e) => Note.fromJson(e.value)).toList();
      // valueList.value = map.entries.cast<Note>().toList();
      // List newList = map.entries.map((entry) => entry.value).toList();
      // valueList.value = newList.map((e) => Note.fromJson(e)).toList();
    }
  }

  removeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('NoteData_Key');
  }
}
