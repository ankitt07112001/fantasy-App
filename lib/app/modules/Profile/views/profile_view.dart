import 'package:fantacy_user/app/modules/Profile/controllers/profile_controller.dart';
import 'package:fantacy_user/app/routes/app_pages.dart';
import 'package:fantacy_user/commons/Headerwidget.dart';
import 'package:fantacy_user/commons/all.dart';
import 'package:fantacy_user/commons/common_widgets/mytext_widgets.dart';
import 'package:fantacy_user/responsive/scaling_query.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Payment/views/payment_view.dart';
import '../../auth/views/login.dart';
import '../../notification/views/notification_view.dart';

class Profile_view extends GetView<ProfileController> {
  const Profile_view({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: ScalingQuery(context).height,
          child: Headerwidget(
            headername: controller.title,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40.px,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.px),
                height: 132.px,
                width: 387.px,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.px,
                    ),
                    CircleAvatar(
                      radius: 50.px,
                    ),
                    SizedBox(
                      width: 10.px,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyTextView(
                          "Ankit",
                          textStyleNew: TextStyle(
                              fontSize: 20.px, fontWeight: FontWeight.w500),
                        ),
                        MyTextView("ankittiwari230399@gmail.com")
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 70.px,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.EDIT_PROFILE);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.px),
                  height: 51,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.grey, width: 0.2),
                        vertical: BorderSide(color: Colors.grey, width: 0.2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          child: Icon(Icons.contact_emergency),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: MyTextView(
                                    "Edit Profile",
                                    textStyleNew: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF3F2037),
                                        fontFamily: "Dmsans",
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.px,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.px),
                height: 51,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.grey, width: 0.2),
                      vertical: BorderSide(color: Colors.grey, width: 0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      // color: Color(0xffDDDDDD),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(0.0, 0.0),
                    )
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        child: Icon(Icons.contact_emergency),
                      ),
                      // SvgPicture.string(pushnotification)),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: MyTextView(
                                  "Push Notification",
                                  textStyleNew: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF3F2037),
                                      fontFamily: "Dmsans",
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            CupertinoSwitch(
                              value: controller.switchValue,
                              thumbColor: controller.appColors.lightpink,
                              activeColor: Colors.white,
                              trackColor: Colors.white,
                              // Current state of the switch
                              onChanged: (value) {
                                controller.switchValue =
                                    value; // Update the switch state
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.px,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.EDIT_PROFILE_FORGOT);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.px),
                  height: 51,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.grey, width: 0.2),
                        vertical: BorderSide(color: Colors.grey, width: 0.2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        // color: Color(0xffDDDDDD),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          child: Icon(Icons.contact_emergency),
                        ),
                        // SvgPicture.string(pushnotification)),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: MyTextView(
                                    "Change Password",
                                    textStyleNew: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF3F2037),
                                        fontFamily: "Dmsans",
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.px,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.px),
                height: 51,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.grey, width: 0.2),
                      vertical: BorderSide(color: Colors.grey, width: 0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      // color: Color(0xffDDDDDD),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(0.0, 0.0),
                    )
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        child: Icon(Icons.contact_emergency),
                      ),
                      // SvgPicture.string(pushnotification)),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: GestureDetector(
                                  onTap: (){
                                    Get.to(PaymentView());
                                  },
                                  child: MyTextView(
                                    "Wallet",
                                    textStyleNew: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF3F2037),
                                        fontFamily: "Dmsans",
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.px,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.px),
                height: 51,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.grey, width: 0.2),
                      vertical: BorderSide(color: Colors.grey, width: 0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      // color: Color(0xffDDDDDD),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(0.0, 0.0),
                    )
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        child: Icon(Icons.contact_emergency),
                      ),
                      // SvgPicture.string(pushnotification)),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: InkWell(
                                  onTap: (){
                                    Get.to(NotificationView());
                                  },
                                  child: MyTextView(
                                    "Notification",
                                    textStyleNew: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF3F2037),
                                        fontFamily: "Dmsans",
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.px,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.px),
                height: 51,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.grey, width: 0.2),
                      vertical: BorderSide(color: Colors.grey, width: 0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      // color: Color(0xffDDDDDD),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(0.0, 0.0),
                    )
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        child: Icon(Icons.contact_emergency),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: GestureDetector(
                                  onTap: (){
                                    Get.dialog(
                                      AlertDialog(
                                        // title: Text("Logout"),
                                        content: Text("Are you want to sure logout"),
                                        actions: <Widget>[
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                  onTap: (){
                                                    // Get.to(AuthView());
                                                  },
                                                  child: Text("Yes")),
                                              InkWell(
                                                onTap: (){
                                                  Get.back();
                                                },
                                                  child: Text("No")),
                                            ],
                                          )
                                        ],
                                      ),
                                      barrierDismissible: false,
                                    );
                                  },
                                  child: MyTextView(
                                    "Logout",
                                    textStyleNew: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF3F2037),
                                        fontFamily: "Dmsans",
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.px,
              ),
            ],
          ),
        ));
  }
}
