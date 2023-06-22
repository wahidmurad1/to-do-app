import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/controller/date_picker_controller.dart';
import 'package:to_do/controller/date_time_controller.dart';
import 'package:to_do/controller/listview_controller.dart';
import 'package:to_do/model/note_data.dart';

class SpHandler {
  ListviewController listviewController = ListviewController();
  RxString noteId = RxString('');
  var nextId;

  saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var oldList = await loadData();

    if (oldList.isEmpty) {
      nextId = '1';
      noteId.value = nextId;
      //  print(listviewController.noteId.value);
    } else {
      nextId = (oldList.length + 1).toString();
      noteId.value = nextId;
      // print('The id is ${listviewController.noteId.value}');
    }
    var v = Get.find<ListviewController>();
    var datePickerController = Get.find<DatePickerController>();
    var dateTimeHandler = Get.find<DateTimeHandler>();
    final noteData = {
      "id": nextId,
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
      // List<Map<String, dynamic>> map = List.from();
      var map = jsonDecode(json);
      print("map $map");
      var v = Get.find<ListviewController>();
      v.valueList.value = map.map((e) => Note.fromJson(e)).toList();
      return map;
    }
  }

  Future<void> editNote(Note note) async {
    var oldList = await loadData();
    for (int index = 0; index < oldList.length; index++) {
      if (listviewController.noteId.value == oldList[index]['id'].toString()) {
        oldList[index]['titleText'] = note.titleText;
        oldList[index]['noteText'] = note.noteText;
        oldList[index]['startDate'] = note.startDate;
        oldList[index]['endDate'] = note.endDate;
        oldList[index]['startTime'] = note.startTime;
        oldList[index]['endTime'] = note.endTime;
        // print(noteId.toString());
        break;
      }
    }
    print('old${oldList}');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("editNoteKey", json.encode(oldList));
    var temp = await prefs.getString("editNoteKey");
    print('after save: $temp');
  }

//   Future<void> editNote(Note note) async {
//   var oldList = await loadData();
//   for (int index = 0; index < oldList.length; index++) {
//     if (oldList[index]['id'].toString() == note.id.toString()) {
//       oldList[index] = {
//         "id": note.id,
//         "titleText": note.titleText,
//         "noteText": note.noteText,
//         "startDate": note.startDate,
//         "endDate": note.endDate,
//         "startTime": note.startTime,
//         "endTime": note.endTime,
//       };
//       break;
//     }
//   }
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString("editNoteKey", json.encode(oldList));
//   var temp = await prefs.getString("editNoteKey");
//   print('after save: $temp');
// }

  // editNote(Note note) async {
  //   var oldList = await loadData();
  //   for (int index = 1; index <= oldList.length; index++) {
  //     if (listviewController.noteId.value== note.id.toString()) {
  //       oldList[index] = {
  //         "id": note.id,
  //         "titleText": note.titleText,
  //         "noteText": note.noteText,
  //         "startDate": note.startDate,
  //         "endDate": note.endDate,
  //         "startTime": note.startTime,
  //         "endTime": note.endTime,
  //       };

  //      // oldList.add(data);
  //       oldList = await loadData();
  //     }
  //   }
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString("editNoteKey", json.encode(oldList));
  //   var temp = await prefs.getString("editNoteKey");
  //   print('after save' + temp.toString());
  // }

  removeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('NoteData_Key');
  }
}
