import 'package:date_format/date_format.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePickerController extends GetxController {
  RxString startDate = "".obs;
  RxString endDate = "".obs;
  RxString today = "".obs;
  Rx<DateTime> selectedStartDate = Rx<DateTime>(DateTime.now());
  Rx<DateTime> selectedEndDate = Rx<DateTime>(DateTime.now());
  var selectedText = "";
  RxString titleText = RxString("");
  final RxString dateortimepicker = RxString("");
  RxString dateortimepicker2 = RxString("");
  Rx<DateTime> selectedDate2 = Rx<DateTime>(DateTime.now());

  //var dateortime;
  DateTime? selectedDate;
  Rx<DateTime> formatter = Rx<DateTime>(DateTime.now());
  Rx<DateTime> formatter2 = Rx<DateTime>(DateTime.now());
}
