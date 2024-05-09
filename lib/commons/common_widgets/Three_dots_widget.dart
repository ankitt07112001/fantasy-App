// import 'package:fantacy_user/commons/all.dart';
// // ignore: unused_import
// import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
// import 'package:flutter/material.dart';

// class Three_Dots_widget extends StatefulWidget {
//   const Three_Dots_widget({super.key});

//   @override
//   State<Three_Dots_widget> createState() => _Three_Dots_widgetState();
// }

// class _Three_Dots_widgetState extends State<Three_Dots_widget> {
//   String firstPage = "My first";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: PopupMenuButton(
//         initialValue: _selected, // add your initial value here
//         itemBuilder: (BuildContext ctx) {
//           return <PopupMenuEntry<String>>[
//             PopupMenuItem(
//               child: Text("Ankara"),
//               value: "Ankara",
//             ),
//             PopupMenuItem(
//               child: Text("İzmir"),
//               value: "İzmir",
//             ),
//           ];
//         },
//         onSelected: (String city) {
//           setState(() {
//             _selected = city;
//           });
//         },
//       )),
//     );
//     //  Get.dialog(
//     //   child: Container(
//     //     height: 237.px,
//     //     width: 161.px,
//     //     child: Column(
//     //       children: [
//     //         TextButton(onPressed: () {}, child: MyTextView("Follow")),
//     //         new Divider(
//     //           thickness: 2.px,
//     //           indent: 15.px,
//     //           endIndent: 15.px,
//     //         ),
//     //         TextButton(onPressed: () {}, child: MyTextView("Share")),
//     //         new Divider(
//     //           thickness: 2.px,
//     //           indent: 15.px,
//     //           endIndent: 15.px,
//     //         ),
//     //         TextButton(onPressed: () {}, child: MyTextView("Report")),
//     //         new Divider(
//     //           thickness: 2.px,
//     //           indent: 15.px,
//     //           endIndent: 15.px,
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
// }
