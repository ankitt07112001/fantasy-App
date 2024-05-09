import 'package:fantacy_user/commons/common_widgets/button_widget.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:fantacy_user/commons/imagepath.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../commons/Headerwidget.dart';
import '../../../../commons/strings.dart';
import '../../../../responsive/scaling_query.dart';
import '../../bottom/views/bottom_screen.dart';

class PrivacyView extends GetView {
  const PrivacyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: ScalingQuery(context).height,
            child: Headerwidget(
              headername: Strings.privacy,
            )),
        body: Column(
          children: [
            Center(
                child: Image.asset(ImagePath.privacy)
                    .paddingAll(30)
                    .paddingOnly(top: 40)),
            Text(
              Strings.privacyinfo,
              textAlign: TextAlign.center,
              style: MyTextStyle(textSize: 32, textWeight: FontWeight.w600),
            ).paddingAll(20),
            Text(
              Strings.information,
              textAlign: TextAlign.center,
            ).paddingAll(25),
            CommonButton(
              title: Strings.accept,
              onTap: () {
                Get.to(BottomScreen());
              },
              isSmall: true,
              radius: 30,
              color: Colors.pinkAccent,
            ).paddingOnly(left: 100)
          ],
        ),
      ),
    );
  }
}
