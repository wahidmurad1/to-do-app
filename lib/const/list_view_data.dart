// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:to_do/controller/listview_controller.dart';
// import 'package:to_do/controller/search_controller.dart';
// import 'package:to_do/screens/add_to_do.dart';

// class ListViewData extends StatelessWidget {
//   ListViewData({super.key});

//   ListviewController listviewController = Get.put(ListviewController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => ListView.builder(
//           itemCount: listviewController.myList.length,
//           itemBuilder: (context, index) {
//             return Container(
//               height: 100,
//               color: Colors.red,
//               child: Expanded(
//                 child: Text(listviewController.myList[index]),
//               ),
//             );
//           }),
//     );
//   }
// }
