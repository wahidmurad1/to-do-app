import 'package:get/get.dart';
import 'package:to_do/controller/date_time_controller.dart';

class TimePickerController extends GetxController {
  var hour = 0.obs;
  var minute = 0.obs;
  RxString startTime = "".obs;
  RxString endTime = "".obs;
  var selectedText = "";
  RxString titleText = RxString("");

  DateTimeHandler dateTimeHandler = Get.put(DateTimeHandler());

  void setStartHourMin() {
    dateTimeHandler.startTime.value =
        "${hour.value.toString().padLeft(2, '0')}:${minute.value.toString().padLeft(2, '0')}";
    dateTimeHandler.addDateTime(dateTimeHandler.startTime);
    Get.back();
  }

  void setEndHourMin() {
    dateTimeHandler.endTime.value =
        "${hour.value.toString().padLeft(2, '0')}:${minute.value.toString().padLeft(2, '0')}";
    dateTimeHandler.addDateTime(dateTimeHandler.endTime);
    Get.back();
  }
}
