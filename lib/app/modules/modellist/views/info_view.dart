import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../commons/strings.dart';

class InfoView extends GetView {
  const InfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(Strings.report,
                style: MyTextStyle(
                    textColor: Colors.white,
                    textSize: 24,
                    textWeight: FontWeight.w700))
            .paddingSymmetric(vertical: 20),
        Text(Strings.reportmsg,
                style: MyTextStyle(
                    textColor: Colors.white,
                    textSize: 18,
                    textWeight: FontWeight.w700))
            .paddingSymmetric(vertical: 20),
        Divider().paddingSymmetric(horizontal: 20),
        Text(Strings.report2,
                style: MyTextStyle(
                    textColor: Colors.white,
                    textSize: 18,
                    textWeight: FontWeight.w700))
            .paddingSymmetric(vertical: 20),
        Divider().paddingSymmetric(horizontal: 20),
        Text(Strings.report3,
                style: MyTextStyle(
                    textColor: Colors.white,
                    textSize: 18,
                    textWeight: FontWeight.w700))
            .paddingSymmetric(vertical: 20),
        Divider().paddingSymmetric(horizontal: 20),
        Text(Strings.report4,
                style: MyTextStyle(
                    textColor: Colors.white,
                    textSize: 18,
                    textWeight: FontWeight.w700))
            .paddingSymmetric(vertical: 20),
        Divider().paddingSymmetric(horizontal: 20),
        Text(Strings.report5,
                style: MyTextStyle(
                    textColor: Colors.white,
                    textSize: 18,
                    textWeight: FontWeight.w700))
            .paddingSymmetric(vertical: 20),
      ],
    );
  }
}
