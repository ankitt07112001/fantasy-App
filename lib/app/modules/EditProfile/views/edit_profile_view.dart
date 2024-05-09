import 'package:fantacy_user/commons/Headerwidget.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/Edit_Profile_Widget.dart';
import 'package:fantacy_user/commons/common_widgets/button_widget.dart';
import 'package:fantacy_user/commons/common_widgets/myTextField_Widget.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:fantacy_user/commons/common_widgets/textfeild_widgets.dart';
import 'package:fantacy_user/responsive/scaling_query.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: ScalingQuery(context).height,
        child: Headerwidget(
          headername: "Edit Profile",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.px,
            ),
            Center(
                child: Stack(children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    "https://i.pinimg.com/736x/4d/d5/96/4dd5961aae2eb1c265299d4e1a27212f.jpg"),
              ),
              Positioned(
                bottom: 0,
                left: 90,
                // top: 0,
                right: 0,
                // top: 110,
                // left: 50,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: controller.appColors.darkpink,
                    ),
                    color: controller.appColors.white,
                  ),
                  child: Icon(
                    Icons.edit,
                    color: controller.appColors.darkpink,
                  ),
                ),
              ),
            ])),
            SizedBox(
              height: 60.px,
            ),
            My_TextField_Widget(
              hintname: "Enter Your Full Name",
            ),
            SizedBox(
              height: 15.px,
            ),
            My_TextField_Widget(
              hintname: "Display Name",
            ),
            SizedBox(
              height: 15.px,
            ),
            My_TextField_Widget(
              hintname: "Email",
            ),
            SizedBox(
              height: 15.px,
            ),
            My_TextField_Widget(
              hintname: "Phone Number",
            ),
            SizedBox(
              height: 50.px,
            ),
            CommonButton(
              color: controller.appColors.lightpink,
              title: 'Update',
              onTap: () {},
            ).paddingSymmetric(horizontal: 30.px)
          ],
        ),
      ),
    );
  }
}
