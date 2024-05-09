import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../commons/Headerwidget.dart';
import '../../../../commons/strings.dart';
import '../../../../responsive/scaling_query.dart';

class GuidelinesView extends GetView {
  const GuidelinesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: ScalingQuery(context).height,
          child: Headerwidget(
            headername: Strings.logintitle,
          )),
    );
  }
}
