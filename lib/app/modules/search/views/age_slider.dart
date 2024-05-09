// import 'package:fantacy_user/api_repository/api_function.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:fantacy_user/app/modules/search/views/range_slider.dart';
// import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
//
// class FillterView extends StatelessWidget {
//   const FillterView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Filter By",
//           style: MyTextStyle(textWeight: FontWeight.w400, textSize: 16),
//         ).paddingOnly(right: 160).paddingAll(10),
//         RatingBar.builder(
//           initialRating: 3,
//           minRating: 1,
//           direction: Axis.horizontal,
//           allowHalfRating: true,
//           itemCount: 5,
//           itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//           itemBuilder: (context, _) => Icon(
//             Icons.star,
//             color: Colors.pinkAccent,
//           ),
//           onRatingUpdate: (rating) {
//             print(rating);
//           },
//         ),
//         Text(
//           "Gender",
//           style: MyTextStyle(textWeight: FontWeight.w400, textSize: 16),
//         ).paddingOnly(right: 170).paddingAll(10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             OutlinedButton(onPressed: () {}, child: Text("Male")),
//             OutlinedButton(onPressed: () {}, child: Text("Female")),
//             OutlinedButton(onPressed: () {}, child: Text("All")),
//           ],
//         ),
//         SizedBox(height: 20),
//         Text(
//           "Age",
//           style: MyTextStyle(textWeight: FontWeight.w400, textSize: 16),
//         ).paddingOnly(right: 160).paddingAll(10),
//         SliderTutorial(title: "Select Age"),
//         SizedBox(height: 20),
//         RangeSliderExample(), // Include your RangeSlider here
//       ],
//     );
//   }
// }
//
// class SliderTutorial extends StatefulWidget {
//   const SliderTutorial({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _SliderTutorialState createState() => _SliderTutorialState();
// }
//
// class _SliderTutorialState extends State{
//   double age = 10;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Slider(
//           label: "Select Age",
//           value: age,
//           onChanged: (value) {
//             setState(() {
//               age = value;
//             });
//           },
//           min: 5,
//           max: 100,
//         ),
//         Text(
//           "Your Age: ${age.toStringAsFixed(0)}",
//           style: TextStyle(fontSize: 24.0),
//         ),
//       ],
//     );
//   }
// }
//
