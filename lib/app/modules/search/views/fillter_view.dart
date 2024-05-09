import 'package:fantacy_user/commons/all.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';

class FillterView extends StatefulWidget {
  const FillterView({Key? key}) : super(key: key);

  @override
  FillterViewState createState() => FillterViewState();
}

class FillterViewState extends State {
  bool maleSelected = false;
  bool femaleSelected = false;
  bool allSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Filter By",
          style: MyTextStyle(textWeight: FontWeight.w400, textSize: 16),
        ).paddingOnly(right: 160).paddingAll(10),
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.pinkAccent,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        Text(
          "Gender",
          style: MyTextStyle(textWeight: FontWeight.w400, textSize: 16),
        ).paddingOnly(right: 170).paddingAll(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    maleSelected = !maleSelected;
                    femaleSelected = false;
                  });
                },
                child: Text("Male"),
                style: OutlinedButton.styleFrom(
                  backgroundColor: maleSelected ? Colors.pinkAccent : null,
                )),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  femaleSelected = !femaleSelected;
                  maleSelected = false;
                });
              },
              child: Text("Female"),
              style: OutlinedButton.styleFrom(
                backgroundColor: femaleSelected ? Colors.pinkAccent : null,
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    allSelected = !allSelected;
                    // maleSelected = false;
                    femaleSelected = false;
                  });
                },
                child: Text("All"),style: OutlinedButton.styleFrom(
              backgroundColor: allSelected ? Colors.pinkAccent : null,
            ),),
          ],
        ),
        SizedBox(height: 20),
        Text(
          "Age",
          style: MyTextStyle(textWeight: FontWeight.w400, textSize: 16),
        ).paddingOnly(right: 160).paddingAll(10),
        SliderTutorial(title: "Select Age"),
        SizedBox(height: 20),
      ],
    );
  }
}

class SliderTutorial extends StatefulWidget {
  const SliderTutorial({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SliderTutorialState createState() => _SliderTutorialState();
}

class _SliderTutorialState extends State {
  double age = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Slider(
          label: "Select Age",
          value: age,
          onChanged: (value) {
            setState(() {
              age = value;
            });
          },
          min: 5,
          max: 100,
          activeColor: Colors.pinkAccent,
          inactiveColor: Colors.grey.shade300,
        ),
        Text(
          "Your Age: ${age.toStringAsFixed(0)}",
          style: MyTextStyle(textWeight: FontWeight.w400, textSize: 16.px),
        ).paddingOnly(right: 140),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Cancle")),
            OutlinedButton(onPressed: () {}, child: Text("Apply"))
          ],
        ).paddingOnly(top: 20)
      ],
    );
  }
}
