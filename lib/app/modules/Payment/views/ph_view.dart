import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/common_widgets/mytext_widgets.dart';

class P_history extends GetView {
  const P_history({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 20,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 4,
          color: Colors.white,
          shadowColor: Colors.white,
          shape: RoundedRectangleBorder(
            // side: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("150 point used for 20 min call", style: MyTextStyle(textWeight: FontWeight.w600,textSize: 14)),
                  Text("\$ 100", style: MyTextStyle(textWeight: FontWeight.w600,textSize: 14))
                ],
              ).paddingSymmetric(horizontal: 10,vertical: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.emergency_recording_sharp),
                  Text("05-12-2022  10 : 39 am ")
                ],
              ).paddingSymmetric(horizontal: 10,vertical: 5)
            ],
          ),
        );
      },
    ).paddingSymmetric(horizontal: 20);
  }
}
