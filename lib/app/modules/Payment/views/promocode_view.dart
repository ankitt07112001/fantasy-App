import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../commons/common_widgets/promocode.dart';
import '../../../../commons/strings.dart';

class PromocodeView extends GetView {
  const PromocodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(Strings.promopageheading,style: MyTextStyle(textSize: 25,textWeight: FontWeight.w700)).paddingAll(10),
        PromocodeWidget(title: '1234567890',).paddingAll(10),
        PromocodeWidget(title: '1234567890',).paddingAll(10),
      ],
    );
  }
}
