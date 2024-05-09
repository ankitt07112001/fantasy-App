import 'package:fantacy_user/commons/common_widgets/button_widget.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../commons/Headerwidget.dart';
import '../../../../commons/strings.dart';
import '../../../../responsive/scaling_query.dart';
import '../../Profile/views/profile_view.dart';
import '../../bottom/views/bottom_screen.dart';
import '../../home/views/home_view.dart';

class PaymentDoneView extends GetView {
  const PaymentDoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: ScalingQuery(context).height,
          child: Headerwidget(
            headername: Strings.paymenttitle,
          )),
      body: Column(
        children: [
          Center(
            child: Lottie.asset('assets/animation/lottie.json',
                height: 300, width: 300, reverse: true, fit: BoxFit.cover),
          ).paddingAll(20),
          Text(
            Strings.Success,
            style: MyTextStyle(textSize: 24, textWeight: FontWeight.w900),
          ).paddingAll(10),
          Text(
            Strings.Sucessmsg,
            textAlign: TextAlign.center,
            style: MyTextStyle(
                textSize: 16,
                textWeight: FontWeight.w400,
                textLetterSpacing: 3,
                textColor: Colors.grey),
          ),
          CommonButton(
            title: "Go back to the session",
            onTap: () {
             Get.to(BottomScreen());
            },
            isBig: true,
            radius: 30,
          ).paddingAll(20)
        ],
      ),
    );
  }
}
