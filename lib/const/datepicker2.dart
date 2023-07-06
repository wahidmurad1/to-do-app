import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do/controller/date_picker_controller.dart';
import 'package:to_do/controller/listview_controller.dart';

class DatePicker2 extends StatelessWidget {
  DatePicker2({
    Key? key,
    required this.isInitialDateTime,
    required this.titleText,
  }) : super(key: key);
  final bool isInitialDateTime;
  final String titleText;
  DatePickerController datePickerController = Get.put(DatePickerController());
  ListviewController listviewController = Get.put(ListviewController());

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7))))),
      onPressed: () async {
        if (datePickerController.dateortimepicker.value != '') {
          // final DateFormat formatter1 = DateFormat("yyyy-MM-dd");
          // final DateFormat formatter2 = DateFormat("dd. MMMM yyyy");
          // var data1 =
          //     formatter2.parse(datePickerController.dateortimepicker.value);
          // var data2 = formatter1.format(data1);
          // var data3 = formatter1.parse(data2);
          // datePickerController.formatter.value = data3;

          datePickerController.formatter.value =
              datePickerController.dateortimepicker.value == ''
                  ? DateTime.now()
                  : DateFormat("yyyy-MM-dd").parse(DateFormat("yyyy-MM-dd")
                      .format(DateFormat("dd. MMMM yyyy")
                          .parse(datePickerController.dateortimepicker.value)));
        }
        if (datePickerController.dateortimepicker2.value != '') {
          // final DateFormat formatter1 = DateFormat("yyyy-MM-dd");
          // final DateFormat formatter2 = DateFormat("dd. MMMM yyyy");
          // var data1 =
          //     formatter2.parse(datePickerController.dateortimepicker.value);
          // var data2 = formatter1.format(data1);
          // var data3 = formatter1.parse(data2);
          // datePickerController.formatter2.value = data3;

          datePickerController.formatter2.value = DateFormat("yyyy-MM-dd")
              .parse(DateFormat("yyyy-MM-dd").format(DateFormat("dd. MMMM yyyy")
                  .parse(datePickerController.dateortimepicker2.value)));
        }
        //start date
        if (isInitialDateTime == true) {
          DateTime? pickStartDate = await showDatePicker(
              context: context,
              initialDate: listviewController.noteId.value == ''
                  ? datePickerController.selectedStartDate.value
                  : datePickerController.formatter
                      .value, //listviewController.noteId.value!='' ? : datePickerController.selectedDate2.value
              firstDate: DateTime.now(), //DateTime(2000),
              lastDate: DateTime(2101));
          if (pickStartDate != null) {
            datePickerController.selectedDate = pickStartDate;
            datePickerController.selectedStartDate.value = pickStartDate;
            datePickerController.dateortimepicker.value =
                formatDate(pickStartDate, [dd, ".", " ", MM, " ", yyyy]);
            if (datePickerController.selectedStartDate.value
                .isAfter(datePickerController.selectedEndDate.value)) {
              datePickerController.dateortimepicker2.value = '';
            }
            // if (datePickerController.selectedEndDate.value
            //     .isBefore(pickStartDate)) {
            //   datePickerController.dateortimepicker2.value = '';
            // }
            // if (pickStartDate == DateTime.now()) {
            //   datePickerController.today.value =
            //       datePickerController.dateortimepicker.value;
            //   print(datePickerController.today);
            // }
          }
        }
        //end
        if (isInitialDateTime == false) {
          DateTime? pickEndDate = await showDatePicker(
              context: context,
              initialDate: listviewController.noteId.value == ''
                  ? (datePickerController.selectedStartDate.value
                          .isAfter(datePickerController.selectedEndDate.value)
                      ? datePickerController.selectedStartDate.value
                      : datePickerController.selectedEndDate.value)
                  : datePickerController.formatter2.value,
              firstDate: datePickerController.selectedStartDate.value,
              lastDate: DateTime(2101));
          // if (pickEndDate!.isAfter(datePickerController.selectedStartDate.value)) {
          //   datePickerController.selectedEndDate.value = pickEndDate;
          // }
          datePickerController.selectedEndDate.value = pickEndDate!;
          datePickerController.dateortimepicker2.value =
              formatDate(pickEndDate, [dd, ".", " ", MM, " ", yyyy]);
        }

        // if (datePickerController.selectedStartDate.value
        //     .isAfter(datePickerController.selectedEndDate.value)) {
        //   datePickerController.dateortimepicker2.value = '';
        // }
        // selectedStartDate.isAfter(selectedEndDate
        // if (datePickerController.selectedStartDate.value
        //     .isAfter(datePickerController.selectedEndDate.value)) {
        //   datePickerController.dateortimepicker2.value = '';
        // }

        // else if (datePickerController.selectedEndDate.value
        //     .isBefore(datePickerController.selectedStartDate.value)) {
        //   datePickerController.dateortimepicker2.value = '';
        //   print("End Data is Empty");
        //   print(datePickerController.selectedStartDate.value);
        //   print(datePickerController.selectedStartDate.value);
        //   //   // } else if (datePickerController.selectedEndDate.value
        //   //   //     .isAfter(datePickerController.selectedStartDate.value)) {
        //   //   //   print("End date is greater than start date");
        // }

        // else if (datePickerController.selectedStartDate.value
        //     .isAtSameMomentAs(datePickerController.selectedEndDate.value)) {
        //   datePickerController.dateortimepicker2.value;
        //   print("Same Date");
        // }
      },
      child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //titleText2(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedText2(),
                ],
              ),
            ],
          )),
    );
  }

  // titleText2() {
  //   if (datePickerController.selectedText == "") {
  //     return const SizedBox(height: 0);
  //   } else {
  //     //widget.boxTextString = widget.dateortimepicker;
  //     return SizedBox(
  //       height: 14,
  //       child: Center(
  //         child: Text(titleText,
  //             style: TextStyle(
  //                 fontSize: 10,
  //                 fontFamily: 'Euclid',
  //                 color: Colors.grey,
  //                 fontWeight: FontWeight.w500)),
  //       ),
  //     );
  //   }
  // }

  selectedText2() {
    if (datePickerController.dateortimepicker.value == "" &&
        isInitialDateTime == true) {
      return Center(
        child: Text(
          titleText,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
          ),
        ),
      );
    } else if (isInitialDateTime == true) {
      return Center(
        child: Text(
          datePickerController.dateortimepicker.value,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
            //fontWeight: FontWeight.w500
          ),
        ),
      );
    } else if (isInitialDateTime == false &&
        datePickerController.dateortimepicker2.value == '') {
      return Center(
        child: Text(
          titleText,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Euclid Regular',
            color: Colors.black,
          ),
        ),
      );
    }

    else if (isInitialDateTime == false &&
        datePickerController.dateortimepicker2.value != "") {
      //if (isInitialDateTime == false)
      return Text(
        datePickerController.dateortimepicker2.value,
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Euclid Regular',
          color: Colors.black,
        ),
      );
    }
    // else if (isInitialDateTime == false) {
    //   return Text(
    //     datePickerController.dateortimepicker2.value.isEmpty
    //         ? titleText
    //         : datePickerController.dateortimepicker2.value,
    //     style: TextStyle(
    //       fontSize: 14,
    //       fontFamily: 'Euclid Regular',
    //       color: Colors.black,
    //     ),
    //   );
    // }
  }
}
